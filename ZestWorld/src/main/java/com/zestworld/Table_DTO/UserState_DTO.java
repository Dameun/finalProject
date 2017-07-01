package com.zestworld.Table_DTO;

public class UserState_DTO {
	private String user_id="";
	private String user_name= "";
	private String state = ""; // 01업무 02외출 03회의 04식사
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}	
}
