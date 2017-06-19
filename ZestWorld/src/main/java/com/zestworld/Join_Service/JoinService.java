package com.zestworld.Join_Service;

import java.sql.SQLException;

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
	
	public int idChecsk(String user_id){
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		int result = dao.idCheck(user_id);
		return result;
	}
	
	public Users_DTO GetSearchUser(String user_id)
	{
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		Users_DTO users= dao.GetSearchUser(user_id);
		return users;
	}
	
	/*//비번 찾기 폐기예정
	public String getPw(Map<String, Object> paramMap) throws ClassNotFoundException, SQLException{
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		String result = dao.getPw(paramMap);
		return result;
		//return getSqlSession().selectOne("getPw",paramMap);
		//return joindao.getPw(paramMap);
	}
	*/
		
		//비번 변경
	public int pwEdit(Users_DTO member) throws ClassNotFoundException, SQLException {
		JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		int result = dao.pwEdit(member);
		return result;
		// return getSqlSession().selectOne("getPw",paramMap);
		// return joindao.getPw(paramMap);
	}

	public int updateUser(Users_DTO member){
	JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
	int result = dao.updateUser(member);
	return result;
	}
}
