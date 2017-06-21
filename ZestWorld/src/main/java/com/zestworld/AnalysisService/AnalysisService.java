package com.zestworld.AnalysisService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.AnalysisDAO.AnalysisDAO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;


@Service
public class AnalysisService {

	@Autowired
	private SqlSession sqlsession;
	//전체 업무 - 모든 업무
	public int getTaskAll() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAll();
		return result;
	}
	//전체 업무 - 완료된 업무
	public int getTaskAll_comp() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAll_comp();
		return result;
	}
	//전체 업무 - 마감일 지난 업무
	public int getTaskAll_enddateLate() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAll_enddateLate();
		return result;
	}
	//전체 업무 - 마감일 없는 업무
	public int getTaskAll_enddateNo() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAll_enddateNo();
		return result;
	}
	//전체 업무 - 진행중인 업무
	public int getTaskAll_ing() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAll_ing();
		return result;
	}
	
	
	
	//나에게 배정된 업무 - 완료된 업무
	public int getTaskMe_comp(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_comp(dto);
		return result;
	}
	//나에게 배정된 업무 - 마감일 지난 업무
	public int getTaskMe_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_enddateLate(dto);
		return result;
	}
	//나에게 배정된 업무 - 마감일 없는 업무
	public int getTaskMe_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_enddateNo(dto);
		return result;
	}
	//나에게 배정된 업무 - 진행중인 업무
	public int getTaskMe_ing(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_ing(dto);
		return result;
	}
	
	
	//내가 작성한 업무 - 완료된 업무
	public int getTaskI_comp(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_comp(dto);
		return result;
	}
	//내가 작성한 업무 - 마감일 지난 업무
	public int getTaskI_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_enddateLate(dto);
		return result;
	}
	//내가 작성한 업무 - 마감일 없는 업무
	public int getTaskI_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_enddateNo(dto);
		return result;
	}
	//내가 작성한 업무 - 진행중인 업무
	public int getTaskI_ing(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_ing(dto);
		return result;
	}
	
	
	
	//내가 팔로우하는 업무 - 완료된 업무
	public int getTaskFollow_comp(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_comp(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 마감일 지난 업무
	public int getTaskFollow_enddateLate(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_enddateLate(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 마감일 없는 업무
	public int getTaskFollow_enddateNo(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_enddateNo(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 진행중인 업무
	public int getTaskFollow_ing(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_ing(dto);
		return result;
	}
	
	
	
	
	/*//전체 업무흐름 - 카테고리 아이디
	public String getTitle(String title) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		String result = dao.getTitle(title);
		return result;
	}*/
		
		
		
	
	//전체 업무 - 완료된 업무
	public List<Task_DTO> getTaskAllFlow_comp() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_comp();
		return result;
	}
	
	
	
	//전체업무 = 완료된 업무 개수
	public List<Task_DTO> getTaskAllFlow_comp_count() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_comp_count();
		return result;
	}
	
	
	
	
	//전체 업무 - 마감일 지난 업무 개수
	public List<Task_DTO> getTaskAllFlow_enddateLate_count() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_enddateLate_count();
		return result;
	}
	//전체 업무 - 마감일 없는 업무 개수
	public List<Task_DTO> getTaskAllFlow_enddateNo_count() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_enddateNo_count();
		return result;
	}
	//전체 업무 - 진행중인 업무 개수
	public List<Task_DTO> getTaskAllFlow_ing_count() throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_ing_count();
		return result;
	}
	
	//리스트 - 유저 아이디
	/*public List<Users_DTO> getMemberListMe(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Users_DTO> result = dao.getMemberListMe(dto);
		return result;
	}*/
	
	//전체업무 흐름 - 업무 이름
	/*public String getTaskAllFlow_taskName(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		String result = dao.getTaskAllFlow_taskName(dto);
		return result;
	}*/
	
}
