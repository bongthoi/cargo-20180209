package cargo.serviceImpl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteReport;
import cargo.domain.GoodsDeliveriedNote;
import cargo.domain.GoodsDeliveriedNoteDetail;
import cargo.domain.Inventory;
import cargo.layout.support.web.Googs;
import cargo.repository.GoodsDeliveriedNoteDetailRepository;
import cargo.repository.GoodsDeliveriedNoteRepository;
import cargo.repository.InventoryRepository;
import cargo.service.IGoodsDeliveriedNote;
import cargo.service.InventoryReportService;

@Service
public class IGoodsDeliveriedNoteImpl implements IGoodsDeliveriedNote{

	@Autowired
	private GoodsDeliveriedNoteRepository goodsDeliveriedNoteRepository;
	
	@Autowired
	private GoodsDeliveriedNoteDetailRepository goodsDeliveriedNoteDetailRepository;
	
	@Autowired
	private InventoryRepository inventoryRepository;
	
	@Autowired
	private InventoryReportService inventoryReportService;
	@Override
	public Page<GoodsDeliveriedNote> findAll(Pageable page) {
		// TODO Auto-generated method stub
		return goodsDeliveriedNoteRepository.findAll(page);
	}

	/* (non-Javadoc)
	 * @see cargo.service.IGoodsDeliveriedNote#findByid(java.lang.String)
	 * return have details;
	 */
	@Override
	
	public GoodsDeliveriedNote findByid(String id) {
		// TODO Auto-generated method stub
				if(goodsDeliveriedNoteRepository.exists(id)){
					GoodsDeliveriedNote goodsDeliveriedNote =goodsDeliveriedNoteRepository.findOne(id);
					goodsDeliveriedNote.setGoodsDeliveriedNoteDetails(goodsDeliveriedNoteDetailRepository
												.findWhereQuery(" WHERE 1=1 and GoodsDeliveriedNoteId ='"+goodsDeliveriedNote.getId()+"' "));
					return goodsDeliveriedNote;
				}
				return null;
	}

	@Override
	public String GenarateId() {
		// TODO Auto-generated method stub
		return goodsDeliveriedNoteRepository.GenarateId();
	}

	@Override
	public GoodsDeliveriedNote save(GoodsDeliveriedNote goodsDeliveriedNote) {
		if(goodsDeliveriedNote.getGoodsDeliveriedNoteDetails()!=null){
			int TotalQuantity=0;
			BigDecimal TotalAmount=new BigDecimal(0);
			for (int i=0;i<goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().size();i++) {
				GoodsDeliveriedNoteDetail detail=goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().get(i);
				if(detail.getIsDelete()==0){//chua xoa
					BigDecimal detailAmount=new BigDecimal(detail.getRealQuantity() * detail.getPrice().doubleValue());
					TotalAmount = TotalAmount.add(detailAmount);//++totalamount
					TotalQuantity += detail.getRealQuantity();//++totalquantity
					detail.setAmount(detailAmount);
					detail.setGoodsDeliveriedNoteId(goodsDeliveriedNote.getId());
					//System.out.println(detail.toString());
					goodsDeliveriedNoteDetailRepository.save(detail);
				}else{
					if(detail.getId()!=null){
						goodsDeliveriedNoteDetailRepository.delete(detail.getId());//delete detail
					}
				}//end if isdelete
			}//end foreach
			goodsDeliveriedNote.setTotalAmount(TotalAmount);
			goodsDeliveriedNote.setTotalQuantity(TotalQuantity);
			return goodsDeliveriedNoteRepository.save(goodsDeliveriedNote);
		}//end if detail size
		return new GoodsDeliveriedNote();
	}

	@Override
	public GoodsDeliveriedNote findOne(String id) {
		// TODO Auto-generated method stub
		return goodsDeliveriedNoteRepository.findOne(id);
	}

