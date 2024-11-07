package com.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.main.authentication.Validation;
import com.main.bean.Admin;
import com.main.bean.Transaction;
import com.main.bean.User;
import com.main.daoImplement.AdminDaoImpl;

@Controller
@SessionAttributes("adminLoggedIn")
public class AdminController {
	
	@Autowired
	AdminDaoImpl adminDao;
	
	@RequestMapping("/admin_login")
	public String getLoginAdmin() {
		return "admin_login";
	}
	
	@RequestMapping(value="/login_admin", method=RequestMethod.POST)
	public String loginAdmin(@ModelAttribute("admin") Admin admin, Model model) {
		Admin retrieved = adminDao.login(admin);
		
		if(Validation.loginValidation(admin, retrieved)) {
			model.addAttribute("adminLoggedIn", true);
			return "redirect:admin_dashboard";
		}
		else {
			model.addAttribute("admin", admin);
			model.addAttribute("adminMessage", "Wrong Username or Password...");
			return "admin_login";
		}
	}
	
	@RequestMapping("/admin_dashboard")
	public String getAdminDashboard() {
		return "admin_dashboard";
	}
	
	@RequestMapping("/user_list")
	public String getUserList(Model model) {
		List<User> users = adminDao.userList();
		model.addAttribute("users", users);
		return "admin_user_data";
	}
	
	@RequestMapping("/record_list")
	public String getRecordList(Model model) {
		List<Transaction> records = adminDao.recordList();
		Transaction total = adminDao.totalIncome();
		total.setTotalExpense(adminDao.totalExpense().getTotalExpense());
		model.addAttribute("records", records);
		model.addAttribute("total", total);
		return "admin_transaction_data";
	}
	
	@RequestMapping("/admin_logout")
	public String logoutAdmin(SessionStatus session) {
		session.setComplete();
		return "redirect:/";
	}

}
