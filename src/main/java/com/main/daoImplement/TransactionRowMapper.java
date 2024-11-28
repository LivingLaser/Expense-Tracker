package com.main.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.main.bean.Transaction;

public class TransactionRowMapper implements RowMapper<Transaction> {

	@Override
	public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
		Transaction transaction = new Transaction();
		
		transaction.setUid(rs.getString("uid"));
		transaction.setType(rs.getString("type"));
		transaction.setName(rs.getString("name"));
		transaction.setAmount(rs.getString("amount"));
		transaction.setIcon(rs.getString("icon"));
		transaction.setDate(rs.getString("date"));
		transaction.setCurrDate(rs.getString("curr_date"));
		transaction.setTime(rs.getString("time"));
		
		return transaction;
	}

}
