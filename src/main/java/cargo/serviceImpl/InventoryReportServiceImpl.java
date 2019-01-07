package cargo.serviceImpl;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import cargo.domain.GoodsDeliveriedNoteDetail;
import cargo.domain.GoodsReceiptNoteDetail;
import cargo.domain.InventoryReport;
import cargo.domain.InventoryReportHistory;
import cargo.dto.ResultOfCaclPeriod;
import cargo.layout.support.web.InventoryReportFillterBy;
import cargo.layout.support.web.InventoryReportSearch;
import cargo.repository.InventoryReportHistoryReposiory;
import cargo.repository.InventoryReportRepository;
import cargo.service.InventoryReportService;

@Service
public class InventoryReportServiceImpl implements InventoryReportService{

	
	@Autowired
	private InventoryReportRepository repository;
	
	@Autowired
	private InventoryReportHistoryReposiory inventoryReportHistoryrepository;
	@Override
	public Page<InventoryReport> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return repository.findAll(pageable);
	}

	@Override
	public Page<InventoryReport> find(InventoryReportSearch searchModel,
			Pageable pageable) {
		StringBuilder whereClause = new StringBuilder(" WHERE 1=1 ");
		if(!StringUtils.isEmpty(searchModel.getLogicwarehouse())){
			whereClause.append( " AND LogicWarehouseId = '" +searchModel.getLogicwarehouse() +"'");
		}
		if(!StringUtils.isEmpty(searchModel.getKeyword())){
			whereClause .append (" AND ( lower(ProductName) like  lower('%" + searchModel.getKeyword()+"%') ");
			whereClause .append (" OR ProductCode like '%" + searchModel.getKeyword()+"%' )");
		}
		
		if(searchModel.getFillterBy() ==InventoryReportFillterBy.byDate){
			whereClause.append( " AND CreateDate < DATE_ADD('"+searchModel.getForDate()+"', INTERVAL 1 DAY) ");
		}
		if(searchModel.getFillterBy() ==InventoryReportFillterBy.byPeriod){
			 InventoryReportHistory s = inventoryReportHistoryrepository.findOne(searchModel.getForPeriod());
			if(s.getId()>0){
			whereClause.append( " AND CreateDate > DATE_ADD('"+s.getBeginning_date()+"', INTERVAL -1 DAY) ");
			whereClause.append( " AND CreateDate < DATE_ADD('"+s.getEnding_date()+"', INTERVAL +1 DAY) ");
		   }
			//whereClause.append( " AND CreateDate <= '" +searchModel.getLogicwarehouse() +"'");
		}
		
		//System.out.println(whereClause);
		return repository.findQuery(whereClause.toString(), pageable);
	}

	@Override
	public void insert(InventoryReport report) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void insert(GoodsReceiptNoteDetail detail,String warehouse) {
		// TODO Auto-generated method stub
		try{
			InventoryReport lastPeriod=this.findlastPeriod(warehouse, detail.getProductId());
			InventoryReport newReport=new InventoryReport().setNewVal();
			//System.out.println("last report:--"+lastPeriod);
			if(null!=lastPeriod){
				newReport.setPriceBeginning(lastPeriod.getPriceEnding());
				newReport.setQtyBeginning(lastPeriod.getQtyEnding());
			}
			newReport.setLogicWarehouseId(warehouse);
			newReport.setProductId(detail.getProductId());
			newReport.setProductCode(detail.getProductCode());
			newReport.setProductName(detail.getProductName());
			newReport.setPriceImport(detail.getPrice());
			newReport.setQtyImport(detail.getRealQuantity());
			newReport.setId(null);
			//System.out.println(newReport);
			repository.save(newReport);
			
		}catch(RuntimeException e){
			 throw new RuntimeException("Rollback this transaction InventoryReportServiceImpl!");
		}
		
	}

	@Override
	public InventoryReport findlastPeriod(String warehouse, String productid) {
		return repository.findlastPeriod(warehouse, productid);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void insert(GoodsDeliveriedNoteDetail detail,
			String fromLogicWarehouse) {
		try{
			InventoryReport lastPeriod=this.findlastPeriod(fromLogicWarehouse, detail.getProductId());
			InventoryReport newReport=new InventoryReport().setNewVal();
			System.out.println("last report:--"+lastPeriod);
			if(null!=lastPeriod){
				newReport.setPriceBeginning(lastPeriod.getPriceEnding());
				newReport.setQtyBeginning(lastPeriod.getQtyEnding());
			}
			newReport.setLogicWarehouseId(fromLogicWarehouse);
			newReport.setProductId(detail.getProductId());
			newReport.setProductCode(detail.getProductCode());
			newReport.setProductName(detail.getProductName());
			newReport.setPriceExport(detail.getPrice());
			newReport.setQtyExport(detail.getRealQuantity());
			newReport.setId(null);
			System.out.println(newReport);
			repository.save(newReport);
			
		}catch(RuntimeException e){
			 throw new RuntimeException("Rollback this transaction InventoryReportServiceImpl!");
		}
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public InventoryReportHistory closePeriod(String name) {
		InventoryReportHistory history= inventoryReportHistoryrepository.findLast();
		Date nextCurrentDateToClose=this.plusOneDay(history.getEnding_date());
		InventoryReportHistory newhistory=new InventoryReportHistory(null,
																	name,
																	nextCurrentDateToClose,
																	this.get_lastDayOfDate(nextCurrentDateToClose));
		this.updateAfterClosePeriod(newhistory);//updating Inventory report
		newhistory= inventoryReportHistoryrepository.save(newhistory);//save history to database
		
		
		return  newhistory;
	}

	@Override
	public boolean checked_time_closePeriod() {
		InventoryReportHistory history= inventoryReportHistoryrepository.findLast();
		if(null == history){
			return false;
		}else{
			//Date NextCloseDay=this.plusOneDay(history.getEnding_date());
			Date firstDayOfNowMonth=get_firstDayOfDate(new Date());
			//System.out.println(firstDayOfNowMonth);
		//	System.out.println(this.plusOneDay(history.getEnding_date()));
			if(firstDayOfNowMonth.after(this.plusOneDay(history.getEnding_date()))){//ending +1day >> 
				return true;
			}
		}
		return false;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	private void updateAfterClosePeriod(InventoryReportHistory newhistory){
		//List<ResultOfCaclPeriod> resultCalcPeriod=repository.updateInventoryReportAfterCaclPeriod(newhistory.getBeginning_date(),newhistory.getEnding_date());
		StringBuilder sql=new StringBuilder();
		sql.append("select LogicWarehouseId,ProductId,PriceBeginning,QtyBeginning, QtyBeginning + sum(QtyImport) - sum(QtyExport) as QtyEnding,");
		sql.append("((QtyBeginning * PriceBeginning + sum(QtyImport*PriceImport) )/(QtyBeginning + sum(QtyImport))) as PriceEnding");
		sql.append(" from tb_inventory_report ");
		sql.append("where  CreateDate > date_add(?,interval -1 day)  and  CreateDate < date_add(?,interval +1 day) ");
		sql.append(" group by LogicWarehouseId,ProductId,QtyBeginning,PriceBeginning; ");
		List<ResultOfCaclPeriod> resultOfCaclPeriod= repository.getJdbcTemplate().query(sql.toString(), 
							new Object[]{newhistory.getBeginning_date(),newhistory.getEnding_date()}, ResultOfCaclPeriod.ROW_MAPPER) ;
		
		
		if(resultOfCaclPeriod!=null){
			for(int i=0;i<resultOfCaclPeriod.size();i++){
				/*if(resultOfCaclPeriod.get(i).getProductId().equals("8930001002166")){
					System.out.println(resultOfCaclPeriod.get(i).toString());
				}*/
				this.UpdateInventoryReport(resultOfCaclPeriod.get(i),newhistory.getBeginning_date(),newhistory.getEnding_date());
			}
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	private void UpdateInventoryReport(ResultOfCaclPeriod dto,Date begin,Date ending){
		StringBuilder sql=new StringBuilder();
		sql.append("UPDATE tb_inventory_report ");
		sql.append("set   QtyEnding =?, ");
		sql.append("PriceEnding =?, ");
		sql.append("PriceExport =? ");
		sql.append(" where LogicWarehouseId = ? ");
		sql.append(" and ProductId = ? ");
		sql.append(" and CreateDate > date_add(?,interval -1 day) ");
		sql.append(" and  CreateDate < date_add(?,interval +1 day)  ");
		repository.getJdbcTemplate().update(sql.toString(),new Object[]{dto.getQtyEnding(),dto.getPriceEnding(),dto.getPriceEnding()
																		,dto.getLogicWarehouseId(),dto.getProductId(),begin,ending}) ;
	}
	private Date get_firstDayOfDate(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		 return cal.getTime();
	}
	private Date get_lastDayOfDate(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		 return cal.getTime();
	}
	private Date plusOneDay(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add( Calendar.DATE, 1 );
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		 return cal.getTime();
	}
	
}
