package com.zestworld.AnalysisDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;

public interface AnalysisDAO {
	
	//전체업무 - 모든업무갯수
	public int getTaskAll() throws ClassNotFoundException, SQLException;
	//전체업무 - 완료된 업무''
	public int getTaskAll_comp() throws ClassNotFoundException, SQLException;
	//전체업무 - 마감일 지남''
	public int getTaskAll_enddateLate() throws ClassNotFoundException, SQLException;
	//전체업무 - 마감일 없음''
	public int getTaskAll_enddateNo() throws ClassNotFoundException, SQLException;
	//전체업무 - 진행중인 업무''
	public int getTaskAll_ing() throws ClassNotFoundException, SQLException;
	
	
/*  DONUT CHART (ALL) */	
	
	//나에게 배정된 업무 - 완료된 업무
	public int getTaskMe_comp(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 마감일 지남
	public int getTaskMe_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 마감일 없음
	public int getTaskMe_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 진행중인 업무
	public int getTaskMe_ing(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	
	//내가 작성한 업무 - 완료된 업무
	public int getTaskI_comp(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 마감일 지남
	public int getTaskI_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 마감일 없음
	public int getTaskI_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 진행중인 업무
	public int getTaskI_ing(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	
	//내가 팔로우하는 업무 - 완료된 업무
	public int getTaskFollow_comp(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 마감일 지남
	public int getTaskFollow_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 마감일 없음
	public int getTaskFollow_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 진행중인 업무
	public int getTaskFollow_ing(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	
/*  DONUT CHART (USER) */
	
	//나에게 배정된 업무 - 완료된 업무
	public int getTaskMe_compU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 마감일 지남
	public int getTaskMe_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 마감일 없음
	public int getTaskMe_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//나에게 배정된 업무 - 진행중인 업무
	public int getTaskMe_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	
	//내가 작성한 업무 - 완료된 업무
	public int getTaskI_compU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 마감일 지남
	public int getTaskI_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 마감일 없음
	public int getTaskI_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 작성한 업무 - 진행중인 업무
	public int getTaskI_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException;	
	
	

	//내가 팔로우하는 업무 - 완료된 업무
	public int getTaskFollow_compU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 마감일 지남
	public int getTaskFollow_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 마감일 없음
	public int getTaskFollow_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//내가 팔로우하는 업무 - 진행중인 업무
	public int getTaskFollow_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException;	
	
	
	
	/*//카테고리 아이디
	public String getTitle(Category_DTO title) throws ClassNotFoundException, SQLException;*/

	
/*   BAR CHART	(ALL) */
	
	//전체업무흐름 - 완료된 업무
	public List<Task_DTO> getTaskAllFlow_comp() throws ClassNotFoundException, SQLException;
	
	//전체업무흐름 - 완료된업무 갯수
	public List<Task_DTO> getTaskAllFlow_comp_count() throws ClassNotFoundException, SQLException;
	
	//전체업무흐름 - 마감일 지남
	public List<Task_DTO> getTaskAllFlow_enddateLate_count() throws ClassNotFoundException, SQLException;
	//전체업무흐름 - 마감일 없음
	public List<Task_DTO> getTaskAllFlow_enddateNo_count() throws ClassNotFoundException, SQLException;
	//전체업무흐름 - 진행중인 업무
	public List<Task_DTO> getTaskAllFlow_ing_count() throws ClassNotFoundException, SQLException;
	
	
	
	public List<Users_DTO> getMemberListMe(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	//전체업무흐름 - 업무 이름
	public String getTaskAllFlow_taskName(Task_DTO dto) throws ClassNotFoundException, SQLException;

	
	
	/*   BAR CHART	(USER) */	
	
	//전체업무흐름 - 완료된 업무
	public List<Task_DTO> getTaskAllFlow_compU() throws ClassNotFoundException, SQLException;
	
	//전체업무흐름 - 완료된업무 갯수
	public List<Task_DTO> getTaskAllFlow_comp_countU() throws ClassNotFoundException, SQLException;
	
	//전체업무흐름 - 마감일 지남
	public List<Task_DTO> getTaskAllFlow_enddateLate_countU() throws ClassNotFoundException, SQLException;
	//전체업무흐름 - 마감일 없음
	public List<Task_DTO> getTaskAllFlow_enddateNo_countU() throws ClassNotFoundException, SQLException;
	//전체업무흐름 - 진행중인 업무
	public List<Task_DTO> getTaskAllFlow_ing_countU() throws ClassNotFoundException, SQLException;
	
	
	
}
