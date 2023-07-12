package com.myboard.myapp.Board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myboard.myapp.Board.dao.face.BoardDao;
import com.myboard.myapp.Board.service.face.BoardService;
import com.myboard.myapp.dto.Board;
import com.myboard.myapp.dto.BoardComment;
import com.myboard.myapp.dto.BoardRecommend;
import com.myboard.myapp.dto.CommentFile;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

@Service
public class BoardServiceImpl implements BoardService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ServletContext context;
	@Autowired BoardDao boardDao;
	
	@Override
	public Paging getTotalPage(int curPage) {
		
		int totalCount =  boardDao.getTotalPaging(curPage);
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> selectList(Paging paging) {
		logger.info("{}", paging);
		
		List list = boardDao.selectList(paging);
		
		logger.info("{}", list);
		
		return list;
	}

	@Override
	public List<Board> selectBoardList(Paging paging) {
		logger.info("{}", paging);
		return boardDao.selectBoardList(paging);
	}
	
	@Override
	public Board getBoard(int boardNo) {
		boardDao.insertHit(boardNo);
		return boardDao.getBoard(boardNo);
	}

	@Override
	public int isRecommendByNo(int userNo, Integer boardNo) {
		
		BoardRecommend boardRecommend = new BoardRecommend(userNo, boardNo);
		
			return boardDao.isRecommend(boardRecommend);
	}
	
	@Override
	public void updateRecommend(int userNo, Integer boardNo) {

		BoardRecommend boardRecommend = new BoardRecommend(userNo, boardNo);
		
		if(boardDao.isRecommend(boardRecommend) == 0) {
			boardDao.insertRecommend(boardRecommend);
			logger.info("삽입");
		} else if( boardDao.isRecommend(boardRecommend) == 1) {
			boardDao.deleteRecommend(boardRecommend);
			logger.info("취소");
		}
	}
	
	@Override
	public int getCntRecommend(Integer boardNo) {
		return boardDao.getCntRecommend(boardNo);
	}
	
	@Override
	public User getUserInfo(int userNo) {
		return boardDao.getWriterInfo(userNo);
	}
	
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}
	
	@Override
	public void insertComm(BoardComment boardComment, MultipartFile file) {
		
		boardDao.insertComment(boardComment);
		logger.info("댓번 : {}", boardComment.getCommentNo());
		
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
		
		CommentFile commentFile = new CommentFile();
		
		commentFile.setComfileOrigin(file.getOriginalFilename());
		commentFile.setComfileStored(storedName);
		commentFile.setCommentNo(boardComment.getCommentNo());
		commentFile.setBoardNo(boardComment.getBoardNo());
		
		boardDao.insertCommFile(commentFile);
		
	}
	
	@Override
	public List<Map<String, Object>> getComment(int boardNo) {
		return boardDao.getCommentList(boardNo);
	}
	
	@Override
	public int getCntComm(int boardNo) {
		return boardDao.getCntComment(boardNo);
	}
	
	@Override
	public void deleteComm(BoardComment boardComment) {
		boardDao.deleteComment(boardComment);
	}
	
	@Override
	public CommentFile getCommImg(int commentNo) {
		return boardDao.getCommImg(commentNo);
	}
	
	@Override
	public void updateComment(BoardComment boardComment, MultipartFile file) {
		boardDao.deleteCommFile(boardComment);
		boardDao.updateCommContent(boardComment);
		
		logger.info("여기 왜 왓어 파이랑 {}", file);
		logger.info("여기 왜 왓어 파이랑 {}", file.getSize());
		logger.info("여기 왜 왓어 파이랑 {}", file.getOriginalFilename());
		
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
		
		CommentFile commentFile = new CommentFile();
		
		commentFile.setComfileOrigin(file.getOriginalFilename());
		commentFile.setComfileStored(storedName);
		commentFile.setCommentNo(boardComment.getCommentNo());
		commentFile.setBoardNo(boardComment.getBoardNo());
		
		boardDao.insertCommFile(commentFile);
	}

	@Override
	public void updateCommCent(BoardComment boardComment) {
		boardDao.updateCommContent(boardComment);
	}
	
	@Override
	public void deleteImgFile(int commentNo) {
		boardDao.deleteImgFile(commentNo);
	}
	
	@Override
	public void insertReply(BoardComment boardComment, MultipartFile file) {
		
		boardDao.insertReply(boardComment);
		
		logger.info("댓번 : {}", boardComment.getCommentNo());
		
		if (  file == null || file.getSize() <= 0 ){
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
		
		CommentFile commentFile = new CommentFile();
		
		commentFile.setComfileOrigin(file.getOriginalFilename());
		commentFile.setComfileStored(storedName);
		commentFile.setCommentNo(boardComment.getCommentNo());
		commentFile.setBoardNo(boardComment.getBoardNo());
		
		boardDao.insertCommFile(commentFile);
		
	}

	@Override
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}
	
	@Override
	public void deleteBoard(int boardNo) {
		boardDao.deleteBoard(boardNo);
	}
	
}
