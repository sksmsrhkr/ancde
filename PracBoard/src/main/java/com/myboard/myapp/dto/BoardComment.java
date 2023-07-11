package com.myboard.myapp.dto;

import java.util.Date;

public class BoardComment {
	private int commentNo;
	private String commContent;
	private int boardNo;
	private int userNo;
	private String chkLock;
	private Date commDate;
	private int step;
	private int parentNo;
	private int replyNo;
	private String replyNick;
	
	public BoardComment() {}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", commContent=" + commContent + ", boardNo=" + boardNo
				+ ", userNo=" + userNo + ", chkLock=" + chkLock + ", commDate=" + commDate + ", step=" + step
				+ ", parentNo=" + parentNo + ", replyNo=" + replyNo + ", replyNick=" + replyNick + "]";
	}

	public BoardComment(int commentNo, String commContent, int boardNo, int userNo, String chkLock, Date commDate,
			int step, int parentNo, int replyNo, String replyNick) {
		super();
		this.commentNo = commentNo;
		this.commContent = commContent;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.chkLock = chkLock;
		this.commDate = commDate;
		this.step = step;
		this.parentNo = parentNo;
		this.replyNo = replyNo;
		this.replyNick = replyNick;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getChkLock() {
		return chkLock;
	}

	public void setChkLock(String chkLock) {
		this.chkLock = chkLock;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyNick() {
		return replyNick;
	}

	public void setReplyNick(String replyNick) {
		this.replyNick = replyNick;
	}

	

	

	
	
	
	
}
