package com.zestworld.userStateDAO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
/*
* @FileName : IUserStateDAO.java
* @Project : ZestWorld
* @Date : 2017. 6. 20.
* @Author : 장윤희
* @Desc : 유져상태 저장 및 변경
*/
public interface IUserStateDAO {
	
	//회원 상태가져오기
	public UserState_DTO GetuserState(String user_id,int workspace_id) throws ClassNotFoundException, SQLException;
	
	//현재워크스페이스 유져상태리스트 가져오기 
	public List<UserState_DTO> GetuserStateList(int workspace_id) throws ClassNotFoundException, SQLException;
	
	//현재 로그인한 유져 상태변경하기
	public int UpdateUserState(UserState_DTO userstate) throws ClassNotFoundException, SQLException;
	
	//현재 워크스페이스 생성시 유져 상태 삽입
	public int InsertUserState(UserState_DTO userstate);
	
}
