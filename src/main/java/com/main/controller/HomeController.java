package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/faq")
	public String faqPage() {
		return "faq";
	}
	
	@RequestMapping("/about")
	public String aboutUs() {
		return "aboutus";
	}
	
	@RequestMapping("/register")
	public String registerPage() {
		return "login_signup";
	}

}
