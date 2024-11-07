package com.main.daoInterface;

import java.util.List;

import com.main.bean.Admin;
import com.main.bean.Transaction;
import com.main.bean.User;

public interface AdminDao {
	
	Admin login(Admin admin);
	List<User> userList();
	List<Transaction> recordList();
	Transaction totalIncome();
	Transaction totalExpense();

}
