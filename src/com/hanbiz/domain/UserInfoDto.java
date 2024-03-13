package com.hanbiz.domain;

public class UserInfoDto {
	private String userId = "";
	private String userName = "";
	private String userPhone = "";
	private String userEmail = "";
	private String brffcId = ""; //지역코드
	private String brffcName = ""; //지역명
	private String errCnt = ""; //로그인 시도 횟수


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

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getBrffcId() {
		return brffcId;
	}

	public void setBrffcId(String brffcId) {
		this.brffcId = brffcId;
	}


	public String getBrffcName() {
		return brffcName;
	}

	public void setBrffcName(String brffcName) {
		this.brffcName = brffcName;
	}

	public String getErrCnt() {
		return errCnt;
	}

	public void setErrCnt(String errCnt) {
		this.errCnt = errCnt;
	}
	
	
}
