package com.myboard.myapp.dto;

public class CommentFile {
	
	private int boardNo;
	private int commentNo;
	private int comfileNo;
	private String comfileOrigin;
	private String comfileStored;
	
	public CommentFile() {}

	@Override
	public String toString() {
		return "CommentFile [boardNo=" + boardNo + ", commentNo=" + commentNo + ", comfileNo=" + comfileNo
				+ ", comfileOrigin=" + comfileOrigin + ", comfileStored=" + comfileStored + "]";
	}

	public CommentFile(int boardNo, int commentNo, int comfileNo, String comfileOrigin, String comfileStored) {
		super();
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.comfileNo = comfileNo;
		this.comfileOrigin = comfileOrigin;
		this.comfileStored = comfileStored;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getComfileNo() {
		return comfileNo;
	}

	public void setComfileNo(int comfileNo) {
		this.comfileNo = comfileNo;
	}

	public String getComfileOrigin() {
		return comfileOrigin;
	}

	public void setComfileOrigin(String comfileOrigin) {
		this.comfileOrigin = comfileOrigin;
	}

	public String getComfileStored() {
		return comfileStored;
	}

	public void setComfileStored(String comfileStored) {
		this.comfileStored = comfileStored;
	}

	
	
	
	
}
