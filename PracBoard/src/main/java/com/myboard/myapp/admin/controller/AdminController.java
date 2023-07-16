package com.myboard.myapp.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboard.myapp.admin.service.face.AdminService;
import com.myboard.myapp.dto.Admin;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	
	@GetMapping("/login")
	public void adminLogin() {
		logger.info("관리자 페이지");
	}
	
	@PostMapping("/login")
	public String adminlogin(Admin admin, HttpSession session) {
		
		logger.info("{}", admin);
		
		boolean isLogin = adminService.getLogin(admin);
		
		if(isLogin == true) {
			session.setAttribute("adminLogin", isLogin);
			
			return "redirect: ./manage";
		
		} else {
			return "redirect: /admin/login";
		}
		
	}
	
	@RequestMapping("/manage")
	public void managePage() {
		
	}
	
	
}
