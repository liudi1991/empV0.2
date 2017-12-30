package com.xupt.dao;

import java.sql.SQLException;
import java.util.List;

import com.xupt.po.User;



public interface UserDAO {
	
	public void save(User user) throws SQLException;
	
	/*
	 * 查找用户
	 */
	public List<User> find(User user)throws SQLException;
	
	/*
	 * 
	 */
	public boolean findByName(String name) throws SQLException;
	/*
	 *
	 * 根据ID查找用户
	 */
	public User findById(int id) throws SQLException;
	/* 
	 * 修改用户信息 
	 * */
	public void modify(User user) throws SQLException;

}