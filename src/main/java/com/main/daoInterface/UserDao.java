package com.main.daoInterface;

import com.main.bean.User;

public interface UserDao {
	
	int signup(User user);
	User login(User user);
	int updateUser(User user);
	void deleteUser(String uid);

}
