package com.myboard.myapp.dto;

import java.util.Date;

public class ReportComment {
	
	private int reportNo;
	private int userNo;
	private int boardNo;
	private int commentNo;
	private String reasonChoice;
	private char commentBlind;
	private int reportCnt;
	private Date reportDate; 
	
	public ReportComment() {}

	@Override
	public String toString() {
		return "ReportComment [reportNo=" + reportNo + ", userNo=" + userNo + ", boardNo=" + boardNo + ", commentNo="
				+ commentNo + ", reasonChoice=" + reasonChoice + ", commentBlind=" + commentBlind + ", reportCnt="
				+ reportCnt + ", reportDate=" + reportDate + "]";
	}

	public ReportComment(int reportNo, int userNo, int boardNo, int commentNo, String reasonChoice, char commentBlind,
			int reportCnt, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.reasonChoice = reasonChoice;
		this.commentBlind = commentBlind;
		this.reportCnt = reportCnt;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
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

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getReasonChoice() {
		return reasonChoice;
	}

	public void setReasonChoice(String reasonChoice) {
		this.reasonChoice = reasonChoice;
	}

	public char getCommentBlind() {
		return commentBlind;
	}

	public void setCommentBlind(char commentBlind) {
		this.commentBlind = commentBlind;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

}
