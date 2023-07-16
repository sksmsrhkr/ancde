package com.myboard.myapp.mypage.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.mypage.dao.face.MypageDao;
import com.myboard.myapp.mypage.service.face.MypageService;
import com.myboard.myapp.util.Paging;

@Service
public class MymaygeServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageDao mypageDao;
	
	@Override
	public User getUserInfo(int userNo) {
		return mypageDao.getUser(userNo);
	}
	
	@Override
	public Paging cntBoard(int curPage, int userNo) {

		int totalCount = mypageDao.getCntBoard(userNo);
		
		logger.info("왜 안돼!!!!!!!!!!{}", totalCount);
		
		Paging paging = new Paging(totalCount,curPage);
		
		return paging;
	}
	
	@Override
	public List<Board> getBoardList(Paging paging, int userNo) {
		return mypageDao.getBoardList(paging, userNo);
	}
	
	@Override
	public UserFile getUserImg(int userNo) {
		return mypageDao.getUserProfile(userNo);
	}

	@Override
	public int getCommCnt(int userNo) {
		return mypageDao.getCommCnt(userNo);
	}
	
	@Override
	public Paging cntComment(int curPage, int userNo) {

		int totalCount = mypageDao.getCommCnt(userNo);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Map<Object, String>> getCommList(Paging paging, int userNo) {

		return mypageDao.getCommentList(paging, userNo);
	}
	
	@Override
	public int getBoardCnt(int userNo) {
		return  mypageDao.getCntBoard(userNo);
	}
	
	

}
