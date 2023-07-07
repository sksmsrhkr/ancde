package com.myboard.myapp.dto;

import java.util.Date;

public class Board {
	
	private int boardNo;
	private String title;
	private String content;
	private int hit;
	private Date writeDate;
	private int userNo;
	private int prevNo;
	private String prevTitle;
	private int nextNo;
	private String nextTitle;
	
	public Board() {}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", hit=" + hit
				+ ", writeDate=" + writeDate + ", userNo=" + userNo + ", prevNo=" + prevNo + ", prevTitle=" + prevTitle
				+ ", nextNo=" + nextNo + ", nextTitle=" + nextTitle + "]";
	}

	public Board(int boardNo, String title, String content, int hit, Date writeDate, int userNo, int prevNo,
			String prevTitle, int nextNo, String nextTitle) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.writeDate = writeDate;
		this.userNo = userNo;
		this.prevNo = prevNo;
		this.prevTitle = prevTitle;
		this.nextNo = nextNo;
		this.nextTitle = nextTitle;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPrevNo() {
		return prevNo;
	}

	public void setPrevNo(int prevNo) {
		this.prevNo = prevNo;
	}

	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public int getNextNo() {
		return nextNo;
	}

	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	
	
	
	
	
	

	
	
	

}
