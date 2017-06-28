package com.zestworld.fullcalendarDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;


public interface CalendarDAO {

		public int scheduleInsert(Task_DTO dto);
		public void scheduleDelete(Task_DTO dto);
		public List<Task_DTO> scheduleList(Task_DTO dto) throws ClassNotFoundException, SQLException;
		
}
