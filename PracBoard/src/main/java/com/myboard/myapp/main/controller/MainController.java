package com.myboard.myapp.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.main.service.face.MainService;
import com.myboard.myapp.user.service.face.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired UserService userService;
	@Autowired MainService mainService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
		

		
		if(session.getAttribute("login") != null ) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		logger.info("가보자{}", userNo);
		
//		User user = userService.getUserInfo(userNo);
		String userNick = userService.getUserNick(userNo);
		
		logger.info("가보자{}", userNick);
		
		UserFile userFile = userService.getUserImg(userNo);
	
		logger.info("가보자{}", userFile);
		
		model.addAttribute("userNick", userNick);
		model.addAttribute("userfile", userFile);
		
		}
		
		List<Map<Object, String>> boardList = mainService.getPopularBoard();		
		logger.info("{}", boardList);		
		model.addAttribute("popBoard", boardList);
		
		List<Map<Object, String>> newList = mainService.getNewBoard(); 
		model.addAttribute("newBoard", newList);
		
		
		return "main";
	}
	
}
