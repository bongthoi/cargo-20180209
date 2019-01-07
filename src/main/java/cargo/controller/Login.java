package cargo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Login {
	
	 @RequestMapping(value = { "/login"}, method = RequestMethod.GET)
	    public ModelAndView dashboard(@RequestParam(value = "error", required = false) String error,
	    		@RequestParam(value = "logout", required = false) String logout) {
		 ModelAndView mav=new ModelAndView();
		 mav.setViewName("admin/signin/login");
			if (error != null) {
					mav.addObject("error", "Invalid username and password!");
				//	System.out.println("a1");
			}
			  if (logout != null) {
				  mav.addObject("msg", "You've been logged out successfully.");
				//  System.out.println("a2");
			 }
	        return mav;
	    }
	 
	 
}
