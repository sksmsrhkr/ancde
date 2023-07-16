package com.myboard.myapp.mypage.service.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.util.Paging;

public interface MypageService {

	public User getUserInfo(int userNo);
	
	public Paging cntBoard(int curPage, int userNo);
	
	public int getCommCnt(int userNo);
	
	public List<Board> getBoardList(Paging paging, int userNo);
	
	public UserFile getUserImg(int userNo);
	
	public Paging cntComment(int curPage, int userNo);

	public List<Map<Object, String>> getCommList(Paging paging, int userNo);

	public int getBoardCnt(int userNo);
}
