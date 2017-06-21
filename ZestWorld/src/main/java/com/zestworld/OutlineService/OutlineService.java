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
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

@Service
public class OutlineService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<Task_DTO> basictasklist() throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Task_DTO> list=dao.basictasklist();
		return list;
	}
	
	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Task_DTO> list=dao.tasklist();
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
	public List<Project_DTO> projectlist() throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<Project_DTO> list=dao.projectlist();
		return list;
	}
	public List<Workspace_DTO> writerlist(String workspace_id) throws ClassNotFoundException, SQLException{
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
	
}
