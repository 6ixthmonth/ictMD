package com.sesoc.ictmd.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MVCInterceptor extends HandlerInterceptorAdapter{

	/**
	 * return true 필터에 걸리지않고 컨트롤러대로 그대로 보낸다.
	 * return false 필터에 만족하지않아 컨트롤러의 명령대로 보내지 않는다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userId");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			
			return false;
		} else
			return true;
	}
}