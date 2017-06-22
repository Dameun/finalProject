package com.zestworld.OutlineDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.TaskAssignMember_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

public interface IOutlineDAO {
	
	//task 테이블에 아무것도 없을 경우(전체 리스트)
	public List<Task_DTO> basictasklist() throws ClassNotFoundException, SQLException;
	//필터되기 전 (전체리스트)
	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException;
	//내업무 (전체리스트)
	public List<Task_DTO> tasklist_mytask(String user_id) throws ClassNotFoundException, SQLException;
	//필터 (전체리스트)
	public List<Task_DTO> taskTest(Task_DTO dto) throws ClassNotFoundException, SQLException;
	
	
	//필터에 있는 프로젝트 목록
	public List<Project_DTO> projectlist() throws ClassNotFoundException, SQLException;
	//필터에 있는 작성자 목록
	public List<Workspace_DTO> writerlist(int workspace_id) throws ClassNotFoundException, SQLException;
	
	//task success flag
	public int updateFlag(String task_id) throws ClassNotFoundException, SQLException;
	public int updateFlagZero(String task_id) throws ClassNotFoundException, SQLException;
		
		
	//새업무 등록
	public int insertTask(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//업무등록에 필요한 카테고리 리스트
	public List<Category_DTO> categorylist(int project_id) throws ClassNotFoundException, SQLException;
	
	//상세업무 보기
	public Task_DTO detailTask(String user_id) throws ClassNotFoundException, SQLException;
	//상세보기 수정
	public int detailUpdate(Task_DTO dto) throws ClassNotFoundException, SQLException;
	//상세보기(업무) 삭제
	public int detailDelete(int task_id) throws ClassNotFoundException, SQLException;
	
	
	//체크리스트 등록
	public int checkListReg(CheckList_DTO dto) throws ClassNotFoundException, SQLException;
	//체크리스트 목록
	public List<CheckList_DTO> checkListView(int task_id) throws ClassNotFoundException, SQLException;
	//체크리스트 success flag
	public int updateChkFlag(int check_id) throws ClassNotFoundException, SQLException;
	public int updateChkFlagZero(int check_id) throws ClassNotFoundException, SQLException;
	
	//체크리스트 삭제
	public int checkListDelete(int check_id) throws ClassNotFoundException, SQLException;
	
	
	
	
	
	//배정된 멤버 목록
	public List<Users_DTO> assignMemberList(int project_id) throws ClassNotFoundException, SQLException;
	public int assignMemberReg(TaskAssignMember_DTO dto) throws ClassNotFoundException, SQLException;
	
	
}
