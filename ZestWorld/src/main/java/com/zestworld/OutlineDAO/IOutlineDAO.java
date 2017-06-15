package com.zestworld.OutlineDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Task_DTO;

public interface IOutlineDAO {
	//전체 리스트
	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException;
	public List<Task_DTO> tasklist_mytask(String userid) throws ClassNotFoundException, SQLException;
	public List<Task_DTO> taskTest(Task_DTO dto) throws ClassNotFoundException, SQLException;
}
