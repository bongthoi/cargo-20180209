
package cargo.serviceImpl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cargo.JRDataSourceAdapter.GoodsReceiptNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsReceiptNoteReport;
import cargo.domain.GoodsDeliveriedNote;
import cargo.domain.GoodsDeliveriedNoteDetail;
import cargo.domain.GoodsReceiptNote;
import cargo.domain.GoodsReceiptNoteDetail;
import cargo.domain.Inventory;
import cargo.layout.support.web.FrmAddReciptModel;
import cargo.layout.support.web.Googs;
import cargo.layout.support.web.TypeReceipt;
import cargo.repository.GoodsReceiptNoteDetailRepository;
import cargo.repository.GoodsReceiptNoteRepository;
import cargo.repository.InventoryRepository;
import cargo.service.IGoodsDeliveriedNote;
import cargo.service.IGoodsReceiptNote;
import cargo.service.InventoryReportService;

@Service
public class IGoodsReceiptNoteImpl implements IGoodsReceiptNote{

	@Autowired
	private GoodsReceiptNoteRepository goodsReceiptNoteRepository;
	
	@Autowired
	private GoodsReceiptNoteDetailRepository goodsReceiptNoteDetailRepository;
	
	
	@Autowired
	private InventoryRepository inventoryRepository;
	
	@Autowired
	private InventoryReportService inventoryReportService;
	
	@Autowired
	private IGoodsDeliveriedNote deliveriedNoteService;
	
	
	@Override
	@Transactional
	public GoodsReceiptNote save(GoodsReceiptNote goodsReceiptNote) {
		if(goodsReceiptNote.getGoodsReceiptNoteDetails()!=null){
			int TotalQuantity=0;
			BigDecimal TotalAmount=new BigDecimal(0);
			for (int i=0;i<goodsReceiptNote.getGoodsReceiptNoteDetails().size();i++) {
				GoodsReceiptNoteDetail detail=goodsReceiptNote.getGoodsReceiptNoteDetails().get(i);
				if(detail.getIsDelete()==0){//chua xoa
					BigDecimal detailAmount=new BigDecimal(detail.getRealQuantity() * detail.getPrice().doubleValue());
					TotalAmount = TotalAmount.add(detailAmount);//++totalamount
					TotalQuantity += detail.getRealQuantity();//++totalquantity
					detail.setAmount(detailAmount);
					detail.setGoodsReceiptNoteId(goodsReceiptNote.getId());
					//System.out.println(detail.toString());
					goodsReceiptNoteDetailRepository.save(detail);
				}else{
					if(detail.getId()!=null){
						goodsReceiptNoteDetailRepository.delete(detail.getId());//delete detail
					}
				}//end if isdelete
			}//end foreach
			goodsReceiptNote.setTotalAmount(TotalAmount);
			goodsReceiptNote.setTotalQuantity(TotalQuantity);
			return goodsReceiptNoteRepository.save(goodsReceiptNote);
		}//end if detail size
		// TODO Auto-generated method stub
		/*GoodsReceiptNoteDetail detail2 =new GoodsReceiptNoteDetail(null,"8930001000209","LOA 1",2,1,1,new BigDecimal(0),new BigDecimal(0),"PN-00000000017");
		GoodsReceiptNoteDetail detail3= goodsReceiptNoteDetailRepository.save(detail2);
		System.out.println(detail3.getId());*/
		return new GoodsReceiptNote();
	}

	@Override
	public String GenarateId() {
		// TODO Auto-generated method stub
		return goodsReceiptNoteRepository.GenarateId();
	}

