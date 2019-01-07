package cargo.controller;

import java.security.Principal;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.Product;
import cargo.domain.ViewGridProduct;
import cargo.layout.support.web.AjaxUtils;
import cargo.layout.support.web.EAN13Helper;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.IBigUnit;
import cargo.service.IBusinessType;
import cargo.service.ICategory;
import cargo.service.IProduct;
import cargo.service.ISupplier;
import cargo.service.IUnit;
import cargo.service.IViewGridProduct;


@Controller
public class ProductController {
	@Autowired
	private IProduct productService;
	
	@Autowired
	private IViewGridProduct biewGridProductService; 
	
	@Autowired
	private IBigUnit bigUnitService;
	
	@Autowired
	private IBusinessType businessTypeService;
	
	@Autowired
	private ICategory categoryService;
	
	@Autowired
	private ISupplier supplierService;
	
	@Autowired
	private IUnit unitService;
	
	
	@RequestMapping(value={"admin/product"})
	public String index(Model model,
				@RequestHeader(value = "X-Requested-With", required = false) String requestedWith,
				@ModelAttribute("viewGridProduct")ViewGridProduct viewGridProduct,
				@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/product")
												.queryParam("ProductName", viewGridProduct.getProductName())
												.queryParam("CategoryId", viewGridProduct.getCategoryId())
												.queryParam("SupplierId", viewGridProduct.getSupplierId());
		
		
		boolean isAjaxRequest=AjaxUtils.isAjaxRequest(requestedWith);

		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"id");
		Page<ViewGridProduct> s=biewGridProductService.findByObjectAttribute(viewGridProduct, pageRequest);
		PageWrapper<ViewGridProduct> page = new PageWrapper<ViewGridProduct>(s, uri.build().toString());
		model.addAttribute("categorys", categoryService.findAll());
		model.addAttribute("suppliers", supplierService.findAll());
		model.addAttribute("headTitle", "Product");
		model.addAttribute("gridproducts", page.getContent());
		model.addAttribute("page", page);
		model.addAttribute("isAjaxRequest", isAjaxRequest);
		if (isAjaxRequest) {
			return ("admin/product/list :: boxGridProduct");
		}
		
		return "admin/product/list";
	}
	
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("bigunits", bigUnitService.findAll());
		model.addAttribute("businesstypes", businessTypeService.findAll());
		model.addAttribute("categorys", categoryService.findAll());
		model.addAttribute("suppliers", supplierService.findAll());
		model.addAttribute("units", unitService.findAll());
		
	}
	
	@GetMapping("admin/product/add")
	public String add(Model model,boolean isBidingResult){
		model.addAttribute("headTitle", "Product Add new Item");
		model.addAttribute("h1", "Add item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("product", new Product());

		}
		return "admin/product/form";
	}
	
	@GetMapping("admin/product/edit/{id}")
	public String edit(Model model,boolean isBidingResult,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "Product Edit Item");
		model.addAttribute("h1", "Edit item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("product",productService.findByid(id));
		}
		return "admin/product/form";
	}
	
	@PostMapping("admin/product/save")
	public String Save(@Valid Product product,BindingResult result, RedirectAttributes ra,Locale locale,Principal productsession,Model model){
		
		  if(product.isNew()){
			  if (result.hasErrors()) {
			  	  return add(model,true);
			  	}
			  if(productService.isExists(product.getId())){
				  result.reject("global.error.product.id.exists", "#id is exists!");
				  //System.out.println("#!3");
				  return add(model,true);
			  }
			  if(productService.isExistsCode(product.getProductCode())){
				  result.reject("global.error.product.id.exists", "#ProductCode is exists!");
				  //System.out.println("#!3");
				  return add(model,true);
			  }
			  //System.out.println("!@3");
		  }else{
			  if (result.hasErrors()) {
			  	  return edit(model,true,product.getId());
			  	}
		  }
		  try{
			 
			  if(product.isNew()){//set defaul value when insert
				  product.setCreateDate(new Date());
				  product.setUpdateDate(new Date());
				  product.setCreateUser(productsession.getName());
				  product.setUpdateUser(productsession.getName());
			  }else{//set value when update object
			
				  product.setUpdateDate(new Date());
				  product.setUpdateUser(productsession.getName());
				  
				  Product productpersit=productService.findByid(product.getId());
				  product.setCreateDate(productpersit.getCreateDate());
				  product.setCreateUser(productpersit.getCreateUser());
				 
			  }
			  productService.save(product);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/product";
		
	}

	@PostMapping(value="admin/product/active")
	public String active(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			productService.active(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "active.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "active.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/product";
	}
	@PostMapping(value="admin/product/disabled")
	public String disabled(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			  productService.disabled(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "disabled.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "disabled.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/product";
	}
	
	@PostMapping(value="admin/product/delete")
	public String delete(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			productService.delete(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "delete.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "delete.fail");
  			throw(ex);
  	   }
		 return "redirect:/admin/product";
	}
	@GetMapping(value="admin/product/get/barcode")
	@ResponseBody
	public String getbarcode(){
		String EAN13="";
		try{
			String BarCodeWithoutChecksum=productService.GenarateBarcodeWithoutCheckSum();
			if(!BarCodeWithoutChecksum.isEmpty()){
				EAN13=EAN13Helper.calculateCodeWithcheckSum(BarCodeWithoutChecksum);
			}
			
  	   }catch(Exception ex){
  		   throw(ex);
  	   }
		 return EAN13;
	}

}
