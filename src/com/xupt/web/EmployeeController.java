package com.xupt.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(params = "method=grid")
	public String grid() {
		System.out.println("EmployeeController.grid()");
		
		return "Jqgrid";

	}
	
	@RequestMapping(params = "method=griddata")
	public String griddata() {
		System.out.println("EmployeeController.grid()");
		
		return "Jqgrid";

	}
	
	@RequestMapping(params = "method=photo")
	public String photo() {
		System.out.println("EmployeeController.photo()");
		
		return "PhotoView";

	}
	
	
	@RequestMapping(params = "method=find")
	public String find(Model model, int id) {
		System.out.println("EmployeeController.find()");
		Employee e = employeeService.findById(id);
		model.addAttribute("e", e);
		return "empInfo";

	}

	@RequestMapping(params = "method=prefind")
	public String prefind() {
		System.out.println("EmployeeController.prefind()");

		return "searchEmp";
	}

	@RequestMapping(params = "method=presave")
	public String presave() {
		System.out.println("EmployeeController.presave()");

		return "addEmp";
	}

	@RequestMapping(params = "method=save")
	public String save(String name, int salary, int age) {
		System.out.println("EmployeeController.save()");
		employeeService.add(name, salary, age);
		return "emp.do?method=findAll";
	}

	@RequestMapping(params = "method=findAll")
	public String findAll(Model model,HttpServletRequest request) {
		System.out.println("EmployeeController.findAll()");
		Map modelMap = model.asMap();
		System.out.println(model);
        for (Object modelKey : modelMap.keySet()) {
            Object modelValue = modelMap.get(modelKey);
            System.out.println(modelKey + " -- " + modelValue);
        }
//		User user= (User)request.getSession().getAttribute("currentUser");
//		System.out.println(user.getUsername());
		List<Employee> list = employeeService.findAll();
		//model.addAttribute("currentUser", user);
		model.addAttribute("employees", list);
		return "emplist";
	}
	
	@RequestMapping(params = "method=findAll_easyui")
	public String findAll_easyui(Model model,HttpServletRequest request) {
		return "emplist-e";
	}
	
	
	@RequestMapping(params = "method=findAll_ajax")
	public @ResponseBody List<Employee> findAll_ajax(Model model,HttpServletRequest request) {
		System.out.println("EmployeeController.findAll_ajax()");
		
		List<Employee> list = employeeService.findAll();
		return list;
	}
	
	@RequestMapping(params = "method=findByID")
	public String findByID(Model model, int id) {
		System.out.println("EmployeeController.findByID()");
		Employee e = employeeService.findById(id);

		model.addAttribute("e", e);
		return "empInfo";
	}

	@RequestMapping(params = "method=premodify")
	public String premodify(Model model, int id) {
		System.out.println("EmployeeController.premodify()");
		Employee e = employeeService.findById(id);

		model.addAttribute("e", e);
		return "updateEmp";
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

		return "/index";
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
}
