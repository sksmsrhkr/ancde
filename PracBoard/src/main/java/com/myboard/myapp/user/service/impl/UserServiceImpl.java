package com.myboard.myapp.user.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.User;
import com.myboard.myapp.dto.UserFile;
import com.myboard.myapp.user.dao.face.UserDao;
import com.myboard.myapp.user.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ServletContext context;
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

	@Override
	public User getUserInfo(int userNo) {
		return userDao.getUser(userNo);
	}

	@Override
	public void insertProfile(User user, MultipartFile file) {
		
		userDao.updateUser(user);
		
		if( file.getSize() <= 0 ) {
			logger.info("파일의 크기가 0이다, 처리 중단!");
			
			//filesave()메소드 중단
			return;
		}
		
		//파일이 저장될 경로 - RealPath
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		File dest = null;
		String storedName = null;
		
		do {
			//저장할 파일 이름 생성하기
			storedName = file.getOriginalFilename(); //원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; //UUID추가
			logger.info("storedName : {}", storedName);
			
			
			//실제 저장될 파일 객체
			dest = new File(storedFolder, storedName);
		
		} while( dest.exists() );
		
		
		try {
			
			//업로드된 파일을 upload폴더에 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int userNo = user.getUserNo();
		userDao.deleteUserFile(userNo);
		
		UserFile userFile = new UserFile();
		
		userFile.setUserfileStored(storedName);
		userFile.setUserNo(user.getUserNo());
				
		userDao.insertUserFile(userFile);
		
	}
	
	@Override
	public UserFile getUserImg(int userNo) {
		return userDao.getUserProfile(userNo);
	}
	
	@Override
	public void insertUser(User user) {
		userDao.joinUser(user);
	}

	@Override
	public void deleteProfie(int userfileNo) {
		userDao.deletePro(userfileNo);
	}

	@Override
	public String getUserNick(int userNo) {
		return userDao.getNick(userNo);
	}
}
