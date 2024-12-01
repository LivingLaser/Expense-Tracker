package com.main.daoImplement;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.main.bean.User;
import com.main.daoInterface.UserDao;
import com.main.daoInterface.UserQuery;

public class UserDaoImpl implements UserDao {
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int signup(User user) {
		int rows;
		
		try {
			rows = template.update(UserQuery.INSERT, user.getName(), user.getEmail(), user.getPhone(), user.getPassword());
		}
		catch(Exception e) {
			return 0;
		}
		
		return rows;
	}

	@Override
	public User login(User user) {
		RowMapper<User> rowMapper = new UserRowMapper();
		User retrieved;
		
		try {
			retrieved = template.queryForObject(UserQuery.SELECT, rowMapper, user.getEmail(), user.getPassword());
		}
		catch(Exception e) {
			return null;
		}
		
		return retrieved;
	}

	@Override
	public int updateUser(User user) {
		int rows = template.update(UserQuery.UPDATE, user.getName(), user.getEmail(), user.getPhone(), user.getPassword(), user.getUid());
		return rows;
	}

	@Override
	public int deleteUser(String uid) {
		int rows = template.update(UserQuery.DELETE, uid);
		return rows;
	}

	@Override
	public void deleteRecords(String uid) {
		template.update(UserQuery.DELETE_RECORDS, uid);
	}

}
