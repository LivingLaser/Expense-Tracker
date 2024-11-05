package com.main.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.main.bean.Transaction;

public class TransactionIncomeRowMapper implements RowMapper<Transaction> {

	@Override
	public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
		Transaction transaction = new Transaction();
		transaction.setTotalIncome(rs.getString("income"));
		return transaction;
	}

}
