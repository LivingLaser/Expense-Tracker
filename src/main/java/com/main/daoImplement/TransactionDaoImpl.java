package com.main.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;
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
		Transaction income = template.queryForObject(TransactionQuery.TOTAL_INCOME, new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setTotalIncome(rs.getString("income"));
				return transaction;
			}
			
		}, uid);
		
		return income;
	}

	@Override
	public Transaction totalExpense(String uid) {
		Transaction expense = template.queryForObject(TransactionQuery.TOTAL_EXPENSE, new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setTotalExpense(rs.getString("expense"));
				return transaction;
			}
			
		}, uid);
		
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
		Transaction balance = template.queryForObject(TransactionQuery.TOTAL_BALANCE, new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setBalance(rs.getString("balance"));
				return transaction;
			}
			
		}, uid, uid);
		
		return balance;
	}

	@Override
	public List<Transaction> incomeData(String uid, int months) {
		RowMapper<Transaction> rowMapper = new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setDate(rs.getString("month"));
				transaction.setAmount(rs.getString("data"));
				return transaction;
			}
			
		};
		
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
		RowMapper<Transaction> rowMapper = new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setDate(rs.getString("month"));
				transaction.setAmount(rs.getString("data"));
				return transaction;
			}
			
		};
		
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
