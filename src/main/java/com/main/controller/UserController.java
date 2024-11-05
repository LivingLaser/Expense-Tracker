package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.main.authentication.Validation;
import com.main.bean.User;
import com.main.daoImplement.UserDaoImpl;

@Controller
@SessionAttributes({"validUser", "userLoggedIn"})
public class UserController {
	
	@Autowired
	UserDaoImpl userDao;
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupUser(@ModelAttribute("user") User user, Model model) {
		int rows = userDao.signup(user);
		
		if(rows==1) {
			model.addAttribute("signupMessage", "Account is created. You can now login to your account.");
			return "login_signup";
		}
		else {
			model.addAttribute("userData", user);
			model.addAttribute("signupMessage", "This email is already exist. Try with another email.");
			return "login_signup";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@ModelAttribute("user") User user, Model model) {
		User retrieved = userDao.login(user);
		
		if(Validation.loginValidation(user, retrieved)) {
			model.addAttribute("validUser", retrieved);
			model.addAttribute("userLoggedIn", true);
			return "redirect:dashboard_quarter";
		}
		else {
			model.addAttribute("userPassed", user);
			model.addAttribute("loginMessage", "Wrong Email ID or Password");
			return "login_signup";
		}
	}
	
	@RequestMapping(value="/update_user", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, SessionStatus status) {
		int rows = userDao.updateUser(user);
		
		if(rows==1) {
			status.setComplete();
			model.addAttribute("loginMessage", "Login again to your account");
			return "login_signup";
		}
		else {
			return "error/page500";
		}
	}
	
	@RequestMapping("/user_logout")
	public String logoutUser(SessionStatus session) {
		session.setComplete();
		return "redirect:/";
	}

}
