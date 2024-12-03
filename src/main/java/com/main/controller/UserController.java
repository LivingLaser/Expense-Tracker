package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.main.authentication.Validation;
import com.main.bean.User;
import com.main.daoImplement.UserDaoImpl;

@Controller
@SessionAttributes({"validUser", "userLoggedIn"})
public class UserController {
	
	@Autowired
	UserDaoImpl userDao;
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupUser(@ModelAttribute("user") User user, RedirectAttributes redirect) {
		int rows = userDao.signup(user);
		
		if(rows==1) {
			redirect.addFlashAttribute("color", "chartreuse");
			redirect.addFlashAttribute("signupMessage", "Account is created. You can now login to your account.");
			return "redirect:register";
		}
		else {
			redirect.addFlashAttribute("userData", user);
			redirect.addFlashAttribute("color", "crimson");
			redirect.addFlashAttribute("signupMessage", "This email is already exist. Try with another email.");
			return "redirect:register";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@ModelAttribute("user") User user, Model model, RedirectAttributes redirect) {
		User retrieved = userDao.login(user);
		
		if(Validation.isValidUser(user, retrieved)) {
			model.addAttribute("validUser", retrieved);
			model.addAttribute("userLoggedIn", true);
			return "redirect:dashboard_quarter";
		}
		else {
			redirect.addFlashAttribute("userPassed", user);
			redirect.addFlashAttribute("loginMessage", "Wrong Email ID or Password");
			return "redirect:register";
		}
	}
	
	@RequestMapping(value="/update_user", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, RedirectAttributes redirect, SessionStatus status) {
		int rows = userDao.updateUser(user);
		
		if(rows==1) {
			status.setComplete();
			redirect.addFlashAttribute("loginMessage", "Login again to your account");
			return "redirect:register";
		}
		else {
			return "error/page500";
		}
	}
	
	@RequestMapping("/user_logout")
	public String logoutUser(Model model, SessionStatus session) {
		model.addAttribute("userLoggedIn", false);
		session.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping(value="/delete_account", method=RequestMethod.POST)
	public String deleteAccount(@ModelAttribute("user") User user, RedirectAttributes redirect, SessionStatus status) {
		User retrieved = userDao.login(user);
		
		if(Validation.isValidUser(user, retrieved)) {
			userDao.deleteUser(retrieved.getUid());
			status.setComplete();
			redirect.addFlashAttribute("accountMessage", "Your account is successfully deleted.");
			return "redirect:register";
		}
		else {
			redirect.addFlashAttribute("accountMessage", "Incorrect Password, try again after sometime");
			return "redirect:dashboard_quarter";
		}
	}

}
