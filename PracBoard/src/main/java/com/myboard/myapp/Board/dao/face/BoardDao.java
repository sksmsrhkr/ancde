package com.myboard.myapp.Board.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardRecommend;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

public interface BoardDao {

	public int getTotalPaging(int curPage);

	public List<Map<String, Object>> selectList(@Param("paging") Paging paging);

	public List<Board> selectBoardList(Paging paging);

	public Board getBoard(int boardNo);

	public int isRecommend(BoardRecommend boardRecommend);

	public void insertRecommend(BoardRecommend boardRecommend);

	public void deleteRecommend(BoardRecommend boardRecommend);

	public int getCntRecommend(Integer boardNo);

	public User getWriterInfo(int userNo);

	public void insertBoard(Board board);

	public void insertHit(int boardNo);


}
