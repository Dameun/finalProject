package com.zestworld.Table_DTO;

public class CheckList_DTO {
	private int check_id;
	private int task_id;
	private String contents;
	private int success_f;
	
	public int getCheck_id() {
		return check_id;
	}
	public void setCheck_id(int check_id) {
		this.check_id = check_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getSuccess_f() {
		return success_f;
	}
	public void setSuccess_f(int success_f) {
		this.success_f = success_f;
	}
	
	
}
