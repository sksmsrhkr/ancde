package com.myboard.myapp.admin.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.myboard.myapp.Board.service.face.BoardService;
import com.myboard.myapp.admin.service.face.AdminService;
import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	@Autowired BoardService boardService;
	
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
			int adminNo = adminService.getAdminNo();
			session.setAttribute("adminNo", adminNo);
			
			return "redirect: ./main";
		
		} else {
			return "redirect: /admin/login";
		}	
	}
	
	
	
	@RequestMapping("/main")
	public void managePage() {
		
	}
	
	@RequestMapping("/regulateComm")
	public void regulateComment(@RequestParam(defaultValue = "0") int curPage, Model model
				, @RequestParam(defaultValue = "date") String filter
				, @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
		
		logger.info("filter : {}", filter);
		logger.info("keyword : {}", keyword);
		
		Paging paging = adminService.getCntRegulate(curPage, filter, keyword);
		
		List<Map<Object, String>> regulateList = adminService.getRegulateList(paging, filter, keyword);
		
		logger.info("{}", paging);
		logger.info("{}", regulateList);
		
		model.addAttribute("paging", paging);
		model.addAttribute("filter", filter);
		model.addAttribute("keyword", keyword);
		model.addAttribute("regulateList", regulateList);
		
	}
	
	@RequestMapping("/regulate")
	public ModelAndView regulate(int commentNo, int boardNo, ModelAndView mav) {
		logger.info("댓번호 : {}", commentNo);
		adminService.regulateComment(commentNo);
		
		List<Map<String, Object>> commentList = boardService.getComment(boardNo);
		logger.info("고고{}", commentList);
		
		Board board = boardService.getBoard(boardNo);
		
		mav.addObject("board", board);
		mav.addObject("boardNo", boardNo);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;
	}
	
	
	@RequestMapping("/delRegulate")
	public ModelAndView delRegulate(int commentNo, int boardNo, ModelAndView mav) {
		logger.info("댓번호 : {}", commentNo);
		adminService.deleteRegulate(commentNo);
		
		List<Map<String, Object>> commentList = boardService.getComment(boardNo);
		logger.info("고고{}", commentList);
		
		Board board = boardService.getBoard(boardNo);
		
		mav.addObject("board", board);
		mav.addObject("boardNo", boardNo);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;
	}
	
	@RequestMapping("/serviceCenter")
	public void serviceCenter(Model model, @RequestParam(defaultValue = "0") int curPage, 
			@RequestParam(defaultValue = "a") String filter) {
		
		Paging paging = adminService.getInquiryCnt(curPage, filter);
		
		List<Inquiry> qnalist = adminService.getQnAList(paging, filter);
		
		logger.info("{}", qnalist);
		
		model.addAttribute("filter", filter);
		model.addAttribute("paging", paging);
		model.addAttribute("qnalist", qnalist);
		
	}
	
	@RequestMapping("/regulateBoard")
	public void regulateBoard(@RequestParam(defaultValue = "0") int curPage, Model model
				, @RequestParam(defaultValue = "date") String filter
				, @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
		
		logger.info("filter : {}", filter);
		logger.info("keyword : {}", keyword);
		
		Paging paging = adminService.getCntReBoard(curPage, filter, keyword);
		
		List<Map<Object, String>> reBoardList = adminService.getRegulateBoardList(paging, filter, keyword);
		
		logger.info("{}", paging);
		logger.info("{}", reBoardList);
		
		model.addAttribute("paging", paging);
		model.addAttribute("filter", filter);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reBoardList", reBoardList);
		
	}
	
}
