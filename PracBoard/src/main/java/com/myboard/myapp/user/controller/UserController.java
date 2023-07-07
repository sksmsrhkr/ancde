package com.myboard.myapp.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboard.myapp.dto.User;
import com.myboard.myapp.user.service.face.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService userService;
	
	@GetMapping("/join")
	public void userJoin() {
		
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String userLogin(User user, HttpSession session) {
		
		Boolean isLogin = userService.login(user);  
		
		logger.info("isLogin: {}" , isLogin);

		if (isLogin == true) {
			
			User userInfo  = userService.getUser(user);
			
			logger.info("user: {}", userInfo);
			
			session.setAttribute("login", isLogin);
			session.setAttribute("userNo", userInfo.getUserNo());
			session.setAttribute("userNick", userInfo.getUserNick());
			
			return "redirect:/board/list";			
		} else {
			return "redirect:./login";
		}
		
		
	}
	

}
