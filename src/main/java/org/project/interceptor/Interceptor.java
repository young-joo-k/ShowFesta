package org.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Interceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
//			request.getRequestURL()를 하게 되면
//			StringBuffer타입으로 url을 가져옴
			String getRequestURL = request.getRequestURL().toString();
			String parse[] = getRequestURL.split("/");
			String url = parse[0]+"//"+parse[2];
			response.sendRedirect(url + "/join/login");
			return false;
		}
		return true;
	}

}
