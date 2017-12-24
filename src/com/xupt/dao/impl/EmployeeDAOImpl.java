package com.xupt.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.xupt.dao.EmployeeDAO;
import com.xupt.po.Employee;

@Component
public class EmployeeDAOImpl implements EmployeeDAO {

	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<Employee> findAll() throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("EmployeeDAOImpl.findAll()");
		return hibernateTemplate.find("from Employee");
	}

	@Override
	public void save(Employee e) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("EmployeeDAOImpl.save()");
		hibernateTemplate.save(e);
	}

	@Override
	public void delete(Employee e) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("EmployeeDAOImpl.delete()");
		hibernateTemplate.delete(e);
	}

	@Override
	public Employee findById(int id) throws SQLException {
		// TODO Auto-generated method stub
		Employee e=null;
		System.out.println("EmployeeDAOImpl.findById()");
		if(hibernateTemplate.find("from Employee where id=?", id).size()!=0){
			e=(Employee) hibernateTemplate.find("from Employee where id=?", id).get(0);
			//System.out.println(e.getName());
			//System.out.println(e.getId());
		}
		return e;
		
	}

	@Override
	public void modify(Employee e) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("EmployeeDAOImpl.modify()");
		hibernateTemplate.update(e);
	}

}
