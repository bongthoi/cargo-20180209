package cargo.controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.JRDataSourceAdapter.GoodsReceiptNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsReceiptNoteReport;
import cargo.domain.GoodsReceiptNote;
import cargo.domain.Product;
import cargo.layout.support.web.FrmAddReciptModel;
import cargo.layout.support.web.Googs;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.layout.support.web.TypeReceipt;
import cargo.service.IGoodsDeliveriedNote;
import cargo.service.IGoodsReceiptNote;
import cargo.service.ILogicalWarehouse;
import cargo.service.IProduct;
import cargo.service.IReceiptNoteType;
import cargo.service.ISupplier;


@Controller
public class GoodsReceiptNoteCtrl {
	@Autowired
	private IGoodsDeliveriedNote deliveriedNoteService;
	
	@Autowired
	private IGoodsReceiptNote goodsReceiptNoteService;
	
	@Autowired
	private IProduct productService;
	
	@Autowired
	private IReceiptNoteType receiptNoteTypeService;
	
	@Autowired
	private ISupplier supplierService;
	
	@Autowired
	private ILogicalWarehouse logicalWarehouseService;
	
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("receipt_note_types", receiptNoteTypeService.findAll());  
		model.addAttribute("logical_warehouses", logicalWarehouseService.findAll());
		model.addAttribute("suppliers", supplierService.findAll());
	}
	@RequestMapping(value={"admin/goods_receipt_note"})
	public String index(Model model,@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/goods_receipt_note");
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"CreateDate");
		Page<GoodsReceiptNote> s=goodsReceiptNoteService.findAll(pageRequest);
		PageWrapper<GoodsReceiptNote> page = new PageWrapper<GoodsReceiptNote>(s, uri.build().toString());
		model.addAttribute("headTitle", "Goods Receipt Note ");
		model.addAttribute("receipt_note_types", receiptNoteTypeService.findAll());  
		model.addAttribute("goodsReceiptNotes", page.getContent());
		 model.addAttribute("page", page);
		return "admin/goods_receipt_note/list";
	}
	
	@GetMapping("admin/goods_receipt_note/add")
	public String add(Model model,boolean isBidingResult/*,@RequestParam(value="TypeReceipt") int typeReceipt*/){
		
		boolean isFromSupplier=true;//(typeReceipt==TypeReceipt.NEW);
		model.addAttribute("headTitle", "Goods Receipt Note Add new Item");
		model.addAttribute("h1", "Add item");
		model.addAttribute("isFromSuplier", isFromSupplier);
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			 GoodsReceiptNote goodsReceiptNote= new GoodsReceiptNote();
			 goodsReceiptNote.setTypeofNote(TypeReceipt.NEW);
			// goodsReceiptNote.setTypeofNote(typeReceipt);
			model.addAttribute("goodsReceiptNote", goodsReceiptNote);
		}
		return "admin/goods_receipt_note/form";
	}
	
	@GetMapping("admin/goods_receipt_note/add-existing-delivery-note")
	public String add_existing_deliverynote(Model model,boolean isBidingResult/*,@RequestParam(value="TypeReceipt") int typeReceipt*/){
		model.addAttribute("headTitle", "Create Goods Receipt Note by existing delivery note");
		model.addAttribute("h1", "Create Goods Receipt Note by existing delivery note");
		model.addAttribute("deliveryNotes", deliveriedNoteService.findByWaitingStatus());  
		if(!isBidingResult){
		
			// goodsReceiptNote.setTypeofNote(typeReceipt);
			model.addAttribute("frmAddReciptModel", new FrmAddReciptModel());
		}
		return "admin/goods_receipt_note/formExistingDeliveryNote";
	}
	
	@GetMapping("admin/goods_receipt_note/edit/{id}")
	public String edit(Model model,boolean isBidingResult,@PathVariable(value="id") String id,@RequestParam(value="TypeReceipt") int typeReceipt){
		boolean isFromSupplier=(typeReceipt==TypeReceipt.NEW);
		model.addAttribute("headTitle", "Goods Receipt Note Edit Item");
		model.addAttribute("h1", "Edit item");
		model.addAttribute("isFromSuplier", isFromSupplier);
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("goodsReceiptNote",goodsReceiptNoteService.findByid(id));
		}
		return "admin/goods_receipt_note/form";
	}
	
	@GetMapping("admin/goods_receipt_note/info/{id}")
	public String info(Model model,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "Goods Receipt Note Info Item");
		model.addAttribute("h1", "Info item");
		 GoodsReceiptNote goodsReceiptNote=goodsReceiptNoteService.findByid(id);
	    boolean isFromSupplier=(goodsReceiptNote.getTypeofNote()==TypeReceipt.NEW);
		model.addAttribute("isFromSuplier", isFromSupplier);
	    model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "admin/goods_receipt_note/info";
	}
	
	@GetMapping("admin/goods_receipt_note/getTrDetail")
	public String getTrDetail(Model model,@RequestParam(value="productid") String productid){
		Product product=productService.findByid(productid);
		model.addAttribute("product", product);
		return "admin/goods_receipt_note/tableDetail :: trDetail";
		
	}
	
	@PostMapping("admin/goods_receipt_note/approve")
	public String approve(Model model,Principal session, RedirectAttributes ra,@RequestParam(value="id") String id){
	
		
		/*step 1 check exits ID*/
		if(!goodsReceiptNoteService.exists(id)){
			  MessageHelper.addErrorAttribute(ra, "goods_receipt_note.NotFound");
			  return "redirect:/admin/goods_receipt_note";
		}
		
		/*step 2  fillter Checked Status*/
		GoodsReceiptNote goodsReceiptNote = goodsReceiptNoteService.findByid(id);
		if(goodsReceiptNote.getIsCheck()!= Googs.NEW)//Not new status
		{
			MessageHelper.addErrorAttribute(ra, "goods_receipt_note.CheckedError");	
		}
		/*step 3  Approve this*/
		else{
			try{
				 goodsReceiptNote.setApproveUser(session.getName());
				 goodsReceiptNote=goodsReceiptNoteService.approve(goodsReceiptNote);
				 MessageHelper.addSuccessAttribute(ra, "processing.success");
			 }catch(Exception ex){
				 	MessageHelper.addErrorAttribute(ra, "processing.error"); 
				 	throw(ex);
			  }
		}

		//model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "redirect:/admin/goods_receipt_note/info/"+id;
		
	}
	@PostMapping("admin/goods_receipt_note/destroy")
	public String destroy(Model model,Principal session, RedirectAttributes ra,@RequestParam(value="id") String id){
	
		
		/*step 1 check exits ID*/
		if(!goodsReceiptNoteService.exists(id)){
			  MessageHelper.addErrorAttribute(ra, "goods_receipt_note.NotFound");
			  return "redirect:/admin/goods_receipt_note";
		}
		
		/*step 2  fillter Checked Status*/
		GoodsReceiptNote goodsReceiptNote = goodsReceiptNoteService.findByid(id);
		if(goodsReceiptNote.getIsCheck()!= Googs.NEW)//Not new status
		{
			MessageHelper.addErrorAttribute(ra, "goods_receipt_note.CheckedError");	
		}
		/*step 3  Approve this*/
		else{
			try{
				 goodsReceiptNote.setApproveUser(session.getName());
				 goodsReceiptNote=goodsReceiptNoteService.destroy(goodsReceiptNote);
				 MessageHelper.addSuccessAttribute(ra, "processing.success");
			 }catch(Exception ex){
				 	MessageHelper.addErrorAttribute(ra, "processing.error"); 
				 	throw(ex);
			  }
		}

		//model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "redirect:/admin/goods_receipt_note/info/"+id;
		
	}
	
	@PostMapping("admin/goods_receipt_note/save-existing-delivery-note")
	public String save2(@Valid @ModelAttribute FrmAddReciptModel frmAddReciptModel,BindingResult result, RedirectAttributes ra,Locale locale,Principal session,Model model)
	{
		  try{
			  if (result.hasErrors()) {
			  	  return add_existing_deliverynote(model,true);
			  }
			  String CreateUser=session.getName();
			  goodsReceiptNoteService.saveExistingDeliveryNote(frmAddReciptModel,CreateUser);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
			  return "redirect:/admin/goods_receipt_note";
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
			  return "redirect:/admin/goods_receipt_note";
	  		  //throw(ex);
			 }
	}
	@PostMapping("admin/goods_receipt_note/save")
	public String Save(@Valid @ModelAttribute GoodsReceiptNote goodsReceiptNote,BindingResult result, RedirectAttributes ra,Locale locale,Principal session,Model model){
	/*	System.out.println(goodsReceiptNote.getNote());
		System.out.println(goodsReceiptNote.getGoodsReceiptNoteDetails().size());
		for (GoodsReceiptNoteDetail item : goodsReceiptNote.getGoodsReceiptNoteDetails()) {
			System.out.println(item.toString());
		}  */
			if(goodsReceiptNote.getIsCheck()!=Googs.NEW){
				 result.reject("global.error.goodsReceiptNoteDetails.cannot.update", "This Document can't update because Checked Status not valib !");
			}
			
			boolean isFromSupplier=(goodsReceiptNote.getTypeofNote()==TypeReceipt.NEW);
			if(goodsReceiptNote.getGoodsReceiptNoteDetails()==null){
				  result.reject("global.error.goodsReceiptNoteDetails.null", "Detail info is empty!");
			  }
			if(isFromSupplier ==false){
				if(goodsReceiptNote.getFromLogicWarehouse().equals(goodsReceiptNote.getToLogicWarehouse())){
					  result.reject("global.error.FromAndToWarehouse.equal", "#From Warehouse and #To Warehouse are dupplicate!");
				  }
			}
		
		  if(goodsReceiptNote.isNew()){
			  if (result.hasErrors()) {
			  	  return add(model,true/*,goodsReceiptNote.getTypeofNote()*/);
			  	}
			  
		  }else{
			  if (result.hasErrors()) {
			  	  return edit(model,true,goodsReceiptNote.getId(),goodsReceiptNote.getTypeofNote());
			  	}
		  }
		  try{
			 
			  if(goodsReceiptNote.isNew()){//set defaul value when insert
				  goodsReceiptNote.setCreateDate(new Date());
				  goodsReceiptNote.setApproveDate(new Date());
				  goodsReceiptNote.setApproveUser(session.getName());
				  goodsReceiptNote.setCreateUser(session.getName());
				  goodsReceiptNote.setId(goodsReceiptNoteService.GenarateId());
				  goodsReceiptNote.setIsCheck(0);
			  }else{//set value when update object
				  GoodsReceiptNote  goodsReceiptNotePersited= goodsReceiptNoteService.findOne(goodsReceiptNote.getId());
				  goodsReceiptNote.setCreateDate(goodsReceiptNotePersited.getCreateDate());
				  goodsReceiptNote.setApproveDate(goodsReceiptNotePersited.getApproveDate());
				  goodsReceiptNote.setApproveUser(goodsReceiptNotePersited.getApproveUser());
				  goodsReceiptNote.setCreateUser(goodsReceiptNotePersited.getCreateUser());
				  goodsReceiptNote.setId(goodsReceiptNotePersited.getId());
				  goodsReceiptNote.setIsCheck(goodsReceiptNotePersited.getIsCheck());
				 
			  }
			
			  goodsReceiptNoteService.save(goodsReceiptNote);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/goods_receipt_note";
		
	}

	@RequestMapping(value = "admin/goods_receipt_note/export", method = RequestMethod.POST)
	@ResponseBody
	public void generateResultsPdf(@RequestParam(value="id") String id, HttpServletResponse response) {
		
		GoodsReceiptNoteReport goodsReceiptNoteReport=goodsReceiptNoteService.getReceiptReportById(id);
		List<GoodsReceiptNoteDetailReport> ReceiptDetailReports=goodsReceiptNoteService.findByGoodsReceiptId(id);
	    JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(ReceiptDetailReports);
	    
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("ListReceiptDetails", itemsJRBean);
	    parameterMap.put("goodsReceipt",goodsReceiptNoteReport);

	    try {
	    	 InputStream is = getClass().getResourceAsStream("/jasper/PNhapkho.jrxml");
	    	    JasperReport report = JasperCompileManager.compileReport(is);
	            JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, new JREmptyDataSource());
	            String filename = "Phieunhap.pdf";

	            response.setContentType("application/pdf");
	            response.addHeader("Content-disposition", "attachment; filename=" +filename);
	            response.setCharacterEncoding("UTF-8");
	            OutputStream outputStream = response.getOutputStream();
	    
	            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
	        } catch (JRException | IOException e) {
	            System.out.println("Error in generating pdf : {}");
	        }
	}
	
}
