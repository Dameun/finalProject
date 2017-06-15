package com.zestworld.Join_Service;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.Join_DAO.JoinDAO;
import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;

@Service
public class JoinService {

	@Autowired
	private SqlSession sqlsession;
	
	public int insert(Users_DTO member) throws ClassNotFoundException, SQLException{
		int result = 0;
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		result = dao.insert(member);
		return result;
	}
	
	public int insertRoll(Role_DTO role) throws ClassNotFoundException, SQLException{
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		int result = dao.insertRoll(role);
		return result;
	}
	
	public int idChecsk(String userid){
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		int result = dao.idCheck(userid);
		return result;
	}
	
	public Users_DTO GetSearchUser(String userid)
	{
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		Users_DTO users= dao.GetSearchUser(userid);
		return users;
	}
	
}
