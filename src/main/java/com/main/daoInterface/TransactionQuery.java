package com.main.daoInterface;

public interface TransactionQuery {
	
	String INSERT_RECORD = "insert into transaction set uid=?, type=?, name=?, amount=?, icon=?, date=?";
	String INCOMES = "select uid, type, name, amount, icon, DATE_FORMAT(date, '%d-%m-%Y') as date, date as old_date, time from transaction where uid=? and type='income' order by STR_TO_DATE(date, '%d-%m-%Y') desc";
	String EXPENSES = "select uid, type, name, amount, icon, DATE_FORMAT(date, '%d-%m-%Y') as date, date as old_date, time from transaction where uid=? and type='expense' order by STR_TO_DATE(date, '%d-%m-%Y') desc";
	String TOTAL_INCOME = "select IFNULL(SUM(amount), 0) as income from transaction where uid=? and type='income'";
	String TOTAL_EXPENSE = "select IFNULL(SUM(amount), 0) as expense from transaction where uid=? and type='expense'";
	String TOTAL_BALANCE = "select IFNULL(SUM(amount), 0) - IFNULL((select SUM(amount) from transaction where uid=? and type='expense'), 0) as balance from transaction where uid=? and type='income'";
	String UPDATE_RECORD = "update transaction set name=?, amount=?, icon=?, date=? where uid=? and type=? and date=? and time=?";
	String DELETE_RECORD = "delete from transaction where uid=? and type=? and date=? and time=?";
	String QUARTER_INCOMES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='income' and YEAR(date)=YEAR(CURDATE()) and MONTH(date) between 1 and 3 group by MONTH(date)";
	String QUARTER_EXPENSES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='expense' and YEAR(date)=YEAR(CURDATE()) and MONTH(date) between 1 and 3 group by MONTH(date)";
	String SEMI_INCOMES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='income' and YEAR(date)=YEAR(CURDATE()) and MONTH(date) between 1 and 6 group by MONTH(date)";
	String SEMI_EXPENSES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='expense' and YEAR(date)=YEAR(CURDATE()) and MONTH(date) between 1 and 6 group by MONTH(date)";
	String ANNUAL_INCOMES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='income' and YEAR(date)=YEAR(CURDATE()) group by MONTH(date)";
	String ANNUAL_EXPENSES = "select MONTH(date) as month, SUM(amount) as data from transaction where uid=? and type='expense' and YEAR(date)=YEAR(CURDATE()) group by MONTH(date)";

}
