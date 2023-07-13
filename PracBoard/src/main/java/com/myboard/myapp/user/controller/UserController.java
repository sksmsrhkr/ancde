package com.myboard.myapp.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.user.service.face.UserService;
import com.myboard.myapp.util.Paging;

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
			
			return "redirect: /";			
		} else {
			return "redirect:./login";
		}
		
	}

	@RequestMapping("/mypage")
	public  void mypage(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
	
		int userNo = (Integer) session.getAttribute("userNo");
		User user = userService.getUserInfo(userNo);
		
		
		Paging paging = userService.cntBoard(curPage, userNo);
		logger.info("{}", paging);
		
		int totalCount = paging.getTotalCount();
		
		List<Board> board = userService.getBoardList(paging, userNo);	
		
		logger.info("user: {}", board);
		UserFile userFile = userService.getUserImg(userNo);
		
		model.addAttribute("userfile", userFile);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("board", board);
		model.addAttribute("paging", paging);
	}
	
	@GetMapping("/userInfo")
	public void userInfo(HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		User user = userService.getUserInfo(userNo);
		
		UserFile userFile = userService.getUserImg(userNo);
	
		model.addAttribute("userfile", userFile);
	}
	
	@PostMapping("/userInfo")
	public String editUser(HttpSession session, MultipartFile file, User user) {
		logger.info(file.getOriginalFilename());
		logger.info("유젖 정보 {}", user);
		
		int userNo = (Integer) session.getAttribute("userNo");
		userService.insertProfile(userNo, file);
		
		
		return "redirect: ./mypage";
	}
	
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		
		return "main";
	}

}
