package com.myboard.myapp.user.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.util.Paging;

public interface UserService {

	public Boolean login(User user);

	public User getUser(User user);

	public User getUserInfo(int userNo);

	public Paging cntBoard(int curPage, int userNo);

	public List<Board> getBoardList(Paging paging, int userNo);

	public void insertProfile(int userNo, MultipartFile file);

	public UserFile getUserImg(int userNo);

}
