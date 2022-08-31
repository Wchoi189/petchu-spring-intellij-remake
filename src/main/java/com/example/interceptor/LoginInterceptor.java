package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("uid") == null) {
			String path=request.getServletPath();
			String query=request.getQueryString() == null ? "":"?"+request.getQueryString();
			request.getSession().setAttribute("dest", path+query);
			response.sendRedirect("/user/login");
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
