package com.zestworld.AlarmService;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zestworld.Alarm_DAO.AlarmDAO;
import com.zestworld.Table_DTO.Alarm_DTO;
import com.zestworld.util.DataController;

/*
 * @FileName : AlarmService.java
 * @Project : ZestWorld
 * @Date : 2017.06.18
 * @Author : 장윤희
 * @Desc : 알람 Service 
 * */
@Service
public class AlarmService {

	@Autowired
	private SqlSession sqlsession;
	
	public int insert(Alarm_DTO alarm) throws ClassNotFoundException, SQLException{
		int result = 0;
		AlarmDAO dao = sqlsession.getMapper(AlarmDAO.class);
		result = dao.insert(alarm);
		return result;
	}
	
	public List<Alarm_DTO> GetList() throws ClassNotFoundException, SQLException{
		int result = 0;
		AlarmDAO dao = sqlsession.getMapper(AlarmDAO.class);
		String accept = DataController.getInstance().GetUser().getUser_id();
		List<Alarm_DTO> list = dao.getAlarmList(accept);
		return list;
	}
	
	public int updateAlarm(Alarm_DTO alarm) throws ClassNotFoundException, SQLException{
		int result = 0;
		AlarmDAO dao = sqlsession.getMapper(AlarmDAO.class);
		result = dao.UpdateAlarm(alarm);
		return result;
	}
}
