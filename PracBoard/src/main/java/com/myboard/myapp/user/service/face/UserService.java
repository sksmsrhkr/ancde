package com.myboard.myapp.user.service.face;

import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;

public interface UserService {

	public Boolean login(User user);

	public User getUser(User user);

	public User getUserInfo(int userNo);

	public void insertProfile(User user, MultipartFile file);

	public UserFile getUserImg(int userNo);

	public void insertUser(User user);

	public void deleteProfie(int userfileNo);

	public String getUserNick(int userNo);

}
