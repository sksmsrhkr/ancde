package com.myboard.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Interceptor implements HandlerInterceptor {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info(" + + Interceptor + +");
		
		//세션 객체
		HttpSession session = request.getSession();
		
		if(session != null) {
			
		}
		if( session.getAttribute("login") == null || session.getAttribute("userNo") == null) {
			logger.info(" >> 접속 불가 : 비로그인 상태");
			
			response.sendRedirect("/user/login");
			
			//컨트롤러 접근 금지
			return false;
		}
		
		//컨트롤러 접근 허용
		logger.info(" >> 접속 허용 : 로그인 상태");
		return true;
	}
	
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
		
    		logger.info("+ + + 인터셉터 종료 + + +");
    }

}
