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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.Category;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.ICategory;
import cargo.service.Iindustry;

@Controller
public class CategoryController {
	@Autowired
	private ICategory categoryService;
	
	@Autowired
	private Iindustry industryService;
	
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("industrys", industryService.findAll());
		
	}
	@RequestMapping(value={"admin/category"})
	public String index(Model model,	@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/category");
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"CreateDate");
		Page<Category> s=categoryService.findAll(pageRequest);
		PageWrapper<Category> page = new PageWrapper<Category>(s, uri.build().toString());
		model.addAttribute("headTitle", "category");
		model.addAttribute("categorys", page.getContent());
		 model.addAttribute("page", page);
		return "admin/category/list";
	}
	
	
	@GetMapping("admin/category/add")
	public String add(Model model,boolean isBidingResult){
		model.addAttribute("headTitle", "category Add new Item");
		model.addAttribute("h1", "Add item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("category", new Category());
		}
		return "admin/category/form";
	}
	
	@GetMapping("admin/category/edit/{id}")
	public String edit(Model model,boolean isBidingResult,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "category Edit Item");
		model.addAttribute("h1", "Edit item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("category",categoryService.findByid(id));
		}
		return "admin/category/form";
	}
	
	@PostMapping("admin/category/save")
	public String Save(@Valid Category category,BindingResult result, RedirectAttributes ra,Locale locale,Principal categorysession,Model model){
		
		  if(category.isNew()){
			  if (result.hasErrors()) {
			  	  return add(model,true);
			  	}
			  if(categoryService.isExists(category.getId())){
				  result.reject("global.error.category.id.exists", "#id is exists!");
				  //System.out.println("#!3");
				  return add(model,true);
			  }
			  //System.out.println("!@3");
		  }else{
			  if (result.hasErrors()) {
			  	  return edit(model,true,category.getId());
			  	}
		  }
		  try{
			  //System.out.println("!@3213213");
			  if(category.isNew()){//set defaul value when insert
				  category.setCreateDate(new Date());
				  category.setUpdateDate(new Date());
				  category.setCreateUser(categorysession.getName());
				  category.setUpdateUser(categorysession.getName());
			  }else{//set value when update object
			
				  category.setUpdateDate(new Date());
				  category.setUpdateUser(categorysession.getName());
				  
				  Category categorypersit=categoryService.findByid(category.getId());
				  category.setCreateDate(categorypersit.getCreateDate());
				  category.setCreateUser(categorypersit.getCreateUser());
				 
			  }
			  categoryService.save(category);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/category";
		
	}

	@PostMapping(value="admin/category/active")
	public String active(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			categoryService.active(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "active.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "active.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/category";
	}
	@PostMapping(value="admin/category/disabled")
	public String disabled(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			  categoryService.disabled(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "disabled.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "disabled.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/category";
	}
	
	@PostMapping(value="admin/category/delete")
	public String delete(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			categoryService.delete(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "delete.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "delete.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/category";
	}
	
	
}

