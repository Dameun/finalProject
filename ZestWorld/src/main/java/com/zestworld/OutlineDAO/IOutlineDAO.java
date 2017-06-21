package com.zestworld.OutlineDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

public interface IOutlineDAO {
	//전체 리스트
	public List<Task_DTO> basictasklist() throws ClassNotFoundException, SQLException;
	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException;
	public List<Task_DTO> tasklist_mytask(String user_id) throws ClassNotFoundException, SQLException;
	public List<Task_DTO> taskTest(Task_DTO dto) throws ClassNotFoundException, SQLException;
	public List<Project_DTO> projectlist() throws ClassNotFoundException, SQLException;
	public List<Workspace_DTO> writerlist(String workspace_id) throws ClassNotFoundException, SQLException;
	public int insertTask(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	public List<Category_DTO> categorylist(int project_id) throws ClassNotFoundException, SQLException;
/*	public List<Category_DTO> catetitlelist(int project_id) throws ClassNotFoundException, SQLException;*/
	public Task_DTO detailTask(String user_id) throws ClassNotFoundException, SQLException;
	public int updateFlag(String task_id) throws ClassNotFoundException, SQLException;
	public int detailUpdate(Task_DTO dto) throws ClassNotFoundException, SQLException;
	public int detailDelete(int task_id) throws ClassNotFoundException, SQLException;
	public int checkListReg(CheckList_DTO dto) throws ClassNotFoundException, SQLException;
	public List<CheckList_DTO> checkListView(int task_id) throws ClassNotFoundException, SQLException;

}
