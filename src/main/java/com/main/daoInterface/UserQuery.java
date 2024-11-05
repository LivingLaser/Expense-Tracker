package com.main.daoInterface;

public interface UserQuery {
	
	String INSERT = "insert into user set name=?, email=?, phone=?, password=?";
	String SELECT = "select * from user where email=? and password=?";
	String UPDATE = "update user set name=?, email=?, phone=?, password=? where uid=?";

}
