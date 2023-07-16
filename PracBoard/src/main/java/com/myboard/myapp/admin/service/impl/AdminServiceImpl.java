package com.myboard.myapp.admin.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.admin.dao.face.AdminDao;
import com.myboard.myapp.admin.service.face.AdminService;
import com.myboard.myapp.dto.Admin;

@Service
public class AdminServiceImpl implements AdminService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDao adminDao;

	@Override
	public boolean getLogin(Admin admin) {
		 
		int isAdmin = adminDao.cntAdminByIdPw(admin);
		
		logger.info("관리자 맞는지: {}", isAdmin);
		
		if(isAdmin > 0) {
			logger.info("관리자 입니다");
			return true;
		} else {
			logger.info("관리자 아닙니다");
			return false;
		}
	}
}
