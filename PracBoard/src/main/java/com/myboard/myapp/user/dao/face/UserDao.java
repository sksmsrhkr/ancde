package com.myboard.myapp.user.dao.face;

import com.myboard.myapp.dto.User;

public interface UserDao {

	public int isUser(User user);

	public User getUserInfo(User user);

}
