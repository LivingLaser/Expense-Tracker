package com.main.daoInterface;

public interface AdminQuery {
	
	String SELECT = "select * from admin where username=? and password=?";
	String SELECT_ALL_USER = "select * from user";
	String SELECT_ALL_RECORD = "select uid, type, name, amount, icon, DATE_FORMAT(date, '%d-%m-%Y') as date, date as old_date, time from transaction order by old_date desc";
	String TOTAL_INCOME = "select ROUND(IFNULL(SUM(amount), 0), 2) as income from transaction where type='income'";
	String TOTAL_EXPENSE = "select ROUND(IFNULL(SUM(amount), 0), 2) as expense from transaction where type='expense'";

}
