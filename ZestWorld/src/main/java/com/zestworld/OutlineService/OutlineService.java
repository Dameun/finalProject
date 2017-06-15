package com.zestworld.OutlineService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.OutlineDAO.IOutlineDAO;
import com.zestworld.Table_DTO.Task_DTO;

@Service
public class OutlineService {

	@Autowired
	private SqlSession sqlsession;
	
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
		System.out.println("Service "  + dto.getUserid());
		List<Task_DTO> list=dao.taskTest(dto);
		return list;
	}
	
}