	@Override
	public boolean exists(String id) {
		// TODO Auto-generated method stub
		return goodsDeliveriedNoteRepository.exists(id);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public GoodsDeliveriedNote waiting(GoodsDeliveriedNote goodsDeliveriedNote) {
		/*step 1 set flag checkNotEnoughItem n*/
		if(goodsDeliveriedNote.getGoodsDeliveriedNoteDetails()!=null){
			for (int i=0;i<goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().size();i++) {
				GoodsDeliveriedNoteDetail detail=goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().get(i);
				Object[] pk_inventory=new Object[] {goodsDeliveriedNote.getFromLogicWarehouse(), detail.getProductId()};
				Inventory inventory=null;
				if(inventoryRepository.exists(pk_inventory)){
					 inventory=inventoryRepository.findOne(pk_inventory);
					if((inventory.getRealQuantity() - detail.getRealQuantity()) < 0){
						detail.setNotEnoughItem(true);
						goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().set(i, detail);
						goodsDeliveriedNote.setNotEnoughItem(true);
					}
				}else{
					detail.setNotEnoughItem(true);
					goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().set(i, detail);
					goodsDeliveriedNote.setNotEnoughItem(true);
				}
			}//end foreach
		}//end if null	
		/**/
		/*step 2 checkNotEnoughItem n*/
		if(goodsDeliveriedNote.isNotEnoughItem()){
			return goodsDeliveriedNote;
		}
		else{
			if(goodsDeliveriedNote.getGoodsDeliveriedNoteDetails()!=null){
				for (int i=0;i<goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().size();i++) {
					GoodsDeliveriedNoteDetail detail=goodsDeliveriedNote.getGoodsDeliveriedNoteDetails().get(i);
					Object[] pk_inventory=new Object[] {goodsDeliveriedNote.getFromLogicWarehouse(), detail.getProductId()};
					Inventory inventory=null;
					if(inventoryRepository.exists(pk_inventory)){
						 inventory=inventoryRepository.findOne(pk_inventory);
						inventory.setDocumentQuantity(inventory.getDocumentQuantity() - detail.getDocumentQuantity());
						inventory.setRealQuantity(inventory.getRealQuantity() - detail.getRealQuantity());
						inventory.setModifyTime(new Date());
						inventoryRepository.save(inventory);
					}
					
					inventoryReportService.insert(detail, goodsDeliveriedNote.getFromLogicWarehouse());//insert new inventoryReport 
				}//end foreach
			}//end if null	
		  }
		goodsDeliveriedNote.setIsCheck(Googs.WAITING);
		goodsDeliveriedNote.setApproveDate(new Date());
		return goodsDeliveriedNoteRepository.save(goodsDeliveriedNote);
	}

	@Override
	@Transactional
	public GoodsDeliveriedNote destroy(GoodsDeliveriedNote goodsDeliveriedNote) {
		goodsDeliveriedNote.setIsCheck(Googs.DESTROY);
		goodsDeliveriedNote.setApproveDate(new Date());
		return goodsDeliveriedNoteRepository.save(goodsDeliveriedNote);
	}

	@Override
	public List<GoodsDeliveriedNoteDetailReport> findByGoodsDeliveriedId(
			String id) {
		// TODO Auto-generated method stub
		return goodsDeliveriedNoteDetailRepository.findByGoodsDeliveriedId(id);
	}

	@Override
	public GoodsDeliveriedNoteReport getDeliveriedReportById(String id) {
		// TODO Auto-generated method stub

		return goodsDeliveriedNoteRepository.getDeliveriedReportById(id);
	}

	@Override
	public List<GoodsDeliveriedNote> findByWaitingStatus() {
		String query="select * from tb_goods_deliveried_note where IsCheck=3";

		List<GoodsDeliveriedNote> results= goodsDeliveriedNoteRepository.getJdbcTemplate().query(query, 
								new Object[]{}, goodsDeliveriedNoteRepository.ROW_MAPPER) ;
		return results;
	}

	@Override
	public GoodsDeliveriedNote approve(GoodsDeliveriedNote goodsDeliveriedNote) {
		// TODO Auto-generated method stub
		goodsDeliveriedNote.setIsCheck(Googs.APPROVE);
		return goodsDeliveriedNoteRepository.save(goodsDeliveriedNote);
	}
	

}
