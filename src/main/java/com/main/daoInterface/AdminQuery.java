package com.main.daoInterface;

public interface AdminQuery {
	
	String SELECT = "select * from admin where username=? and password=?";
	String SELECT_ALL_USER = "select * from user";
	String SELECT_ALL_RECORD = "select uid, type, name, amount, icon, DATE_FORMAT(date, '%d-%m-%Y') as date, date as old_date, time from transaction order by STR_TO_DATE(date, '%Y-%m-%d') desc";
	String TOTAL_INCOME = "select IFNULL(SUM(amount), 0) as income from transaction where type='income'";
	String TOTAL_EXPENSE = "select IFNULL(SUM(amount), 0) as expense from transaction where type='expense'";

}
