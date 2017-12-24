package com.xupt.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.xupt.dao.impl.UserDAOImpl;
import com.xupt.po.Employee;
import com.xupt.po.User;

@Service("userService")
public class UserService {

	@Resource
	private UserDAOImpl userDAOImpl;

	

	public UserDAOImpl getUserDAOImpl() {
		return userDAOImpl;
	}

	public void setUserDAOImpl(UserDAOImpl userDAOImpl) {
		this.userDAOImpl = userDAOImpl;
	}

	public void add(String username,String password){
		
		try {
			System.out.println("userService.add()");
			User user=new User();
			user.setUsername(username);
			user.setPassword(password);
			userDAOImpl.save(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<User> find(String username,String password){
		
		try {
			System.out.println("userService.find()");
			User user=new User();
			user.setUsername(username);
			user.setPassword(password);
			return userDAOImpl.find(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public User findById(int id){
		User user=new User();
		try {
			user=userDAOImpl.findById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public void modify(User user){
		try {
			userDAOImpl.modify(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
