package com.zestworld.Table_DTO;

public class Alarm_DTO {
	private int alarm_id;
	private String alarmTitle;
	private int check_f;
	private int alarm_type;
	private String user_id;	//蹂대궦�궗�엺
	private String acceptUsers;	//諛쏅뒗�궗�엺
	private String img;
	
	
	public int getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(int alarm_id) {
		this.alarm_id = alarm_id;
	}
	
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAcceptUsers() {
		return acceptUsers;
	}
	public void setAcceptUsers(String acceptUsers) {
		this.acceptUsers = acceptUsers;
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

	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}
