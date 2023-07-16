package com.myboard.myapp.mypage.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.util.Paging;

public interface MypageDao {
	
	public User getUser(int userNo);
	
	public int getCntBoard(int userNo);

	public List<Board> getBoardList(@Param("paging") Paging paging, @Param("userNo") int userNo);

	public UserFile getUserProfile(int userNo);

	public int getCommCnt(int userNo);

	public List<Map<Object, String>> getCommentList(@Param("paging") Paging paging, @Param("userNo") int userNo);

}
