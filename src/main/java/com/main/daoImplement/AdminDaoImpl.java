package com.main.daoImplement;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.main.bean.Admin;
import com.main.bean.Transaction;
import com.main.bean.User;
import com.main.daoInterface.AdminDao;
import com.main.daoInterface.AdminQuery;

public class AdminDaoImpl implements AdminDao {
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public Admin login(Admin admin) {
		RowMapper<Admin> rowMapper = new AdminRowMapper();
		Admin retrieved;
		
		try {
			retrieved = template.queryForObject(AdminQuery.SELECT, rowMapper, admin.getUsername(), admin.getPassword());
		}
		catch(Exception e) {
			return null;
		}
		
		return retrieved;
	}

	@Override
	public List<User> userList() {
		RowMapper<User> rowMapper = new UserRowMapper();
		List<User> users = template.query(AdminQuery.SELECT_ALL_USER, rowMapper);
		return users;
	}

	@Override
	public int deleteUser(String uid) {
		int rows = template.update(AdminQuery.DELETE_USER, uid);
		return rows;
	}

	@Override
	public List<Transaction> recordList() {
		RowMapper<Transaction> rowMapper = new TransactionRowMapper();
		List<Transaction> records = template.query(AdminQuery.SELECT_ALL_RECORD, rowMapper);
		return records;
	}

	@Override
	public Transaction totalIncome() {
		RowMapper<Transaction> rowMapper = new TransactionIncomeRowMapper();
		Transaction transaction = template.queryForObject(AdminQuery.TOTAL_INCOME, rowMapper);
		return transaction;
	}

	@Override
	public Transaction totalExpense() {
		RowMapper<Transaction> rowMapper = new TransactionExpenseRowMapper();
		Transaction transaction = template.queryForObject(AdminQuery.TOTAL_EXPENSE, rowMapper);
		return transaction;
	}
	
	@Override
	public int deleteRecord(Transaction transaction) {
		int rows = template.update(AdminQuery.DELETE_RECORD, transaction.getUid(), transaction.getType(), transaction.getDate(), transaction.getTime());
		return rows;
	}

}
