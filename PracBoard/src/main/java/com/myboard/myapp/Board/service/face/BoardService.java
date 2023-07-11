package com.myboard.myapp.Board.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardComment;
import com.myboard.myapp.dto.CommentFile;
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

	public void insertComm(BoardComment boardComment, MultipartFile file);

	public List<Map<String, Object>> getComment(int boardNo);

	public int getCntComm(int boardNo);

	public void deleteComm(BoardComment boardComment);

	public CommentFile getCommImg(int commentNo);

	public void updateComment(BoardComment boardComment, MultipartFile file);

	public void updateCommCent(BoardComment boardComment);

	public void deleteImgFile(int commentNo);

	public void insertReply(BoardComment boardComment, MultipartFile file);

	public void updateBoard(Board board);

	public void deleteBoard(int boardNo);

	









}
