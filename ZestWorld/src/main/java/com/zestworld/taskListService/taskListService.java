package com.zestworld.taskListService;

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
import com.zestworld.taskListDAO.taskListDao;
import com.zestworld.util.DataController;

@Service
public class taskListService {
	@Autowired
	private SqlSession sqlsession;
	

	public List<Category_DTO> tasklist(Category_DTO dto) throws ClassNotFoundException, SQLException{

		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Category_DTO> list=dao.tasklist(dto);
		return list;
	}
	
	public List<Task_DTO> tasklist2() throws ClassNotFoundException, SQLException{

		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Task_DTO> list2 =dao.tasklist2();
		return list2;
	}
	
	public void titleInsert(Category_DTO dto) throws ClassNotFoundException, SQLException{
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		Project_DTO projdto = new Project_DTO();
		String title = DataController.getInstance().getCurrentProject().getP_title();
		projdto.setP_title(title);
	
		
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		dto.setWorkspace_id(workspace_id);
		
		int project_id = dao.getProject_Id(projdto);
		
		dto.setProject_id(project_id);
		dao.titleInsert(dto);
		
	}
	
	public void tasktitleInsert(Task_DTO dto){
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		dao.tasktitleInsert(dto);
		
	}

	public int tasktitleCheck(Task_DTO dto) throws ClassNotFoundException, SQLException{
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		return dao.taskTitle_Check(dto);
		
	}
		
	public void categoryUpdate(Category_DTO dto) throws ClassNotFoundException, SQLException{
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		dao.categoryUpdate(dto);
	}
	
	 public Task_DTO detailtask(String task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		Task_DTO list= dao.detailTask(task_id);
		return list;
	}
	 
	 public int detailUpdate(Task_DTO dto) throws ClassNotFoundException, SQLException{
			IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
			int list= dao.detailUpdate(dto);
			return list;
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
	 
	 public int detailDelete(int task_id) throws ClassNotFoundException, SQLException{
			IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
			int result= dao.detailDelete(task_id);
			return result;
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
	
	public int checkListDelete(int check_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int assginmemberReg= dao.checkListDelete(check_id);
		return assginmemberReg;
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
	
	public Task_DTO detailTask(String task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		Task_DTO list= dao.detailTask(task_id);
		return list;
	}
	
	public List<TaskAssignMember_DTO>  taskMemberList(int task_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		List<TaskAssignMember_DTO> result= dao.taskMemberList(task_id);
		return result;
	}
	
	public int updateChkFlagZero(int check_id) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.updateChkFlagZero(check_id);
		return result;
	}
	
	public int deleteTaskMember(TaskAssignMember_DTO dto) throws ClassNotFoundException, SQLException{
		IOutlineDAO dao = sqlsession.getMapper(IOutlineDAO.class);
		int result= dao.deleteTaskMember(dto);
		return result;
		
	}
	
	public Category_DTO getCatetitle(Category_DTO dto) throws ClassNotFoundException, SQLException{
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		Category_DTO list =	dao.getCatetitle(dto);
		return list;
	}
	
}