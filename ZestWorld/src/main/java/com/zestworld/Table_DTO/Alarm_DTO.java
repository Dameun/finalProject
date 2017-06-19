package com.zestworld.Table_DTO;

public class Alarm_DTO {
	private String alarm_id;
	private String alarmTitle;
	private String check_f;
	private String alarm_type;
	private String sendUser;	//蹂대궦�궗�엺
	private String acceptUsers;	//諛쏅뒗�궗�엺
	private String img;
	
	
	public String getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(String alarm_id) {
		this.alarm_id = alarm_id;
	}
	
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getAcceptUsers() {
		return acceptUsers;
	}
	public void setAcceptUsers(String acceptUsers) {
		this.acceptUsers = acceptUsers;
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

	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}
