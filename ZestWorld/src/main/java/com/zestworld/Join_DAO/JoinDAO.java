package com.zestworld.Join_DAO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
/*
* @FileName : JoinDAO.java
* @Project : ZestWorld
* @Date : 2017. 6. 28.
* @Author : 양건휘
* @Desc : 회원가입, 회원 수정 
*/
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
	
	
	public int GetSearchUser(String user_id);
	
	
	//비번 찾기
	public String getPw(Map<String, Object> paramMap);
	
	
	//비밀번호 수정
	public int pwEdit(Users_DTO member) throws ClassNotFoundException, SQLException; 
	
	
	//맴버초대 이메일
	public List<Workspace_DTO> invitation (Workspace_DTO wo)  throws Exception;
	
	//아이디 중복체크
	public String selectId (Users_DTO member) throws ClassNotFoundException, SQLException;
	
	
}
