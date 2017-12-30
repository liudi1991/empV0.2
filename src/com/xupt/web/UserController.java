package com.xupt.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xupt.po.User;
import com.xupt.service.UserService;



@Controller("userController")
@RequestMapping("/user.do")
public class UserController {

	@Resource
	private UserService userService;

	/*
	 * 点击注册
	 */
	@RequestMapping(params = "method=register",method=RequestMethod.GET)
	public String register() {
		System.out.println("userController.register()");
		return "register";
	}
	
	
	/*
	 *注册页面 
	 */
	@RequestMapping(params = "method=save",method=RequestMethod.POST)
	public String add(String username, String password) {
		System.out.println("userController.add()");
		userService.add(username, password);
		return "redirect:/index.jsp";
	}
	
	/*
	 * 登陆界面
	 */
	@RequestMapping(params = "method=find")
	
	public String find(Model model,HttpSession httpSession,String username, String password) {
		System.out.println("userController.find()");
		boolean isFindByName=userService.findByName(username);
		if(isFindByName){
			List<User> list=userService.find(username, password);
			if (list.size() != 0) {
				User user=list.get(0);
				//model.addAttribute("currentUser", user);
				httpSession.setAttribute("currentUser", user);
				return "home";
			}else{
				model.addAttribute("error", "密码错误，请重新输入！");
				return "forward:/index.jsp";
			}
		}else{
			model.addAttribute("error", "用户名错误，请重新输入！");
			return "forward:/index.jsp";
		}
		
		
	}
	
	/*
	 * 进入主页
	 */
	@RequestMapping(params = "method=home",method=RequestMethod.GET)
	public String home(Model model) {
		System.out.println("userController.home()");
		return "home";
	}
	
	
	/*
	 * 点击修改
	 */
	@RequestMapping(params="method=premodify")
	public String premodify(Model model,int id) {
		System.out.println("userController.premodify()");
		return "updateUser";
	}
	
	/*
	 * 修改提交
	 */
	@RequestMapping(params="method=modify")
	public String modify(Model model, HttpSession httpSession,int id,String username,String password) {
		System.out.println("userController.modify()");
		User user=userService.findById(id);
		user.setPassword(password);
		userService.modify(user);
		httpSession.setAttribute("currentUser", user);
		return "home";
	}
	
	/*
	 * 退出系统
	 */
	@RequestMapping(params="method=logout")
	public String logout(HttpSession httpSession) {
		System.out.println("userController.logout()");
		httpSession.invalidate();
		return "redirect:/index.jsp";
	}
	
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
