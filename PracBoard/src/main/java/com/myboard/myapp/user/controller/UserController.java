package com.myboard.myapp.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardComment;
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
	public void userJoin() {}
	
	@PostMapping("/join")
	public String userjoin(User user) {
		logger.info("유저가입 : {}", user);
		
		userService.insertUser(user);
	
		return "redirect: /";
	}
	
	@GetMapping("/login")
	public void login() {}
	
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
	
	@GetMapping("/userInfo")
	public void userInfo(HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		User user = userService.getUserInfo(userNo);
		
		logger.info("가보자{}", user);
		
		UserFile userFile = userService.getUserImg(userNo);
	
		logger.info("가보자{}", userFile);
		
		model.addAttribute("user", user);
		model.addAttribute("userfile", userFile);
	}
	
	@PostMapping("/userInfo")
	public String editUser(HttpSession session, MultipartFile file, User user) {
		logger.info(file.getOriginalFilename());
		logger.info("유젖 정보 {}", user);
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		userService.insertProfile(user, file);
	
		return "redirect: ./mypage";
	}
	
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect: /";
	}
	
	@RequestMapping("/mypage")
	public  void mypage(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		User user = userService.getUserInfo(userNo);
		
		String userNick = user.getUserNick();
		
		Paging paging = userService.cntBoard(curPage, userNo);
		logger.info("{}", paging);
		
		int totalCount = paging.getTotalCount();
		int totalComCnt = userService.getCommCnt(userNo);
				
		List<Board> board = userService.getBoardList(paging, userNo);	
		
		logger.info("user: {}", board);
		UserFile userFile = userService.getUserImg(userNo);
		Date joindate = user.getUserJoindate();
		
		model.addAttribute("joindate", joindate);
		model.addAttribute("commCnt", totalComCnt);
		model.addAttribute("userNick", userNick);
		model.addAttribute("userfile", userFile);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("board", board);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping("/commentList")
	public  void commList(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		User user = userService.getUserInfo(userNo);
		logger.info("ggg{}", user);
		
		String userNick = user.getUserNick();
		Date joindate = user.getUserJoindate();
		UserFile userFile = userService.getUserImg(userNo);	
				
		Paging paging = userService.cntComment(curPage, userNo);
		logger.info("{}", paging);
		
		int totalCount = userService.getBoardCnt(userNo);
		int totalComCnt = userService.getCommCnt(userNo);
		
		List<Map<Object, String>> boardComment = userService.getCommList(paging, userNo);
		
		logger.info("user: {}", boardComment);
		
		model.addAttribute("joindate", joindate);
		model.addAttribute("commCnt", totalComCnt);
		model.addAttribute("userNick", userNick);
		model.addAttribute("userfile", userFile);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("commentlist", boardComment);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping("/deleteImg")
	public ModelAndView deleteImg(int userfileNo, int userNo, HttpSession session, ModelAndView mav) {
		logger.info("{}",userfileNo);
		logger.info("{}",userNo);
		
		userService.deleteProfie(userfileNo);
		UserFile userFile = userService.getUserImg(userNo);
		
		logger.info("뭘까????????? {}", userFile);
		
		mav.addObject("userfile", userFile);
		mav.setViewName("/user/deleteImg");
		
		return mav;
	}

}
