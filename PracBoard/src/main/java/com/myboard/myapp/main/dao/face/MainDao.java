package com.myboard.myapp.main.dao.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Board;

public interface MainDao {

	public List<Map<Object, String>> getPopularBoardList();

	public List<Map<Object, String>> getNewBoardList();

}
