package com.myboard.myapp.Board.service.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

public interface BoardService {

	public Paging getTotalPage(int curPage);

	public List<Map<String, Object>> selectList(Paging paging);

	public List<Board> selectBoardList(Paging paging);

	public Board getBoard(int boardNo);

	public void updateRecommend(int userNo, Integer boardNo);

	public int isRecommendByNo(int userNo, Integer boardNo);

	public int getCntRecommend(Integer boardNo);

	public User getUserInfo(int userNo);

	public void insertBoard(Board board);





}
