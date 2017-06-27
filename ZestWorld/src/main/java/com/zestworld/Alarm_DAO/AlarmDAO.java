package com.zestworld.Alarm_DAO;

import java.sql.SQLException;
import java.util.List;
import com.zestworld.Table_DTO.Alarm_DTO;

/*
 * @FileName : AlarmDAO.java
 * @Project : ZestWorld
 * @Date : 2017.06.18
 * @Author : 장윤희
 * @Desc : 알람DAO
 * */
public interface AlarmDAO {
	
	//알람리스트 가져오기
	public List<Alarm_DTO> getAlarmList(String acceptUsers) throws ClassNotFoundException, SQLException;
		
	//알람 가져오기
	public Alarm_DTO getAlarm(String alarm_id) throws ClassNotFoundException, SQLException;
	
	//알람 삽입
	public int insert(Alarm_DTO alarm) throws ClassNotFoundException, SQLException;
	
	//알람 읽음처리
	public int UpdateAlarm(Alarm_DTO alarm)throws ClassNotFoundException, SQLException;
}
