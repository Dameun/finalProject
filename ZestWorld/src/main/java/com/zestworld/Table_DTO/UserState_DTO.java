package com.zestworld.Table_DTO;

public class UserState_DTO {
	private String user_id="";
	private int workspace_id;
	private String state = ""; // 01업무 02외출 03회의 04식사
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}	
}
