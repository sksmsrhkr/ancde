package com.myboard.myapp.user.service.face;

import com.myboard.myapp.dto.User;

public interface UserService {

	public Boolean login(User user);

	public User getUser(User user);

}
