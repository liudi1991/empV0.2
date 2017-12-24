package com.xupt.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xupt.po.User;
import com.xupt.service.UserService;



@Controller("userController")
@RequestMapping("/user.do")
public class UserController {

	@Resource
	private UserService userService;

	@RequestMapping(params = "method=home")
	public String home(Model model,int id) {
		System.out.println("userController.home()");
		User user=userService.findById(id);
		model.addAttribute("currentUser", user);
		
		return "/WEB-INF/views/home.jsp";
	}
	
	@RequestMapping(params = "method=save")
	public String add(String username, String password) {
		System.out.println("userController.add()");
		userService.add(username, password);
		return "index.jsp";
	}

	@RequestMapping(params = "method=find")
	public String find(Model model, String username, String password) {
		System.out.println("userController.find()");
		List<User> list=userService.find(username, password);
		if (list.size() != 0) {
			User user=list.get(0);
			model.addAttribute("currentUser", user);
			return "/WEB-INF/views/home.jsp";
		}
		;
		model.addAttribute("error", "用户名或者密码错误，请检查！");
		return "index.jsp";
	}
	
	@RequestMapping(params="method=premodify")
	public String premodify(Model model,int id) {
		System.out.println("userController.premodify()");
		User user=userService.findById(id);
		model.addAttribute("currentUser", user);
		return "/WEB-INF/views/updateUser.jsp";
	}
	
	@RequestMapping(params="method=modify")
	public String modify(Model model,int id,String username,String password) {
		System.out.println("userController.modify()");
		User user=userService.findById(id);
		user.setPassword(password);
		userService.modify(user);
		model.addAttribute("currentUser", user);
		return "/WEB-INF/views/home.jsp";
	}
	
	@RequestMapping(params="method=logout")
	public String logout() {
		System.out.println("userController.logout()");
		
		
		return "index.jsp";
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
