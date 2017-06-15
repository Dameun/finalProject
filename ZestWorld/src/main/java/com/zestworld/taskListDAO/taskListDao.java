package com.zestworld.taskListDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Task_DTO;

public interface taskListDao {

	//전체리스트
	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException;
	//나의 리스트
	public List<Task_DTO> mytasklist(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//리스트 삽입
	public List<Task_DTO> insertTitle() throws ClassNotFoundException, SQLException;
	//업무 삭제
	public void deleteTitle(String title) throws ClassNotFoundException, SQLException;

}
