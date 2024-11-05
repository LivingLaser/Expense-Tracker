package com.main.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.main.bean.Transaction;

public class TransactionExpenseRowMapper implements RowMapper<Transaction> {

	@Override
	public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
		Transaction transaction = new Transaction();
		transaction.setTotalExpense(rs.getString("expense"));
		return transaction;
	}

}
