package com.zestworld.taskListDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;

public interface taskListDao {

	//카테고리 리스트
	public List<Category_DTO> tasklist(Category_DTO dto) throws ClassNotFoundException, SQLException;
	
	//전체리스트
	public List<Task_DTO> tasklist2() throws ClassNotFoundException, SQLException;
	
	//나의 리스트
	public List<Task_DTO> mytasklist(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	//카테고리 타이틀 삽입
	public void titleInsert(Category_DTO dto) throws ClassNotFoundException, SQLException;
	
	//업무 타이틀 삽입
	public void tasktitleInsert(Task_DTO dto);
	
	//업무 title 삭제
	public void tasktitleDelete(int num);
	
	//카테고리 title 삭제
	public void catetitleDelete(Category_DTO dto) throws ClassNotFoundException, SQLException;

	//프로젝트 ID
	 public int getProject_Id(Project_DTO dto);	

	//카테고리 ID
	public int getCategory_Id(Category_DTO dto); 
	//USER ID
	public String getUser_Id();	
}
