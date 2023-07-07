package com.myboard.myapp.Board.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.Board.dao.face.BoardDao;
import com.myboard.myapp.Board.service.face.BoardService;
import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardRecommend;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

@Service
public class BoardServiceImpl implements BoardService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardDao boardDao;
	
	@Override
	public Paging getTotalPage(int curPage) {
		
		int totalPage =  boardDao.getTotalPaging(curPage);
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectList(Paging paging) {
		logger.info("{}", paging);
		
		List list = boardDao.selectList(paging);
		
		logger.info("{}", list);
		
		return list;
	}

	@Override
	public List<Board> selectBoardList(Paging paging) {
		logger.info("{}", paging);
		return boardDao.selectBoardList(paging);
	}
	
	@Override
	public Board getBoard(int boardNo) {
		boardDao.insertHit(boardNo);
		return boardDao.getBoard(boardNo);
	}

	@Override
	public int isRecommendByNo(int userNo, Integer boardNo) {
		
		BoardRecommend boardRecommend = new BoardRecommend(userNo, boardNo);
		
			return boardDao.isRecommend(boardRecommend);
	}
	
	@Override
	public void updateRecommend(int userNo, Integer boardNo) {

		BoardRecommend boardRecommend = new BoardRecommend(userNo, boardNo);
		
		if(boardDao.isRecommend(boardRecommend) == 0) {
			boardDao.insertRecommend(boardRecommend);
			logger.info("삽입");
		} else if( boardDao.isRecommend(boardRecommend) == 1) {
			boardDao.deleteRecommend(boardRecommend);
			logger.info("취소");
		}
	}
	
	@Override
	public int getCntRecommend(Integer boardNo) {
		return boardDao.getCntRecommend(boardNo);
	}
	
	@Override
	public User getUserInfo(int userNo) {
		return boardDao.getWriterInfo(userNo);
	}
	
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}

}
