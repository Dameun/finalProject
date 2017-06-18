package com.zestworld.Alarm_DAO;

import java.sql.SQLException;
import java.util.Map;

import com.zestworld.Table_DTO.Alarm_DTO;

public interface AlarmDAO {
	
	//알람리스트 가져오기
	public Alarm_DTO getAlarmList(String userid) throws ClassNotFoundException, SQLException;
		
	//알람 가져오기
	public Alarm_DTO getAlarm(String alarmid) throws ClassNotFoundException, SQLException;
	
	//알람 삽입
	public int insert(Alarm_DTO alarm) throws ClassNotFoundException, SQLException;
	
}
