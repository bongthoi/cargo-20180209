package cargo.controller;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteReport;
import cargo.domain.GoodsDeliveriedNote;
import cargo.domain.Product;
import cargo.layout.support.web.Googs;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.IDeliveriedNoteType;
import cargo.service.IGoodsDeliveriedNote;
import cargo.service.ILogicalWarehouse;
import cargo.service.IProduct;

@Controller
public class  GoodsDeliveriedNoteCtrl {
	@Autowired
	private IGoodsDeliveriedNote deliveriedNoteService;
	
	@Autowired
	private IProduct productService;
	
	@Autowired
	private IDeliveriedNoteType deliveriedNoteTypeService;
	
	@Autowired
	private ILogicalWarehouse logicalWarehouseService;
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("delivered_note_types", deliveriedNoteTypeService.findAll());
		model.addAttribute("logical_warehouses", logicalWarehouseService.findAll());
	}
	@RequestMapping(value={"admin/goods_deliveried_note"})
	public String index(Model model,@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/goods_deliveried_note");
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"CreateDate");
		Page<GoodsDeliveriedNote> s=deliveriedNoteService.findAll(pageRequest);
		PageWrapper< GoodsDeliveriedNote> page = new PageWrapper<GoodsDeliveriedNote>(s, uri.build().toString());
		model.addAttribute("headTitle", "Goods Deliveried Note ");
		model.addAttribute("goodsDeliveriedNotes", page.getContent());
		 model.addAttribute("page", page);
		return "admin/goods_deliveried_note/list";
	}
	@GetMapping("admin/goods_deliveried_note/add")
	public String add(Model model,boolean isBidingResult){
		model.addAttribute("headTitle", "Goods Deliveried Note Add new Item");
		model.addAttribute("h1", "Add item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("goodsDeliveriedNote", new  GoodsDeliveriedNote());
		}
		return "admin/goods_deliveried_note/form";
	}
	
	@GetMapping("admin/goods_deliveried_note/edit/{id}")
	public String edit(Model model,boolean isBidingResult,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "Goods Deliveried Note Edit Item");
		model.addAttribute("h1", "Edit item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("goodsDeliveriedNote",deliveriedNoteService.findByid(id));
		}
		return "admin/goods_deliveried_note/form";
	}
	
	@GetMapping("admin/goods_deliveried_note/info/{id}")
	public String info(Model model,boolean isBidingResult,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "Goods Deliveried Note Info Item");
		model.addAttribute("h1", "Info item");
		this.AddAtributeIntoForm(model);
			model.addAttribute("goodsDeliveriedNote",deliveriedNoteService.findByid(id));
		return "admin/goods_deliveried_note/info";
	}
	
	@GetMapping("admin/goods_deliveried_note/getTrDetail")
	public String getTrDetail(Model model,@RequestParam(value="productid") String productid){
		Product product=productService.findByid(productid);
		model.addAttribute("product", product);
		return "admin/goods_deliveried_note/tableDetail :: trDetail";
		
	}
	
	@PostMapping("admin/goods_deliveried_note/approve")
	public String approve(Model model,Principal session, RedirectAttributes ra,@RequestParam(value="id") String id){
	
		
		/*step 1 check exits ID*/
		if(!deliveriedNoteService.exists(id)){
			  MessageHelper.addErrorAttribute(ra, "goods_receipt_note.NotFound");
			  return "redirect:/admin/goods_deliveried_note";
		}
		
		/*step 2  fillter Checked Status*/
		GoodsDeliveriedNote goodsDeliveriedNote = deliveriedNoteService.findByid(id);
		if(goodsDeliveriedNote.getIsCheck()!= Googs.WAITING)//Not new status
		{
			MessageHelper.addErrorAttribute(ra, "goods_receipt_note.CheckedError");	
		}
		/*step 3  Approve this*/
		else{
			try{
				goodsDeliveriedNote.setApproveUser(session.getName());
				goodsDeliveriedNote=deliveriedNoteService.approve(goodsDeliveriedNote);
				 MessageHelper.addSuccessAttribute(ra, "processing.success");
			 }catch(Exception ex){
				 	MessageHelper.addErrorAttribute(ra, "processing.error"); 
				 	throw(ex);
			  }
		}

		//model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "redirect:/admin/goods_deliveried_note/info/"+id;
		
	}
	@PostMapping("admin/goods_deliveried_note/waiting")
	public String waiting(Model model,Principal session, RedirectAttributes ra,@RequestParam(value="id") String id){
	
		
		/*step 1 check exits ID*/
		if(!deliveriedNoteService.exists(id)){
			  MessageHelper.addErrorAttribute(ra, "goods_receipt_note.NotFound");
			  return "redirect:/admin/goods_deliveried_note";
		}
		
		/*step 2  fillter Checked Status*/
		GoodsDeliveriedNote goodsDeliveriedNote = deliveriedNoteService.findByid(id);
		if(goodsDeliveriedNote.getIsCheck()!= Googs.NEW)//Not new status
		{
			MessageHelper.addErrorAttribute(ra, "goods_receipt_note.CheckedError");	
		}
		/*step 3  Approve this*/
		else{
			try{
				goodsDeliveriedNote.setApproveUser(session.getName());
				goodsDeliveriedNote=deliveriedNoteService.waiting(goodsDeliveriedNote);
				if(goodsDeliveriedNote.isNotEnoughItem()){
					 ra.addFlashAttribute("notEnoughItems", goodsDeliveriedNote);
				}else{
					 MessageHelper.addSuccessAttribute(ra, "processing.success");
				}
				
			 }catch(Exception ex){
				 	MessageHelper.addErrorAttribute(ra, "processing.error"); 
				 	throw(ex);
			  }
		}

		//model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "redirect:/admin/goods_deliveried_note/info/"+id;
		
	}
	@PostMapping("admin/goods_deliveried_note/destroy")
	public String destroy(Model model,Principal session, RedirectAttributes ra,@RequestParam(value="id") String id){
	
		
		/*step 1 check exits ID*/
		if(!deliveriedNoteService.exists(id)){
			  MessageHelper.addErrorAttribute(ra, "goods_receipt_note.NotFound");
			  return "redirect:/admin/goods_deliveried_note";
		}
		
		/*step 2  fillter Checked Status*/
		GoodsDeliveriedNote goodsDeliveriedNote = deliveriedNoteService.findByid(id);
		if(goodsDeliveriedNote.getIsCheck()!= Googs.NEW)//Not new status
		{
			MessageHelper.addErrorAttribute(ra, "goods_receipt_note.CheckedError");	
		}
		/*step 3  Approve this*/
		else{
			try{
				goodsDeliveriedNote.setApproveUser(session.getName());
				 goodsDeliveriedNote=deliveriedNoteService.destroy(goodsDeliveriedNote);
				 MessageHelper.addSuccessAttribute(ra, "processing.success");
			 }catch(Exception ex){
				 	MessageHelper.addErrorAttribute(ra, "processing.error"); 
				 	throw(ex);
			  }
		}

		//model.addAttribute("goodsReceiptNote",goodsReceiptNote);
		return "redirect:/admin/goods_deliveried_note/info/"+id;
		
	}
	
	@PostMapping("admin/goods_deliveried_note/save")
	public String Save(@Valid @ModelAttribute  GoodsDeliveriedNote goodsDeliveriedNote,BindingResult result, RedirectAttributes ra,Locale locale,Principal session,Model model){
	/*	System.out.println(goodsDeliveriedNote.getNote());
		System.out.println(goodsDeliveriedNote.get GoodsDeliveriedNoteDetails().size());
		for ( GoodsDeliveriedNoteDetail item : goodsDeliveriedNote.get GoodsDeliveriedNoteDetails()) {
			System.out.println(item.toString());
		}  */
		if(goodsDeliveriedNote.getGoodsDeliveriedNoteDetails()==null){
			  result.reject("global.error.goodsDeliveriedNoteDetails.null", "Detail info is empty!");
		  }
		if(goodsDeliveriedNote.getFromLogicWarehouse().equals(goodsDeliveriedNote.getToLogicWarehouse())){
			  result.reject("global.error.FromAndToWarehouse.equal", "#From Warehouse and #To Warehouse are dupplicate!");
		  }
		  if(goodsDeliveriedNote.isNew()){
			  if (result.hasErrors()) {
			  	  return add(model,true);
			  	}
			  
		  }else{
			  if (result.hasErrors()) {
			  	  return edit(model,true,goodsDeliveriedNote.getId());
			  	}
		  }
		  try{
			 
			  if(goodsDeliveriedNote.isNew()){//set defaul value when insert
				  goodsDeliveriedNote.setCreateDate(new Date());
				  goodsDeliveriedNote.setApproveDate(new Date());
				  goodsDeliveriedNote.setApproveUser(session.getName());
				  goodsDeliveriedNote.setCreateUser(session.getName());
				  goodsDeliveriedNote.setId(deliveriedNoteService.GenarateId());
				  goodsDeliveriedNote.setIsCheck(0);
			  }else{//set value when update object
				   GoodsDeliveriedNote  goodsDeliveriedNotePersited= deliveriedNoteService.findOne(goodsDeliveriedNote.getId());
				  goodsDeliveriedNote.setCreateDate(goodsDeliveriedNotePersited.getCreateDate());
				  goodsDeliveriedNote.setApproveDate(goodsDeliveriedNotePersited.getApproveDate());
				  goodsDeliveriedNote.setApproveUser(goodsDeliveriedNotePersited.getApproveUser());
				  goodsDeliveriedNote.setCreateUser(goodsDeliveriedNotePersited.getCreateUser());
				  goodsDeliveriedNote.setId(goodsDeliveriedNotePersited.getId());
				  goodsDeliveriedNote.setIsCheck(goodsDeliveriedNotePersited.getIsCheck());
				 
			  }
			  deliveriedNoteService.save(goodsDeliveriedNote);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/goods_deliveried_note";
		
	}
	@RequestMapping(value = "admin/goods_deliveried_note/export", method = RequestMethod.POST)
	@ResponseBody
	public void generateResultsPdf(@RequestParam(value="id") String id, HttpServletResponse response) throws IOException {
		
		GoodsDeliveriedNoteReport goodsDeliveriedNoteReport=deliveriedNoteService.getDeliveriedReportById(id);
		List<GoodsDeliveriedNoteDetailReport> DeliveriedDetailReports=deliveriedNoteService.findByGoodsDeliveriedId(id);
	    JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(DeliveriedDetailReports);
	    Map<String, Object> parameterMap = new HashMap<>();
	    //parameterMap.put("title", "Results table"));
	    parameterMap.put("ListDeliveriedDetails", itemsJRBean);
	    parameterMap.put("goodsDeliveried",goodsDeliveriedNoteReport);

	    try {
	    	    InputStream is = getClass().getResourceAsStream("/jasper/PXuatkho.jrxml");
	    	   JasperReport report = JasperCompileManager.compileReport(is);
	            JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, new JREmptyDataSource());
	            String filename = "Phieuxuat.pdf";

	            response.setContentType("application/pdf");
	            response.addHeader("Content-disposition", "attachment; filename=" +filename);
	            response.setCharacterEncoding("UTF-8");
	            OutputStream outputStream = response.getOutputStream();
	    
	            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
	        } catch (JRException | IOException e) {
	        	PrintWriter out=response.getWriter();
	        	out.println(e);
	            System.out.println("Error in generating pdf : {}");
	        }
	}

}
