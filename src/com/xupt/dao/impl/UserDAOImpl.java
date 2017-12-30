package com.xupt.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.xupt.dao.UserDAO;
import com.xupt.po.User;

@Component
public class UserDAOImpl implements UserDAO{

	@Resource
	private HibernateTemplate hibernateTemplate;
	


	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<User> find(User user) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl.findById()");
		List<User> list = hibernateTemplate.find("from User where username=? and password=?",user.getUsername(),user.getPassword());
		//System.out.println(list);
		return list;
	}
	
	@Override
	public User findById(int id) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl.findById()");
		User user = (User)hibernateTemplate.find("from User where id=?",id).get(0);
		//System.out.println(list);
		return user;
	}

	@Override
	public void modify(User user) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl.modify()");
		hibernateTemplate.update(user);
	}

	@Override
	public void save(User user) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl.save()");
		hibernateTemplate.save(user);
	}

	@Override
	public boolean findByName(String name) throws SQLException {
		// TODO Auto-generated method stub
		if(hibernateTemplate.find("from User where username=?",name).size() > 0){
			return true;
		};
		return false;
	}

	
	
}