	@Override
	public Page<GoodsReceiptNote> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return goodsReceiptNoteRepository.findAll(pageable);
	}

	@Override
	public GoodsReceiptNote findByid(String id) {
		// TODO Auto-generated method stub
		if(goodsReceiptNoteRepository.exists(id)){
			GoodsReceiptNote goodsReceiptNote =goodsReceiptNoteRepository.findOne(id);
			goodsReceiptNote.setGoodsReceiptNoteDetails(goodsReceiptNoteDetailRepository
										.findWhereQuery(" WHERE 1=1 and GoodsReceiptNoteId ='"+goodsReceiptNote.getId()+"' "));
			return goodsReceiptNote;
		}
		return null;
	}

	@Override
	public GoodsReceiptNote findOne(String id) {
		// TODO Auto-generated method stub
		return goodsReceiptNoteRepository.findOne(id);
	}

	@Override
	public boolean exists(String id) {
		// TODO Auto-generated method stub
		return goodsReceiptNoteRepository.exists(id);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public GoodsReceiptNote approve(GoodsReceiptNote goodsReceiptNote) {
		//String FormLogicWarehouse=goodsReceiptNote.getFromLogicWarehouse();
		
		
		if(goodsReceiptNote.getGoodsReceiptNoteDetails()!=null){
			for (int i=0;i<goodsReceiptNote.getGoodsReceiptNoteDetails().size();i++) {
				GoodsReceiptNoteDetail detail=goodsReceiptNote.getGoodsReceiptNoteDetails().get(i);
				Object[] pk_inventory=new Object[] {goodsReceiptNote.getToLogicWarehouse(), detail.getProductId()};
				Inventory inventory=null;
				if(inventoryRepository.exists(pk_inventory)){
					 inventory=inventoryRepository.findOne(pk_inventory);
					inventory.setDocumentQuantity(inventory.getDocumentQuantity() + detail.getDocumentQuantity());
					inventory.setRealQuantity(inventory.getRealQuantity() + detail.getRealQuantity());
					inventory.setModifyTime(new Date());
					inventoryRepository.save(inventory);//update detail
				}else{
					 inventory=new Inventory();
					inventory.setProductId(detail.getProductId());
					inventory.setProductCode(detail.getProductCode());
					inventory.setProductName(detail.getProductName());
					inventory.setLogicWarehouseId(goodsReceiptNote.getToLogicWarehouse());
					inventory.setDocumentQuantity(detail.getDocumentQuantity());
					inventory.setRealQuantity(detail.getRealQuantity());
					inventory.setModifyTime(new Date());
					inventoryRepository.save(inventory);//insert detail
				}
				inventoryReportService.insert(detail, goodsReceiptNote.getToLogicWarehouse());//insert new inventoryReport 
			}//end foreach
		}//end if null	
		goodsReceiptNote.setIsCheck(Googs.APPROVE);
		goodsReceiptNote.setApproveDate(new Date());
		return goodsReceiptNoteRepository.save(goodsReceiptNote);//inser or update goodsReceiptNote
		
	}

	@Override
	@Transactional
	public GoodsReceiptNote destroy(GoodsReceiptNote goodsReceiptNote) {
		// TODO Auto-generated method stub
		goodsReceiptNote.setIsCheck(Googs.DESTROY);
		goodsReceiptNote.setApproveDate(new Date());
		return goodsReceiptNoteRepository.save(goodsReceiptNote);
	}

	@Override
	public GoodsReceiptNoteReport getReceiptReportById(String id) {
		// TODO Auto-generated method stub
		return goodsReceiptNoteRepository.getReceiptReportById(id);
	}

	@Override
	public List<GoodsReceiptNoteDetailReport> findByGoodsReceiptId(String id) {
		// TODO Auto-generated method stub
		return goodsReceiptNoteDetailRepository.findByGoodsReceiptId(id);
	}

	@Override
	@Transactional
	public void saveExistingDeliveryNote(FrmAddReciptModel frmAddReciptModel,
			String createUser) {
		// atifact
		GoodsDeliveriedNote existingDeliveryNode=deliveriedNoteService.findByid(frmAddReciptModel.getDeliveryNoteId());
		String newGoodsReceiptId=this.GenarateId();
		
		//setting new object
		GoodsReceiptNote newDoc=new GoodsReceiptNote();
		newDoc.setId(newGoodsReceiptId);
		newDoc.setApproveDate(new Date());
		newDoc.setApproveUser(createUser);
		newDoc.setCreateDate(new Date());
		newDoc.setCreateUser(createUser);
		newDoc.setDocumentNo("-- edit here --");
		newDoc.setFromLogicWarehouse(existingDeliveryNode.getFromLogicWarehouse());
		newDoc.setToLogicWarehouse(existingDeliveryNode.getToLogicWarehouse());
		newDoc.setGoodsReceiptNoteDetails(this.swapDeliveryDetailtoReceiptDetail(existingDeliveryNode.getGoodsDeliveriedNoteDetails(),newGoodsReceiptId));
		newDoc.setIsCheck(Googs.NEW);
		newDoc.setNote(frmAddReciptModel.getNote());
		newDoc.setOutPreference(existingDeliveryNode.getId());
		newDoc.setTypeofNote(TypeReceipt.EXISTING_DELIVERYNOTE);
		
		//execute
		newDoc=this.save(newDoc);
		existingDeliveryNode.setInPreference(newDoc.getId());
		deliveriedNoteService.save(existingDeliveryNode);
	}
	
	
	private List<GoodsReceiptNoteDetail> swapDeliveryDetailtoReceiptDetail(List<GoodsDeliveriedNoteDetail> details,String GoodsReceiptId){
		List<GoodsReceiptNoteDetail> results=new ArrayList<GoodsReceiptNoteDetail> ();
		for(int i=0;i<details.size();i++){
			GoodsReceiptNoteDetail item=new GoodsReceiptNoteDetail();
			item.setProductId(details.get(i).getProductId());
			item.setProductName(details.get(i).getProductName());
			item.setProductCode(details.get(i).getProductCode());
			item.setPrice(details.get(i).getPrice());
			item.setAmount(details.get(i).getAmount());
			item.setDocumentQuantity(details.get(i).getDocumentQuantity());
			item.setRealQuantity(details.get(i).getRealQuantity());
			item.setGoodsReceiptNoteId(GoodsReceiptId);
			item.setUnit(details.get(i).getUnit());
			results.add(item);
		}
		return results;
	}

}
