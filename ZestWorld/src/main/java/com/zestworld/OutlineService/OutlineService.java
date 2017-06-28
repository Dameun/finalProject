package com.zestworld.OutlineService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.OutlineDAO.IOutlineDAO;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.TaskAssignMember_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskListDAO.taskListDao;

/*
* @FileName : OutlineService.java
* @Project : ZestWorld
* @Date : 2017. 6. 28.
* @Author : 최담은
* @Desc : 전체개요(리스트,필터,상세정보 수정)
*/

@Service
public class OutlineService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<Task_DTO> basictasklist() throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Task_DTO> list=dao.basictasklist();
		return list;
	}
	
	public List<Task_DTO> tasklist(int workspace_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Task_DTO> list=dao.tasklist(workspace_id);
		return list;
	}
	public List<Task_DTO> tasklist_mytask(String userid) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		
		List<Task_DTO> list=dao.tasklist_mytask(userid);
		return list;
	}
	public List<Task_DTO> taskTest(Task_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Task_DTO> list=dao.taskTest(dto);
		return list;
	}
	public List<Project_DTO> projectlist(int workspace_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Project_DTO> list=dao.projectlist(workspace_id);
		return list;
	}
	public List<Workspace_DTO> writerlist(int workspace_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Workspace_DTO> assignmember=dao.writerlist(workspace_id);
		return assignmember;
	}
	public int insertTask(Task_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int inserttask=dao.insertTask(dto);
		return inserttask;
	}
	
	
	public List<Category_DTO> categorylist(int project_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Category_DTO> list= dao.categorylist(project_id);
		return list;
	}
	
	public Task_DTO detailTask(String task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		Task_DTO list= dao.detailTask(task_id);
		return list;
	}
	
	public int updateFlag(String task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int list= dao.updateFlag(task_id);
		return list;
	}
	
	public int updateFlagZero(String task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int list= dao.updateFlagZero(task_id);
		return list;
	}
	
	public int detailUpdate(Task_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int list= dao.detailUpdate(dto);
		return list;
	}
	
	public int detailDelete(int task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.detailDelete(task_id);
		return result;
	}
	
	public List<TaskAssignMember_DTO>  taskMemberList(int task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<TaskAssignMember_DTO> result= dao.taskMemberList(task_id);
		return result;
	}
	
	public int checkListReg(CheckList_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.checkListReg(dto);
		return result;
	}
	public List<CheckList_DTO> checkListView(int task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<CheckList_DTO> result= dao.checkListView(task_id);
		return result;
	}
	
	public int updateChkFlag(int check_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.updateChkFlag(check_id);
		return result;
	}
	
	public int updateChkFlagZero(int check_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.updateChkFlagZero(check_id);
		return result;
	}
	
	public List<Users_DTO> assignMemberList(int project_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Users_DTO> user= dao.assignMemberList(project_id);
		return user;
	}
	
	public int assignMemberReg(TaskAssignMember_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int assginmemberReg= dao.assignMemberReg(dto);
		return assginmemberReg;
	}
	
	public int checkListDelete(int check_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int assginmemberReg= dao.checkListDelete(check_id);
		return assginmemberReg;
	}
	
	//민성부분(프로젝트 -> 업무리스트 페이지 이동할때 필요한 서비스부분)
	public List<Category_DTO> tasklist(Category_DTO dto) throws ClassNotFoundException, SQLException{
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Category_DTO> list=dao.tasklist(dto);
		return list;
	}
	
	public int deleteTaskMember(TaskAssignMember_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.deleteTaskMember(dto);
		return result;
		
	}
	
	public int countList(Task_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.countList(dto);
		return result;
		
	}
}
