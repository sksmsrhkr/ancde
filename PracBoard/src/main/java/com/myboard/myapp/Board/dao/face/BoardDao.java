package com.myboard.myapp.Board.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardComment;
import com.myboard.myapp.dto.BoardRecommend;
import com.myboard.myapp.dto.CommentFile;
import com.myboard.myapp.dto.ReportComment;
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

	public void insertComment(BoardComment boardComment);

	public List<Map<String, Object>> getCommentList(int boardNo);

	public int getCntComment(int boardNo);

	public void deleteComment(BoardComment boardComment);

	public void insertCommFile(CommentFile commentFile);

	public CommentFile getCommImg(int commentNo);

	public void updateCommContent(BoardComment boardComment);

	public void deleteCommFile(BoardComment boardComment);

	public void deleteImgFile(int commentNo);

	public void insertReply(BoardComment boardComment);

	public void updateBoard(Board board);

	public void deleteBoard(int boardNo);

	public int isParent(BoardComment boardComment);

	public void upDeleteComment(BoardComment boardComment);

	public void insertReportComm(ReportComment reportComment);

	public int getCntReport(int commentNo);

	public void updateReguComm(int commentNo);

	public int getReportByUserNo(@Param("userNo") int userNo, @Param("commentNo") int commentNo);

	public int getRelCnt(int commentNo);

	public void updateRelCnt(ReportComment reportComment);

	


}
