package com.myboard.myapp.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.main.dao.face.MainDao;
import com.myboard.myapp.main.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	@Override
	public  List<Map<Object, String>> getPopularBoard() {
		return mainDao.getPopularBoardList();
	}
	@Override
	public List<Map<Object, String>> getNewBoard() {
		return mainDao.getNewBoardList();
	}

}
