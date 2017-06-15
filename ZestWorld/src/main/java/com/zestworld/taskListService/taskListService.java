package com.zestworld.taskListService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.taskListDAO.taskListDao;

@Service
public class taskListService {
	@Autowired
	private SqlSession sqlsession;
	

	public List<Task_DTO> tasklist() throws ClassNotFoundException, SQLException{

		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Task_DTO> list=dao.tasklist();
		return list;
	}
	
	public void insertTitle() throws ClassNotFoundException, SQLException{
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
	}
	
	
		
		
	
}