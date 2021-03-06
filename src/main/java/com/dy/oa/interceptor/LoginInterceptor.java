package com.dy.oa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * @author
 */
public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String path = request.getRequestURI();
		System.out.println("[DEBUG接收到请求路径: " + path);
		
		String relativePath = path.substring(path.lastIndexOf("/")+1);
		System.out.println(relativePath);
		if ("login".equals(relativePath)) {
			System.out.println("[DEBUG]请求的登录页面");
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			return true;
		}

		HttpSession session = request.getSession();
		
		if (session.getAttribute("user") != null) {
			System.out.println("[DEBUG]用户已经登录");
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			return true;
		}
		if("register".equals(relativePath)) {
			System.out.println("[DEBUG]请求的注册页面");
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			return true;
		}
		System.out.println("[DEBUG]跳转回登录页面");
		request.setAttribute("msg", "请先登录操作!!");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		return false;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}
}
