package com.myboard.myapp.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.dto.User;
import com.myboard.myapp.user.dao.face.UserDao;
import com.myboard.myapp.user.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserDao userDao;

	@Override
	public Boolean login(User user) {
		
		int res = userDao.isUser(user);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User getUser(User user) {
		return userDao.getUserInfo(user);
	}
	
	
}
