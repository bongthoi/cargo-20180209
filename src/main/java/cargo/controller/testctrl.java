package cargo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testctrl {

	@RequestMapping(value={"admin/test"})
	public String index(Model model){
		model.addAttribute("headTitle", "test");
		return "admin/test/text";
	}
}
