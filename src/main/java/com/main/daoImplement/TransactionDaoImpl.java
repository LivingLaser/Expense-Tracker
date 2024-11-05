package com.main.daoImplement;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.main.bean.Transaction;
import com.main.daoInterface.TransactionDao;
import com.main.daoInterface.TransactionQuery;

public class TransactionDaoImpl implements TransactionDao {
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int insertRecord(Transaction transaction) {
		int rows = template.update(TransactionQuery.INSERT_RECORD, transaction.getUid(), transaction.getType(), transaction.getName(), transaction.getAmount(), transaction.getIcon(), transaction.getDate());
		return rows;
	}

	@Override
	public List<Transaction> allIncomes(String uid) {
		RowMapper<Transaction> rowMapper = new TransactionRowMapper();
		List<Transaction> incomeList = template.query(TransactionQuery.INCOMES, rowMapper, uid);
		return incomeList;
	}

	@Override
	public List<Transaction> allExpenses(String uid) {
		RowMapper<Transaction> rowMapper = new TransactionRowMapper();
		List<Transaction> expenseList = template.query(TransactionQuery.EXPENSES, rowMapper, uid);
		return expenseList;
	}

	@Override
	public Transaction totalIncome(String uid) {
		RowMapper<Transaction> rowMapper = new TransactionIncomeRowMapper();
		Transaction income = template.queryForObject(TransactionQuery.TOTAL_INCOME, rowMapper, uid);
		return income;
	}

	@Override
	public Transaction totalExpense(String uid) {
		RowMapper<Transaction> rowMapper = new TransactionExpenseRowMapper();
		Transaction expense = template.queryForObject(TransactionQuery.TOTAL_EXPENSE, rowMapper, uid);
		return expense;
	}

	@Override
	public int updateRecord(Transaction transaction) {
		int rows = template.update(TransactionQuery.UPDATE_RECORD, transaction.getName(), transaction.getAmount(), transaction.getIcon(), transaction.getDate(), transaction.getUid(), transaction.getType(), transaction.getOldDate(), transaction.getTime());
		return rows;
	}

	@Override
	public int deleteRecord(Transaction transaction) {
		int rows = template.update(TransactionQuery.DELETE_RECORD, transaction.getUid(), transaction.getType(), transaction.getDate(), transaction.getTime());
		return rows;
	}

	@Override
	public Transaction totalBalance(String uid) {
		RowMapper<Transaction> rowMapper = new TransactionBalanceRowMapper();
		Transaction balance = template.queryForObject(TransactionQuery.TOTAL_BALANCE, rowMapper, uid, uid);
		return balance;
	}

	@Override
	public List<Transaction> incomeData(String uid, int months) {
		RowMapper<Transaction> rowMapper = new TransactionDataRowMapper();
		List<Transaction> incomes = null;
		
		if(months==3) {
			incomes = template.query(TransactionQuery.QUARTER_INCOMES, rowMapper, uid);
		}
		else if(months==6) {
			incomes = template.query(TransactionQuery.SEMI_INCOMES, rowMapper, uid);
		}
		else if(months==12) {
			incomes = template.query(TransactionQuery.ANNUAL_INCOMES, rowMapper, uid);
		}
		
		return incomes;
	}

	@Override
	public List<Transaction> expenseData(String uid, int months) {
		RowMapper<Transaction> rowMapper = new TransactionDataRowMapper();
		List<Transaction> expenses = null;
		
		if(months==3) {
			expenses = template.query(TransactionQuery.QUARTER_EXPENSES, rowMapper, uid);
		}
		else if(months==6) {
			expenses = template.query(TransactionQuery.SEMI_EXPENSES, rowMapper, uid);
		}
		else if(months==12) {
			expenses = template.query(TransactionQuery.ANNUAL_EXPENSES, rowMapper, uid);
		}
		
		return expenses;
	}

}
