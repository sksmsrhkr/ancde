package com.myboard.myapp.user.dao.face;

import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;

public interface UserDao {

	public int isUser(User user);

	public User getUserInfo(User user);

	public void insertUserFile(UserFile userFile);

	public UserFile getUserProfile(int userNo);

	public User getUser(int userNo);

	public void joinUser(User user);

	public void updateUser(User user);

	public void deleteUserFile(int userNo);

	public void deletePro(int userfileNo);

	public String getNick(int userNo);

}
