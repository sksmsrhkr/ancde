package com.myboard.myapp.main.service.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Board;

public interface MainService {

	public List<Map<Object, String>> getPopularBoard();

	public List<Map<Object, String>> getNewBoard();

}
