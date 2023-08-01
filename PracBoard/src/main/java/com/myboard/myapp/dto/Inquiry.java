package com.myboard.myapp.dto;

import java.util.Date;

public class Inquiry {
	
	private int inquiryNo;
	private int userNo;
	private char inquiryType;
	private String inquiryTitle;
	private String inquiryContent;
	private String answerState;
	private String answerContent;
	private Date inquiryDate;

	public Inquiry() {}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", userNo=" + userNo + ", inquiryType=" + inquiryType
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent + ", answerState="
				+ answerState + ", answerContent=" + answerContent + ", inquiryDate=" + inquiryDate + "]";
	}

	public Inquiry(int inquiryNo, int userNo, char inquiryType, String inquiryTitle, String inquiryContent,
			String answerState, String answerContent, Date inquiryDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.userNo = userNo;
		this.inquiryType = inquiryType;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.answerState = answerState;
		this.answerContent = answerContent;
		this.inquiryDate = inquiryDate;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public char getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(char inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getAnswerState() {
		return answerState;
	}

	public void setAnswerState(String answerState) {
		this.answerState = answerState;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	
	
	
	
	

}
