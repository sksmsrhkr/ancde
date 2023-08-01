package com.myboard.myapp.service.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.service.service.face.ServiceService;
import com.myboard.myapp.user.service.face.UserService;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ServiceService serviceService;
	@Autowired UserService userService;

	@RequestMapping("/faq")
	public void serviceCenter() {
		logger.info("접속");
	}
	
	@GetMapping("/inquiry")
	public void inquiryCenter(HttpSession session, Model model) {
		
		if(session.getAttribute("login") != null ) {
			
			int userNo = (Integer) session.getAttribute("userNo");
			
			String userNick = userService.getUserNick(userNo);
			UserFile userFile = userService.getUserImg(userNo);
		
			model.addAttribute("userNick", userNick);
			model.addAttribute("userfile", userFile);
			
			}
	}
	
	@PostMapping("/inquiry")
	public String inquiryContent(Inquiry inquiry, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		inquiry.setUserNo(userNo);
		logger.info("{}", inquiry);
		
		serviceService.insertInqu(inquiry);
		
		logger.info("왜 리턴이 안돼??");
		
		return "redirect:./faq";
	}
	
	@GetMapping("/qnaView")
	public void qnaView(HttpSession session, Model model, int inquiryNo) {
		
		if(session.getAttribute("login") != null ) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		String userNick = userService.getUserNick(userNo);
		UserFile userFile = userService.getUserImg(userNo);
	
		model.addAttribute("userNick", userNick);
		model.addAttribute("userfile", userFile);
		}
		
		if(session.getAttribute("adminLogin") != null ) {
			int adminNo = (Integer) session.getAttribute("adminNo");
			model.addAttribute("adminNo", adminNo);
		}
		
		Inquiry inquiry = serviceService.getInquiryView(inquiryNo);
		
		model.addAttribute("inquiry", inquiry);
		
	}
	
	@PostMapping("/qnaView")
	public String qnaReturnView(Inquiry inquiry) {
		
		logger.info("{}", inquiry);
		
		serviceService.insertAnswer(inquiry);
		
		return "redirect: ./qnaView?inquiryNo=" + inquiry.getInquiryNo();
	}
	
	@RequestMapping("/deleteAnswer")
	public String deleteanswer(int inquiryNo) {
		serviceService.deleteAnswer(inquiryNo);
		
		return "redirect: ./qnaView?inquiryNo=" + inquiryNo;
	}
}
