package com.myboard.myapp.mypage.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.mypage.service.face.MypageService;
import com.myboard.myapp.util.Paging;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageService mypageService;
	
	@RequestMapping("/myboardList")
	public  void mypage(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		User user = mypageService.getUserInfo(userNo);
		
		String userNick = user.getUserNick();
		
		Paging paging = mypageService.cntBoard(curPage, userNo);
		logger.info("{}", paging);
		
		int totalCount = paging.getTotalCount();
		int totalComCnt = mypageService.getCommCnt(userNo);
				
		List<Board> board = mypageService.getBoardList(paging, userNo);	
		
		logger.info("user: {}", board);
		UserFile userFile = mypageService.getUserImg(userNo);
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
		User user = mypageService.getUserInfo(userNo);
		logger.info("ggg{}", user);
		
		String userNick = user.getUserNick();
		Date joindate = user.getUserJoindate();
		UserFile userFile = mypageService.getUserImg(userNo);	
				
		Paging paging = mypageService.cntComment(curPage, userNo);
		logger.info("{}", paging);
		
		int totalCount = mypageService.getBoardCnt(userNo);
		int totalComCnt = mypageService.getCommCnt(userNo);
		
		List<Map<Object, String>> boardComment = mypageService.getCommList(paging, userNo);
		
		logger.info("user: {}", boardComment);
		
		model.addAttribute("joindate", joindate);
		model.addAttribute("commCnt", totalComCnt);
		model.addAttribute("userNick", userNick);
		model.addAttribute("userfile", userFile);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("commentlist", boardComment);
		model.addAttribute("paging", paging);
	}
	
}
