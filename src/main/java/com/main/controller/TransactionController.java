package com.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.main.authentication.Records;
import com.main.authentication.Validation;
import com.main.bean.Transaction;
import com.main.bean.User;
import com.main.daoImplement.TransactionDaoImpl;

@Controller
public class TransactionController {
	
	@Autowired
	TransactionDaoImpl transactionDao;
	
	@RequestMapping(value="/insert_record", method=RequestMethod.POST)
	public String recordTransaction(@ModelAttribute("transaction") Transaction transaction, RedirectAttributes redirect) {
		if(Validation.isValidAmount(transaction.getAmount())) {
			int rows = transactionDao.insertRecord(transaction);
			
			if(rows==1) {
				if(transaction.getType().equals("income")) {
					return "redirect:incomes";
				}
				else {
					return "redirect:expenses";
				}
			}
			else {
				return "error/page500";
			}
		}
		else {
			redirect.addFlashAttribute("invalidRecord", transaction);
			redirect.addFlashAttribute("recordMessage", "Please enter a valid amount");
			
			if(transaction.getType().equals("income")) {
				return "redirect:incomes";
			}
			else {
				return "redirect:expenses";
			}
		}
	}
	
	@RequestMapping("/incomes")
	public String getIncome(@SessionAttribute("validUser") User user, Model model) {
		List<Transaction> incomeList = transactionDao.allIncomes(user.getUid());
		Transaction totalIncome = transactionDao.totalIncome(user.getUid());
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("incomeList", incomeList);
		return "income";
	}
	
	@RequestMapping("/expenses")
	public String getExpense(@SessionAttribute("validUser") User user, Model model) {
		List<Transaction> expenseList = transactionDao.allExpenses(user.getUid());
		Transaction totalExpense = transactionDao.totalExpense(user.getUid());
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("expenseList", expenseList);
		return "expense";
	}
	
	@RequestMapping(value="/update_record", method=RequestMethod.POST)
	public String updateRecord(@ModelAttribute("transaction") Transaction transaction) {
		int rows = transactionDao.updateRecord(transaction);
		
		if(rows==1) {
			if(transaction.getType().equals("income")) {
				return "redirect:incomes";
			}
			else {
				return "redirect:expenses";
			}
		}
		else {
			return "error/page500";
		}
	}
	
	@RequestMapping(value="/delete_record", method=RequestMethod.POST)
	public String deleteRecord(@ModelAttribute("transaction") Transaction transaction) {
		int rows = transactionDao.deleteRecord(transaction);
		
		if(rows==1) {
			if(transaction.getType().equals("income")) {
				return "redirect:incomes";
			}
			else {
				return "redirect:expenses";
			}
		}
		else {
			return "error/page500";
		}
	}
	
	@RequestMapping("/dashboard_quarter")
	public String quarterDashboard(@SessionAttribute("validUser") User user, Model model) {
		Transaction totalBalance = transactionDao.totalBalance(user.getUid());
		Transaction totalIncome = transactionDao.totalIncome(user.getUid());
		Transaction totalExpense = transactionDao.totalExpense(user.getUid());
		Map<Integer, String> incomeData = Records.getChartData(transactionDao.incomeData(user.getUid(), 3), 3);
		Map<Integer, String> expenseData = Records.getChartData(transactionDao.expenseData(user.getUid(), 3), 3);
		model.addAttribute("totalBalance", totalBalance);
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("chartHeading", "Quarter Budget Analysis");
		model.addAttribute("labels", Records.getChartLabel(3));
		model.addAttribute("incomeData", incomeData);
		model.addAttribute("expenseData", expenseData);
		return "dashboard";
	}
	
	@RequestMapping("/dashboard_semi")
	public String semiDashboard(@SessionAttribute("validUser") User user, Model model) {
		Transaction totalBalance = transactionDao.totalBalance(user.getUid());
		Transaction totalIncome = transactionDao.totalIncome(user.getUid());
		Transaction totalExpense = transactionDao.totalExpense(user.getUid());
		Map<Integer, String> incomeData = Records.getChartData(transactionDao.incomeData(user.getUid(), 6), 6);
		Map<Integer, String> expenseData = Records.getChartData(transactionDao.expenseData(user.getUid(), 6), 6);
		model.addAttribute("totalBalance", totalBalance);
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("chartHeading", "Semi-Annual Budget Analysis");
		model.addAttribute("labels", Records.getChartLabel(6));
		model.addAttribute("incomeData", incomeData);
		model.addAttribute("expenseData", expenseData);
		return "dashboard";
	}
	
	@RequestMapping("/dashboard_annual")
	public String annualDashboard(@SessionAttribute("validUser") User user, Model model) {
		Transaction totalBalance = transactionDao.totalBalance(user.getUid());
		Transaction totalIncome = transactionDao.totalIncome(user.getUid());
		Transaction totalExpense = transactionDao.totalExpense(user.getUid());
		Map<Integer, String> incomeData = Records.getChartData(transactionDao.incomeData(user.getUid(), 12), 12);
		Map<Integer, String> expenseData = Records.getChartData(transactionDao.expenseData(user.getUid(), 12), 12);
		model.addAttribute("totalBalance", totalBalance);
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("chartHeading", "Annual Budget Analysis");
		model.addAttribute("labels", Records.getChartLabel(12));
		model.addAttribute("incomeData", incomeData);
		model.addAttribute("expenseData", expenseData);
		return "dashboard";
	}

}
