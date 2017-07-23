package com.zestworld.userStateService;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.userStateDAO.IUserStateDAO;

/*
 * @FileName : UserStateService.java
 * @Project : ZestWorld
 * Date : 2017.06.23
 * @Author : 장윤희
 * @Desc : UserStateService
 */
@Service
public class UserStateService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//회원 상태가져오기
	public UserState_DTO GetuserState(String user_id, int wordspace_id) 
	{
		IUserStateDAO dao = sqlsession.getMapper(IUserStateDAO.class);
		UserState_DTO userState = new UserState_DTO();
		try {
			userState = dao.GetuserState(user_id, wordspace_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return userState;
	}
	
	//현재워크스페이스 유져상태리스트 가져오기 
	public List<UserState_DTO> GetuserStateList(int workspace_id) 
	{
		IUserStateDAO dao = sqlsession.getMapper(IUserStateDAO.class);
		List<UserState_DTO> list = new ArrayList();
		try {
			list = dao.GetuserStateList(workspace_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}
	
	
	//현재 로그인한 유져 상태변경하기
	public int UpdateUserState(UserState_DTO userstate) 
	{
		IUserStateDAO dao = sqlsession.getMapper(IUserStateDAO.class);
		int result= 0;
		try {
			result = dao.UpdateUserState(userstate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return result;
	}
	
	//현재 워크스페이스 생성시 유져 상태 삽입
	public int InsertUserState(UserState_DTO userstate)
	{
		IUserStateDAO dao = sqlsession.getMapper(IUserStateDAO.class);
		int result=dao.InsertUserState(userstate);
		return result;
	}

}
