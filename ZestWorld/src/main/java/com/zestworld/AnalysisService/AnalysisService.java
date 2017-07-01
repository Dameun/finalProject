package com.zestworld.AnalysisService;

import java.sql.SQLException;
import java.util.ArrayList;
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
	
/* DONUTCHART (USER)	*/
	
	//나에게 배정된 업무 - 완료된 업무
	public int getTaskMe_compU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_compU(dto);
		return result;
	}
	//나에게 배정된 업무 - 마감일 지난 업무
	public int getTaskMe_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_enddateLateU(dto);
		return result;
	}
	//나에게 배정된 업무 - 마감일 없는 업무
	public int getTaskMe_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_enddateNoU(dto);
		return result;
	}
	//나에게 배정된 업무 - 진행중인 업무
	public int getTaskMe_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskMe_ingU(dto);
		return result;
	}
	
	
	//내가 작성한 업무 - 완료된 업무
	public int getTaskI_compU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_compU(dto);
		return result;
	}
	//내가 작성한 업무 - 마감일 지난 업무
	public int getTaskI_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_enddateLateU(dto);
		return result;
	}
	//내가 작성한 업무 - 마감일 없는 업무
	public int getTaskI_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_enddateNoU(dto);
		return result;
	}
	//내가 작성한 업무 - 진행중인 업무
	public int getTaskI_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskI_ingU(dto);
		return result;
	}
	
	
	
	//내가 팔로우하는 업무 - 완료된 업무
	public int getTaskFollow_compU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_compU(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 마감일 지난 업무
	public int getTaskFollow_enddateLateU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_enddateLateU(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 마감일 없는 업무
	public int getTaskFollow_enddateNoU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_enddateNoU(dto);
		return result;
	}
	//내가 팔로우하는 업무 - 진행중인 업무
	public int getTaskFollow_ingU(Task_DTO dto) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskFollow_ingU(dto);
		return result;
	}
	
	
	
/* DONUTCHART (ALL)	*/
	
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
		
		
		
/* BARCHART (ALL)	*/	
	
	//전체 업무 - 완료된 업무
	public List<Task_DTO> getTaskAllFlow_comp(int workspace_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_comp(workspace_id);
		return result;
	}
	
	
	
	//전체업무 = 완료된 업무 개수
	public int getTaskAllFlow_comp_count(int workspace_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAllFlow_comp_count(workspace_id);
		return result;
	}
		
	//전체 업무 - 마감일 지난 업무 개수
	public int getTaskAllFlow_enddateLate_count(int workspace_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAllFlow_enddateLate_count(workspace_id);
		return result;
	}
	//전체 업무 - 마감일 없는 업무 개수
	public int getTaskAllFlow_enddateNo_count(int workspace_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAllFlow_enddateNo_count(workspace_id);
		return result;
	}
	//전체 업무 - 진행중인 업무 개수
	public int getTaskAllFlow_ing_count(int workspace_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		int result = dao.getTaskAllFlow_ing_count(workspace_id);
		return result;
	}
	
/* BARCHART (USER)	*/	
	
	//전체 업무 - 완료된 업무
	public List<Task_DTO> getTaskAllFlow_compU(int project_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_compU(project_id);
		return result;
	}
	
	
	
	//전체업무 = 완료된 업무 개수
	public List<Task_DTO> getTaskAllFlow_comp_countU(int project_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_comp_countU(project_id);
		return result;
	}
		
	//전체 업무 - 마감일 지난 업무 개수
	public List<Task_DTO> getTaskAllFlow_enddateLate_countU(int project_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_enddateLate_countU(project_id);
		return result;
	}
	//전체 업무 - 마감일 없는 업무 개수
	public List<Task_DTO> getTaskAllFlow_enddateNo_countU(int project_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_enddateNo_countU(project_id);
		return result;
	}
	//전체 업무 - 진행중인 업무 개수
	public List<Task_DTO> getTaskAllFlow_ing_countU(int project_id) throws ClassNotFoundException, SQLException{
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = dao.getTaskAllFlow_ing_countU(project_id);
		return result;
	}
	

	public List<Task_DTO> getTaskByProjectid(int project_id) {
		AnalysisDAO dao = sqlsession.getMapper(AnalysisDAO.class);
		List<Task_DTO> result = new ArrayList<Task_DTO>();
		try {
			result = dao.getTaskByProjectid(project_id);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
