package com.myboard.myapp.user.dao.face;

import java.util.List;

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

}
