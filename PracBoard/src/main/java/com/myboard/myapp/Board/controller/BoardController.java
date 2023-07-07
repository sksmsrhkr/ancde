package com.myboard.myapp.Board.controller;

import java.io.IOException;
import java.io.Writer;
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

import com.myboard.myapp.Board.service.face.BoardService;
import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardService boardService;
	
	
	@RequestMapping("/list")
	public void BoardList(@RequestParam(defaultValue = "0") int curPage, Model model ) {
		
		Paging paging = boardService.getTotalPage(curPage);
		
		logger.info("Paging: {}", paging);
		logger.info("굿긋");
		
		List<Map<String, Object>> list = boardService.selectList(paging);
		
//		List<Board> boardList = boardService.selectBoardList(paging);
		
		logger.info("list: {}", list);
//		logger.info("list: {}", boardList);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping("/view")
	public void boardview (int boardNo, Model model, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		Board board = boardService.getBoard(boardNo);
		
		//작성자 정보
		User user = boardService.getUserInfo(board.getUserNo());
		String writerNick = user.getUserNick();
		
		
		//좋아요
		int isRecommend = boardService.isRecommendByNo(userNo, boardNo);
		int cntRecommend = boardService.getCntRecommend(boardNo);
		
		logger.info("board : {}", board);
		
		model.addAttribute("board", board);
		model.addAttribute("writerNick", writerNick);
		model.addAttribute("isRecommend", isRecommend);
		model.addAttribute("cntRecommend", cntRecommend);

	}
	
	@RequestMapping("/recommend")
	public void recommend(Integer boardNo, HttpSession session, Writer out, Model model ) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo: {}", userNo);
		logger.info("boardNo: {}", boardNo);
		
		boardService.updateRecommend(userNo, boardNo);
		int isRecommend = boardService.isRecommendByNo(userNo, boardNo);
		int cntRecommend = boardService.getCntRecommend(boardNo);
		
		int a = 50;
		model.addAttribute("a", a);
		
		logger.info("추천 {}" , isRecommend);
		logger.info("추천수 {}" , cntRecommend);
		
		if (isRecommend==1) {	//추천을 했을때 실행되는 코드
			try {
				//여기에 값을 두 개 넣을 수 있는 것을 알아보쟈아("{\"result\": false, \"recommend\": " + res + "}")
				out.write("{\"result\": true, \"isRecommend\": " + isRecommend + ", \"cntRecommend\": " + cntRecommend + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {	//추천을 취소했을때 실행되는 코드
			try {
				out.write("{\"result\":false, \"isRecommend\": " + isRecommend + ",  \"cntRecommend\":" + cntRecommend + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
	}
	
	@GetMapping("/write")
	public void writeView() {}
	
	@PostMapping("/write")
	public String write(Board board, HttpSession session ) {
		
		logger.info("{}", board);
		
		int userNo = (Integer)session.getAttribute("userNo");
		
		board.setUserNo(userNo);
		
		boardService.insertBoard(board);
		
		return "redirect:./list";
		
	}
	
	
	
}	
