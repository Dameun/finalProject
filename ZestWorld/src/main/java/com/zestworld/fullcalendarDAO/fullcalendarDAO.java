package com.zestworld.fullcalendarDAO;

import java.sql.SQLException;

import com.zestworld.Table_DTO.Project_DTO;


public interface fullcalendarDAO {

	//일정등록(schedule + work + work_users) 등록
		public int insertSchedule(Project_DTO swdto) throws ClassNotFoundException, SQLException;
		public int insertWork(Project_DTO swdto) throws ClassNotFoundException, SQLException;
		public Project_DTO selectScheduleno() throws ClassNotFoundException, SQLException;
		//public int insertWork_Users(Project_user wudto) throws ClassNotFoundException, SQLException;
}
