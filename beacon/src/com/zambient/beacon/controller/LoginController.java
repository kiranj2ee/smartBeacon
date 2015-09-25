package com.zambient.beacon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zambient.beacon.bean.Login;
import com.zambient.beacon.model.VendorBO;
import com.zambient.beacon.service.VendorService;

@Controller
public class LoginController {
	
	final static Logger logger = Logger.getLogger(LoginController.class);
	@Autowired 
	private HttpSession vendorSession;
	@Autowired
	VendorService vendorService;
	
	@RequestMapping("/showRegistration")  
	public ModelAndView showRegistration(Model model) {
		model.addAttribute("vendor", new VendorBO());
		return new ModelAndView("Registration", "title", "Registration Page");  
	} 
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute("vendor") VendorBO vendor,
            BindingResult result, Map<String, Object> model) {
		System.out.println(vendor.getCompany());
		vendorService.saveVendor(vendor);
        if (result.hasErrors()) {
            return "Registration";
        }
        model.remove(vendor);
        /*((Model) model).addAttribute("login", new Login());
        ((Model) model).addAttribute("login", new Login());*/
        return "redirect:/showLogin";
    }
	
	@RequestMapping("/showLogin")  
    public ModelAndView showLogin(Model model) { 
		model.addAttribute("login", new Login());
		model.addAttribute("vendor", new VendorBO());
        return new ModelAndView("Login", "title", "Login Page");  
    }  
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Valid @ModelAttribute("login") Login login,
            BindingResult result, Map<String, Object> model, HttpSession session,HttpServletRequest request,HttpServletResponse response) {
 
        if (result.hasErrors()) {
            return "Login";
        }
        
        String email= login.getEmail();
		String password = login.getPassword();
		VendorBO vendor = vendorService.authenticateUser(email, password);
		System.out.println("after DB call===>"+vendor.getEmail());
		if(vendor != null && password.equals(vendor.getPassword())){
			/*vendorSession.setAttribute("vendor", vendor);*/
			vendorSession.setAttribute("email", vendor.getEmail());
			vendorSession.setAttribute("vendorId", vendor.getId());
			//return "Dashboard";
			//response.set
			return "redirect:/showDashboard";
		}else{
			result.addError(new FieldError("login","password","Password doesn't match"));
			return "Login";
		}
    }
	
}	
