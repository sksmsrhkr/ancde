package com.myboard.myapp.Board.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myboard.myapp.Board.service.face.BoardService;
import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardComment;
import com.myboard.myapp.dto.CommentFile;
import com.myboard.myapp.dto.ReportComment;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.user.service.face.UserService;
import com.myboard.myapp.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardService boardService;
	@Autowired UserService userService;
	
	@RequestMapping("/list")
	public void BoardList(@RequestParam(defaultValue = "0") int curPage, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword,
			Model model) {
		
		Paging paging = boardService.getTotalPage(curPage);
		
		logger.info("Paging: {}", paging);
		logger.info("굿긋 {}", paging.getTotalCount());
		
		List<Map<String, Object>> list = boardService.selectList(paging);

		logger.info("list: {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping("/view")
	public void boardview (int boardNo, Model model, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		Board board = boardService.getBoard(boardNo);
		
		//댓글
		List<Map<String, Object>> commentList = boardService.getComment(boardNo);
		int commentCnt = boardService.getCntComm(boardNo);
		
		//작성자 정보
		User user = boardService.getUserInfo(board.getUserNo());
		String writerNick = user.getUserNick();
		UserFile writerFile = userService.getUserImg(board.getUserNo());
		
		
		//좋아요
		int isRecommend = boardService.isRecommendByNo(userNo, boardNo);
		int cntRecommend = boardService.getCntRecommend(boardNo);
		
		//대댓글
		
		
		logger.info("board : {}", board);
		logger.info("commentList : {}", commentList);
		UserFile userFile = userService.getUserImg(userNo);
		
		model.addAttribute("writerfile", writerFile);
		model.addAttribute("userfile", userFile);
		model.addAttribute("board", board);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("writerNick", writerNick);
		model.addAttribute("isRecommend", isRecommend);
		model.addAttribute("cntRecommend", cntRecommend);
		model.addAttribute("commentList", commentList);
		model.addAttribute("cntComment", commentCnt);

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
	
	@RequestMapping("/comment")
	public ModelAndView boardcomment(BoardComment boardComment, MultipartFile file, Model model, ModelAndView mav, HttpSession session) {
//		logger.info("{}", boardComment);
//		logger.info("{}", boardNo);
		int userNo = (Integer) session.getAttribute("userNo");
		
		String chkY = boardComment.getChkLock();
		if(chkY.contains("y")) {
			
			boardComment.setChkLock("y");
		}
		
		logger.info("{}", boardComment);
		logger.info("{}", file.getOriginalFilename());
		logger.info("{}", file);
		
		boardService.insertComm(boardComment, file);
		int commentNo = boardComment.getCommentNo();
		CommentFile commentFile = boardService.getCommImg(commentNo);
		
		
		List<Map<String, Object>> commentList = boardService.getComment(boardComment.getBoardNo());
		int boardNo = boardComment.getBoardNo();
		Board board = boardService.getBoard(boardNo);
		
		mav.addObject("userNo", userNo);
		mav.addObject("board", board);
		mav.addObject("boardNo", boardNo);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;

	}
	
	@RequestMapping("/commDelete")
	public ModelAndView commentDelete(BoardComment boardComment, ModelAndView mav) {
		logger.info("{}", boardComment);
		int boardNo = boardComment.getBoardNo();
		logger.info("ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ{}",boardNo);
		
		int isParent = boardService.isParentNo(boardComment);
		logger.info("이게 뭐냐{}", isParent);
		
		
		if( isParent > 0 ) {
			boardService.upDeleteComm(boardComment);
			logger.info("대댓 달린 부모 댓글!!");
		} else if(isParent == 0) {
		boardService.deleteComm(boardComment);
			logger.info("부모 댓글!! 아님돠");
		}
		
		List<Map<String, Object>> commentList = boardService.getComment(boardComment.getBoardNo());
		Board board = boardService.getBoard(boardNo);
		
		mav.addObject("board", board);
		mav.addObject("boardNo", boardNo);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;
	}
	
	@RequestMapping("/commUpdate")
	public void commUpdate(BoardComment boardComment, Model model) {
		logger.info("{}", boardComment);
		model.addAttribute("boardComment", boardComment);
	}
	
//	@RequestMapping("/img")
//	public void chk(int commNo, Model model) {
//		CommentFile commentFile = boardService.getCommImg(commNo);
//		
//		logger.info("{}", commentFile);
//		model.addAttribute("img", commentFile);
//		
//	}
	
	@GetMapping("/commentList")
	public void commentList(int commentNo, int reportedNo, int boardNo, Model model, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("adf{}", commentNo);
		logger.info("adf{}", reportedNo);
		logger.info("adf{}", boardNo);
		
		model.addAttribute("commentNo", commentNo);
		model.addAttribute("reportedNo", reportedNo);
		model.addAttribute("boardNo", boardNo);
				
		
	}
	
	@PostMapping("/commentList")
	public String reportlist(ReportComment reportComment) {
		
		logger.info("adf{}", reportComment);
		
		return "redirect: ./list";
		
	}
	@RequestMapping("/updateComment")
	public ModelAndView updateComment(BoardComment boardComment, MultipartFile file, ModelAndView mav) {
		logger.info("ㅠㅠㅠㅠㅠ{}", boardComment);
		logger.info("ㅠㅠㅠㅠㅠ{}", file);
		
		if(file == null) {
			logger.info("null 인에ㅕ");
			boardService.updateCommCent(boardComment);
		} else {
			logger.info("뚱인데여");
			boardService.updateComment(boardComment, file);
		}
		
		
		CommentFile commentFile = boardService.getCommImg(boardComment.getCommentNo());
		List<Map<String, Object>> commentList = boardService.getComment(boardComment.getBoardNo());
		Board board = boardService.getBoard(boardComment.getBoardNo());
		
		mav.addObject("board", board);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;
		
		
	}
	
	@RequestMapping("/deleteImg")
	public void deleteImg(int commentNo, int boardNo, Model model) {
		logger.info("{}", commentNo);
		logger.info("{}", boardNo);
		
		
		boardService.deleteImgFile(commentNo);
		
		List<Map<String, Object>> commentList = boardService.getComment(boardNo);
		Board board = boardService.getBoard(boardNo);
		
		logger.info("뭘까여{}", commentList);
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		
	}
	
	@RequestMapping("/reply")
	public ModelAndView reply(BoardComment boardComment, MultipartFile file, ModelAndView mav) {
		logger.info("ㅠㅠㅠㅠㅠ{}", boardComment);
		
			boardService.insertReply(boardComment, file);
		
		
		List<Map<String, Object>> commentList = boardService.getComment(boardComment.getBoardNo());
		Board board = boardService.getBoard(boardComment.getBoardNo());
		
		mav.addObject("board", board);
		mav.addObject("commentList", commentList);
		mav.setViewName("/board/comment");
		
		return mav;
	}
	
	@GetMapping("updateBoard")
	public void boardUpdate(int boardNo, Model model) {
		logger.info("{}", boardNo);
		
		Board board = boardService.getBoard(boardNo);
		
		logger.info("{}", board);
		
		model.addAttribute("board", board);
	}
	
	@PostMapping("updateBoard")
	public String updateBoard(Board board){
		
		logger.info("{}", board);
		
		boardService.updateBoard(board);
		
		return "redirect: ./view?boardNo="+board.getBoardNo();
	}
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(int boardNo) {
		
		boardService.deleteBoard(boardNo);
		
		return "redirect: ./list";
	}
	
	@RequestMapping("/commentCnt")
	public void commCnt(int boardNo, Model model) {
		logger.info("{}",boardNo);
		int commentCnt = boardService.getCntComm(boardNo);
		model.addAttribute("cntComment", commentCnt);
	}
	
}	
