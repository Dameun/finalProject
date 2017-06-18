package com.zestworld.Table_DTO;

public class Alarm_DTO {
	private String alarm_id;
	private String task_id;
	private String check_f;
	private String alarm_type;
	private String send;	//보낸사람
	private String accept;	//받는사람
	private String img;
	
	
	public String getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(String alarm_id) {
		this.alarm_id = alarm_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getCheck_f() {
		return check_f;
	}
	public void setCheck_f(String check_f) {
		this.check_f = check_f;
	}
	public String getAlarm_type() {
		return alarm_type;
	}
	public void setAlarm_type(String alarm_type) {
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
