package com.zestworld.Table_DTO;

public class Alarm_DTO {
	private int alarm_id;
	private int task_id;
	private int check_f;
	private int alarm_type;
	private String send;
	private String accept;
	private String img;
	
	
	public int getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(int alarm_id) {
		this.alarm_id = alarm_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getCheck_f() {
		return check_f;
	}
	public void setCheck_f(int check_f) {
		this.check_f = check_f;
	}
	public int getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(int alarm_type) {
		this.alarm_type = alarm_type;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
