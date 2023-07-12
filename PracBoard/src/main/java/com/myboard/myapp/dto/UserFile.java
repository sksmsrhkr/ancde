package com.myboard.myapp.dto;

public class UserFile {
	
	private int userNo;
	private int userfileNo;
	private String userfileStored;
	
	public UserFile() {}

	@Override
	public String toString() {
		return "UserFile [userNo=" + userNo + ", userfileNo=" + userfileNo + ", userfileStored=" + userfileStored + "]";
	}

	public UserFile(int userNo, int userfileNo, String userfileStored) {
		super();
		this.userNo = userNo;
		this.userfileNo = userfileNo;
		this.userfileStored = userfileStored;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserfileNo() {
		return userfileNo;
	}

	public void setUserfileNo(int userfileNo) {
		this.userfileNo = userfileNo;
	}

	public String getUserfileStored() {
		return userfileStored;
	}

	public void setUserfileStored(String userfileStored) {
		this.userfileStored = userfileStored;
	}
	
	
}
