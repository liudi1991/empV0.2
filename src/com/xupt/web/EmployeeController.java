package com.xupt.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xupt.dao.EmployeeDAO;
import com.xupt.po.Employee;
import com.xupt.po.User;
import com.xupt.service.EmployeeService;

@Controller("employeeController")
@RequestMapping("/emp.do")
public class EmployeeController {

	@Resource
	private EmployeeService employeeService;

	@RequestMapping(params = "method=photo")
	public String photo() {
		System.out.println("EmployeeController.photo()");
		
		return "/WEB-INF/views/PhotoView.jsp";

	}
	
	
	@RequestMapping(params = "method=find")
	public String find(Model model, int id) {
		System.out.println("EmployeeController.find()");
		Employee e = employeeService.findById(id);
		model.addAttribute("e", e);
		return "/WEB-INF/views/empInfo.jsp";

	}

	@RequestMapping(params = "method=prefind")
	public String prefind() {
		System.out.println("EmployeeController.prefind()");

		return "/WEB-INF/views/searchEmp.jsp";
	}

	@RequestMapping(params = "method=presave")
	public String presave() {
		System.out.println("EmployeeController.presave()");

		return "/WEB-INF/views/addEmp.jsp";
	}

	@RequestMapping(params = "method=save")
	public String save(String name, int salary, int age) {
		System.out.println("EmployeeController.save()");

		employeeService.add(name, salary, age);
		return "emp.do?method=findAll";
	}

	@RequestMapping(params = "method=findAll")
	public String findAll(Model model) {
		System.out.println("EmployeeController.findAll()");
		List<Employee> list = employeeService.findAll();

		model.addAttribute("employees", list);
		return "/WEB-INF/views/emplist.jsp";
	}

	@RequestMapping(params = "method=findByID")
	public String findByID(Model model, int id) {
		System.out.println("EmployeeController.findByID()");
		Employee e = employeeService.findById(id);

		model.addAttribute("e", e);
		return "/WEB-INF/views/empInfo.jsp";
	}

	@RequestMapping(params = "method=premodify")
	public String premodify(Model model, int id) {
		System.out.println("EmployeeController.premodify()");
		Employee e = employeeService.findById(id);

		model.addAttribute("e", e);
		return "/WEB-INF/views/updateEmp.jsp";
	}

	@RequestMapping(params = "method=modify")
	public String modify(int id, String name, int salary, int age) {
		System.out.println("EmployeeController.modify()");
		Employee e = new Employee();
		e.setId(id);
		e.setName(name);
		e.setSalary(salary);
		e.setAge(age);
		employeeService.modify(e);

		return "emp.do?method=findAll";
	}

	@RequestMapping(params = "method=delete")
	public String delete(int id) {
		System.out.println("EmployeeController.delete()");
		Employee e = employeeService.findById(id);

		employeeService.delete(e);

		return "emp.do?method=findAll";
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
}
