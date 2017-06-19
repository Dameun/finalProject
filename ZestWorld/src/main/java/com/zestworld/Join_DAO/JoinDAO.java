package com.zestworld.Join_DAO;

import java.sql.SQLException;
import java.util.Map;

import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;

public interface JoinDAO {
	
	//회원정보 얻기
	public Users_DTO getMember(String user_id) throws ClassNotFoundException, SQLException;
	
	//회원가입
	public int insert(Users_DTO member) throws ClassNotFoundException, SQLException;
	
	//권한처리
	public int insertRoll(Role_DTO role) throws ClassNotFoundException, SQLException;
	
	//idcheck
	public int idCheck(String user_id);
	
	//회원수정
	public int updateUser(Users_DTO member);
	
	
	public Users_DTO GetSearchUser(String user_id);
	
	
	//비번 찾기
	public String getPw(Map<String, Object> paramMap);
	
	
	//비밀번호 수정
	public int pwEdit(Users_DTO member) throws ClassNotFoundException, SQLException; 
	
	
	
	
	
	
}
