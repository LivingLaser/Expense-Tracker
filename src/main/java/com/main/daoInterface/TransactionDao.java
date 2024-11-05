package com.main.daoInterface;

import java.util.List;

import com.main.bean.Transaction;

public interface TransactionDao {
	
	int insertRecord(Transaction transaction);
	List<Transaction> allIncomes(String uid);
	List<Transaction> allExpenses(String uid);
	Transaction totalIncome(String uid);
	Transaction totalExpense(String uid);
	int updateRecord(Transaction transaction);
	int deleteRecord(Transaction transaction);
	Transaction totalBalance(String uid);
	List<Transaction> incomeData(String uid, int months);
	List<Transaction> expenseData(String uid, int months);

}
