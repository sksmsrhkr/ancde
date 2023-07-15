package com.myboard.myapp.user.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.util.Paging;

public interface UserDao {

	public int isUser(User user);

	public User getUserInfo(User user);

	public int getCntBoard(int userNo);

	public List<Board> getBoardList(@Param("paging") Paging paging, @Param("userNo") int userNo);

	public void insertUserFile(UserFile userFile);

	public UserFile getUserProfile(int userNo);

	public User getUser(int userNo);

	public void joinUser(User user);

	public void updateUser(User user);

	public void deleteUserFile(int userNo);

	public int getCommCnt(int userNo);

	public int getCommentCnt(int userNo);

	public List<Map<Object, String>> getCommentList(@Param("paging") Paging paging, @Param("userNo") int userNo);

	public void deletePro(int userfileNo);

}
