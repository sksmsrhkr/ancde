package com.myboard.myapp.dto;

public class BoardRecommend {

	private int userNo;
	private int boardNo;
	
	public BoardRecommend() {}

	@Override
	public String toString() {
		return "BoardRecommed [userNo=" + userNo + ", boardNo=" + boardNo + "]";
	}

	public BoardRecommend(int userNo, int boardNo) {
		super();
		this.userNo = userNo;
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
}
