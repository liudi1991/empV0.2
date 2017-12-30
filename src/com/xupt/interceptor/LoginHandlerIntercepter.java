package com.xupt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xupt.po.User;

/** 
 * 登陆拦截器 
 * 场景：用户点击查看的时候，我们进行登陆拦截器操作，判断用户是否登陆？ 
 * 登陆，则不拦截，没登陆，则转到登陆界面； 
 */ 

public class LoginHandlerIntercepter implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String requestURI = req.getRequestURI();  
        if(requestURI.indexOf("emp.do")>0){  
            HttpSession session = req.getSession();  
            User user = (User) session.getAttribute("currentUser");  
            if(null !=user){  
                //登陆成功的用户  
                return true;  
            }else{  
               //没有登陆，转向登陆界面  
            	resp.sendRedirect("index.jsp");
                  
              return false;  
            }  
        }else{  
            return true;  
        }  
	}
	
}
