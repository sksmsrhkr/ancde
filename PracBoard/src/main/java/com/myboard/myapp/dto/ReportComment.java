package com.myboard.myapp.dto;

public class ReportComment {
	
	private int reportedNo;
	private int boardNo;
	private int commentNo;
	private String reasonChoice;
	
	public ReportComment() {}

	@Override
	public String toString() {
		return "ReportComment [reportedNo=" + reportedNo + ", boardNo=" + boardNo + ", commentNo=" + commentNo
				+ ", reasonChoice=" + reasonChoice + "]";
	}

	public ReportComment(int reportedNo, int boardNo, int commentNo, String reasonChoice) {
		super();
		this.reportedNo = reportedNo;
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.reasonChoice = reasonChoice;
	}

	public int getReportedNo() {
		return reportedNo;
	}

	public void setReportedNo(int reportedNo) {
		this.reportedNo = reportedNo;
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
	
	

}
