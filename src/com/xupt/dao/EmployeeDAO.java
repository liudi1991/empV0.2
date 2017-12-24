package com.xupt.dao;

import java.sql.SQLException;
import java.util.List;

import com.xupt.po.Employee;



public interface EmployeeDAO {
	
	/* 遍历所有员工 */
	public List<Employee> findAll() throws SQLException;
	
	/*
	 * 升序排列
	 */
	//public List<Employee> findAllByAscOrder(String param) throws SQLException;
	
	/*
	 * 降序排列
	 */
	//public List<Employee> findAllByDescOrder(String param) throws SQLException;
	
	/* 增加员工 */
	public void save(Employee e) throws SQLException;
	
	
	/* 根据ID删除员工 */
	public void delete(Employee e) throws SQLException;

	/* 根据ID查找员工 */
	public Employee findById(int id) throws SQLException;

	/* 修改员工信息 */
	public void modify(Employee e) throws SQLException;

}