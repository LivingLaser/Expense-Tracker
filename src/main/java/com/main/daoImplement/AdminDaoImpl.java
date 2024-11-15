package com.main.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	public List<Transaction> recordList() {
		RowMapper<Transaction> rowMapper = new TransactionRowMapper();
		List<Transaction> records = template.query(AdminQuery.SELECT_ALL_RECORD, rowMapper);
		return records;
	}

	@Override
	public Transaction totalIncome() {
		Transaction income = template.queryForObject(AdminQuery.TOTAL_INCOME, new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setTotalIncome(rs.getString("income"));
				return transaction;
			}
			
		});
		
		return income;
	}

	@Override
	public Transaction totalExpense() {
		Transaction expense = template.queryForObject(AdminQuery.TOTAL_EXPENSE, new RowMapper<Transaction>() {

			@Override
			public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
				Transaction transaction = new Transaction();
				transaction.setTotalExpense(rs.getString("expense"));
				return transaction;
			}
			
		});
		
		return expense;
	}

}
