package cargo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

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
import org.springframework.context.ApplicationContext;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;
import org.springframework.web.util.UriComponentsBuilder;

import cargo.domain.Industry;
import cargo.layout.support.web.MessageHelper;
import cargo.layout.support.web.PageWrapper;
import cargo.service.Iindustry;

@Controller
public class IndustryControler {
	@Autowired
	private ApplicationContext appContext;
	@Autowired
	private Iindustry industryService;
	
	@RequestMapping(value={"admin/industry"})
	public String index(Model model,	@RequestParam(value="page",required=false,defaultValue="1") int p){
		if(p==0){
			p=1;
		}
		UriComponentsBuilder  uri=UriComponentsBuilder.fromPath("admin/industry");
		PageRequest pageRequest=new  PageRequest(p-1, PageWrapper.MAX_PAGE_ITEM_DISPLAY, Direction.DESC,"CreateDate");
		Page<Industry> s=industryService.findAll(pageRequest);
		PageWrapper<Industry> page = new PageWrapper<Industry>(s, uri.build().toString());
		//List<industry> industrys=industryService.findAll();
		//System.out.println(page.getContent().size());
		model.addAttribute("headTitle", "Industry");
		model.addAttribute("industrys", page.getContent());
		 model.addAttribute("page", page);
		return "admin/industry/list";
	}
	
	
	@GetMapping("admin/industry/add")
	public String add(Model model,boolean isBidingResult){
		model.addAttribute("headTitle", "industry Add new Item");
		model.addAttribute("h1", "Add item");
		if(!isBidingResult){
			model.addAttribute("industry", new Industry());
		}
		return "admin/industry/form";
	}
	
	@GetMapping("admin/industry/edit/{id}")
	public String edit(Model model,boolean isBidingResult,@PathVariable(value="id") String id){
		model.addAttribute("headTitle", "industry Edit Item");
		model.addAttribute("h1", "Edit item");
		if(!isBidingResult){
			model.addAttribute("industry",industryService.findByid(id));
		}
		return "admin/industry/form";
	}
	
	@PostMapping("admin/industry/save")
	public String Save(@Valid Industry industry,BindingResult result, RedirectAttributes ra,Locale locale,Principal industrysession,Model model){
		
		  if(industry.isNew()){
			  if (result.hasErrors()) {
			  	  return add(model,true);
			  	}
			  if(industryService.isExists(industry.getId())){
				  result.reject("global.error.industry.id.exists", "#id is exists!");
				  //System.out.println("#!3");
				  return add(model,true);
			  }
			  //System.out.println("!@3");
		  }else{
			  if (result.hasErrors()) {
			  	  return edit(model,true,industry.getId());
			  	}
		  }
		  try{
			  //System.out.println("!@3213213");
			  if(industry.isNew()){//set defaul value when insert
				  industry.setCreateDate(new Date());
				  industry.setUpdateDate(new Date());
				  industry.setCreateUser(industrysession.getName());
				  industry.setUpdateUser(industrysession.getName());
			  }else{//set value when update object
			
				  industry.setUpdateDate(new Date());
				  industry.setUpdateUser(industrysession.getName());
				  
				  Industry industrypersit=industryService.findByid(industry.getId());
				  industry.setCreateDate(industrypersit.getCreateDate());
				  industry.setCreateUser(industrypersit.getCreateUser());
				 
			  }
			  industryService.save(industry);
			  MessageHelper.addSuccessAttribute(ra, "save.success");
		  }catch(Exception ex){
			  MessageHelper.addErrorAttribute(ra, "save.fail");
	  		throw(ex);
		  }
		  return "redirect:/admin/industry";
		
	}

	@PostMapping(value="admin/industry/active")
	public String active(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			industryService.active(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "active.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "active.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/industry";
	}
	@PostMapping(value="admin/industry/disabled")
	public String disabled(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			  industryService.disabled(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "disabled.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "disabled.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/industry";
	}
	
	@PostMapping(value="admin/industry/delete")
	public String delete(@RequestParam(value="arr_id") String[] arr_id,RedirectAttributes ra){
		try{
			  	
			industryService.delete(arr_id);
	    	    MessageHelper.addSuccessAttribute(ra, "delete.success");
	    	  
  	   }catch(Exception ex){
  		   
  		    MessageHelper.addErrorAttribute(ra, "delete.fail");
  			throw(ex);
	    	   
  	   }
		 return "redirect:/admin/industry";
	}
	
	@GetMapping(value = "admin/industry/pdf")
    public ModelAndView report() {
		
        JasperReportsPdfView view = new JasperReportsPdfView();
        view.setHeaders((Properties) new Properties().setProperty("Content-Disposition", "attachment; Industry.pdf") );
        view.setUrl("classpath:jasper/industry.jrxml");
        view.setApplicationContext(appContext);
        
      //  view.setReportDataKey("UserReport");
        
   	 /* Convert List to JRBeanCollectionDataSource */
        JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(industryService.findAll());
        Map<String, Object> params = new HashMap<>();
        params.put("ListIndustry", itemsJRBean);

        return new ModelAndView(view, params);
    }
	
	@RequestMapping(value = "admin/industry/results-pdf", method = RequestMethod.GET)
	@ResponseBody
	public void generateResultsPdf( HttpServletResponse response) {

	    JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(industryService.findAll());
	    Map<String, Object> parameterMap = new HashMap<>();
	    //parameterMap.put("title", "Results table"));
	    parameterMap.put("ListIndustry", itemsJRBean);

	    try {
	    	    InputStream is = getClass().getResourceAsStream("/jasper/industry.jrxml");
	    		JasperReport report = JasperCompileManager.compileReport(is);
	            JasperPrint jasperPrint = JasperFillManager.fillReport( report, parameterMap, new JREmptyDataSource());
	            
	            String filename = "new-filename.pdf";

	            response.setContentType("application/pdf");
	            response.addHeader("Content-disposition", "attachment; filename=" +filename);
	            OutputStream outputStream = response.getOutputStream();
	     
	            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
	        } catch (JRException | IOException e) {
	            System.out.println("Error in generating pdf : {}");
	        }
	}
}
