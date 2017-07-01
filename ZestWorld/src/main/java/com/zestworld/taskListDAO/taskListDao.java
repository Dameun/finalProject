package com.zestworld.taskListDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
/*
 * @FileName : taskListDao.java
 * @Project : ZestWorld
 * @Date : 2017.07.01
 * @Author : 김민성
 * @Desc : 업무 DAO
 * */
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
	
	//업무 title 성공여부 체크
	public int taskTitle_Check(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	//Category title 수정
	public void categoryUpdate(Category_DTO dto) throws ClassNotFoundException, SQLException;
	
	//상세업무 모달
	public Task_DTO detailtaskView(String user_id) throws ClassNotFoundException, SQLException;
	
	//체크리스트 삭제
	public int chkListDelete(int check_id) throws ClassNotFoundException, SQLException;
	
	//수정할 category 정보가져오기
	public Category_DTO getCatetitle(Category_DTO dto) throws ClassNotFoundException, SQLException;
	
		
}
