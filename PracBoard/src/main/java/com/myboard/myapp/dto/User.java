package com.myboard.myapp.dto;

import java.util.Date;

public class User {
	
    private int userNo;
    private String userName;
    private String userId;
    private String userPw;
    private String userNick;
    private String userGender;
    private Date userBirth;
    private String userEmail;
    private int userPostcode; 
    private String userAddr1;
    private String userAddr2;
    private String userAddr3;
    private String userPhone;
    private Date userJoindate;
    
    public User() {}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPw=" + userPw
				+ ", userNick=" + userNick + ", userGender=" + userGender + ", userBirth=" + userBirth + ", userEmail="
				+ userEmail + ", userPostcode=" + userPostcode + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2
				+ ", userAddr3=" + userAddr3 + ", userPhone=" + userPhone + ", userJoindate=" + userJoindate + "]";
	}

	public User(int userNo, String userName, String userId, String userPw, String userNick, String userGender,
			Date userBirth, String userEmail, int userPostcode, String userAddr1, String userAddr2, String userAddr3,
			String userPhone, Date userJoindate) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userPostcode = userPostcode;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.userPhone = userPhone;
		this.userJoindate = userJoindate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserPostcode() {
		return userPostcode;
	}

	public void setUserPostcode(int userPostcode) {
		this.userPostcode = userPostcode;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Date getUserJoindate() {
		return userJoindate;
	}

	public void setUserJoindate(Date userJoindate) {
		this.userJoindate = userJoindate;
	}

	
    

}
