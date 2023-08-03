package com.myboard.myapp.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.admin.dao.face.AdminDao;
import com.myboard.myapp.admin.service.face.AdminService;
import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

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

	@Override
	public Paging getCntRegulate(int curPage, String filter, String keyword) {

		int totalCount = adminDao.getCntReport(filter, keyword);
		
		logger.info("{}", totalCount);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Map<Object, String>> getRegulateList(Paging paging, String filter, String keyword) {
		return adminDao.getRegulateList(paging, filter , keyword);
	}

	@Override
	public void regulateComment(int commentNo) {
		adminDao.regulateComm(commentNo);
	}

	@Override
	public void deleteRegulate(int commentNo) {
		adminDao.deleteReguComm(commentNo);
	}

	@Override
	public Paging getInquiryCnt(int curPage, String filter) {
		
		int totalCount = adminDao.getQnaCnt(filter);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Inquiry> getQnAList(Paging paging, String filter) {
		return adminDao.getQnaList(paging, filter);
	}
	@Override
	public int getAdminNo() {
		return adminDao.getAdminNo();
	}
	
	@Override
	public Paging getCntReBoard(int curPage, String filter, String keyword) {
		
		int totalCount = adminDao.getReboardCnt(filter, keyword);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Map<Object, String>> getRegulateBoardList(Paging paging, String filter, String keyword) {
		return adminDao.getReBoardList(paging, filter, keyword);
	}

	@Override
	public Paging getUserCnt(int curPage, String filter, String searchType, String keyword) {

		int totalCount = adminDao.getUserTotalCnt(filter, searchType, keyword);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<User> getUserList(Paging paging, String filter, String searchType, String keyword) {
		return adminDao.getUserList(paging, filter, searchType, keyword);
	}
	
	@Override
	public void updateUser(User user) {
		adminDao.updateUserInfo(user);
	}
}
