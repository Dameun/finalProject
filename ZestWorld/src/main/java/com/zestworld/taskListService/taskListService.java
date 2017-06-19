package com.zestworld.taskListService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
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
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		projdto.setWorkspace_id(workspace_id);
		
		int project_id = dao.getProject_Id(projdto);
		System.out.println("프로젝트ID :" + project_id);
		System.out.println("워크스페이스ID: " + workspace_id);
		dto.setProject_id(project_id);
		dto.setWorkspace_id(workspace_id);
		dao.titleInsert(dto);
		
	}
	
	public void tasktitleInsert(Task_DTO dto){
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		dao.tasktitleInsert(dto);
		
	}
	
		
		
	
}