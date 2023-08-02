package com.myboard.myapp.dto;

import java.util.Date;

public class ReportBoard {
	
	private int reportBno;
	private int userNo;
	private int boardNo;
	private char reasonChoice;
	private char boardBlind;
	private int reportCnt;
	private Date reportDate;

	public ReportBoard() {}

	@Override
	public String toString() {
		return "ReportBoard [reportBno=" + reportBno + ", userNo=" + userNo + ", boardNo=" + boardNo + ", reasonChoice="
				+ reasonChoice + ", boardBlind=" + boardBlind + ", reportCnt=" + reportCnt + ", reportDate="
				+ reportDate + "]";
	}

	public ReportBoard(int reportBno, int userNo, int boardNo, char reasonChoice, char boardBlind, int reportCnt,
			Date reportDate) {
		super();
		this.reportBno = reportBno;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.reasonChoice = reasonChoice;
		this.boardBlind = boardBlind;
		this.reportCnt = reportCnt;
		this.reportDate = reportDate;
	}

	public int getReportBno() {
		return reportBno;
	}

	public void setReportBno(int reportBno) {
		this.reportBno = reportBno;
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

	public char getReasonChoice() {
		return reasonChoice;
	}

	public void setReasonChoice(char reasonChoice) {
		this.reasonChoice = reasonChoice;
	}

	public char getBoardBlind() {
		return boardBlind;
	}

	public void setBoardBlind(char boardBlind) {
		this.boardBlind = boardBlind;
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
