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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.User;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.ILocation;
import cargo.service.IPhysicalWarehouse;
import cargo.service.IUser;
import cargo.service.IUserGroup;


@Controller
public class UserCtrl {

	@Autowired
	private IUser userService;
	
	@Autowired
	private ILocation locationService;
	
	@Autowired
	private IPhysicalWarehouse  physicalWarehouseService;
	
	@Autowired
	private IUserGroup userGroupService;
	
	private void AddAtributeIntoForm(Model model){
		model.addAttribute("UserGroups", userGroupService.findAll());
		model.addAttribute("Locations",locationService.findAll());
		model.addAttribute("PhysicalWarehouses",physicalWarehouseService.findAll());
	}
	@RequestMapping(value={"admin/User"})
	public String index(Model model,	@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/User");
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"RegisterDate");
		Page<User> s=userService.findAll(pageRequest);
		PageWrapper<User> page = new PageWrapper<User>(s, uri.build().toString());
		//List<User> users=userService.findAll();
		model.addAttribute("headTitle", "User");
		model.addAttribute("users", page.getContent());
		 model.addAttribute("page", page);
		return "admin/User/list";
	}
	@GetMapping("admin/User/add")
	public String add(Model model,boolean isBidingResult){
		model.addAttribute("headTitle", "User Add new Item");
		model.addAttribute("h1", "Add item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("user", new User());
		}
		return "admin/User/form";
	}
	
	@GetMapping("admin/User/edit")
	public String edit(Model model,boolean isBidingResult,@RequestParam(value="username") String username){
		model.addAttribute("headTitle", "User Edit Item");
		model.addAttribute("h1", "Edit item");
		this.AddAtributeIntoForm(model);
		if(!isBidingResult){
			model.addAttribute("user",userService.findByid(username));
		}
		return "admin/User/form";
	}
	
	@PostMapping("admin/User/save")
	public String Save(@Valid User user,BindingResult result, RedirectAttributes ra,Locale locale,Principal usersession,Model model){
		
		  if(!user.isMatchPassword()){
			  result.reject("global.error.user.repassword.missmatch", "Retype password miss match!");
		  }
		
			  if(user.isNew()){
				  if(userService.isExists(user.getUsername())){
					  result.reject("global.error.user.username.exists", "UserName is exists!");
		
				  }
				  if (result.hasErrors()) {
				  	  return add(model,true);
				  	}
	
			  }else{
				  if (result.hasErrors()) {
				  	  return edit(model,true,user.getUsername());
				  	}
			  }
		  try{
			  //System.out.println("!@3213213");
			  if(user.isNew()){//set defaul value when insert
				  user.setRegisterDate(new Date());
				  user.setUpdateDate(new Date());
				  user.setRegisterUser(usersession.getName());
				  user.setUpdateUser(usersession.getName());
			  }else{//set value when update object
			
				  user.setUpdateDate(new Date());
				  user.setUpdateUser(usersession.getName());
				  System.out.println(user.getUpdateUser());
					 User userpersit=userService.findByid(user.getUsername());
				  user.setRegisterDate(userpersit.getRegisterDate());
				  user.setRegisterUser(userpersit.getRegisterUser());
				 
			  }
			//  System.out.println(user.isNew());
			 // System.out.println(user.toString());
			  userService.save(user);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/User";
		
	}

	@PostMapping(value="admin/User/active")
	public String active(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			userService.active(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "active.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "active.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/User";
	}
	@PostMapping(value="admin/User/disabled")
	public String disabled(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			userService.disabled(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "disabled.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "disabled.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/User";
	}
	
	@PostMapping(value="admin/User/delete")
	public String delete(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			userService.delete(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "delete.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "delete.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/User";
	}
}
