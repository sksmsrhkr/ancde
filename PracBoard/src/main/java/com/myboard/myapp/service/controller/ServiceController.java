package com.myboard.myapp.service.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboard.myapp.service.service.face.ServiceService;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ServiceService serviceService;

	@RequestMapping("/faq")
	public void serviceCenter() {
		logger.info("접속");
	}
	
	@RequestMapping("/inquiry")
	public void inquiryCenter() {
		
	}
}
