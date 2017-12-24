package com.xupt.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.xupt.dao.impl.EmployeeDAOImpl;
import com.xupt.po.Employee;

@Service("employeeService")
public class EmployeeService {

	@Resource
	private EmployeeDAOImpl employeeDAOImpl;
	
	
	

	public void add(String name,int salary,int age){
		
		try {
			System.out.println("employeeService.add()");
			Employee emp = new Employee();
			emp.setName(name);
			emp.setSalary(salary);
			emp.setAge(age);
			employeeDAOImpl.save(emp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(Employee emp){
		
		try {
			System.out.println("employeeService.delete()");
			
			employeeDAOImpl.delete(emp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Employee> findAll(){
		try {
			return employeeDAOImpl.findAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Employee findById(int id){
		try {
			return employeeDAOImpl.findById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void modify(Employee e){
		try {
			employeeDAOImpl.modify(e);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	public EmployeeDAOImpl getEmployeeDAOImpl() {
		return employeeDAOImpl;
	}

	public void setEmployeeDAOImpl(EmployeeDAOImpl employeeDAOImpl) {
		this.employeeDAOImpl = employeeDAOImpl;
	}
	

}
