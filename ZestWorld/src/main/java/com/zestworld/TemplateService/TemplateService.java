package com.zestworld.TemplateService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.AnalysisDAO.AnalysisDAO;
import com.zestworld.Table_DTO.Template_DTO;
import com.zestworld.TemplateDAO.TemplateDAO;

@Service
public class TemplateService {
	
	@Autowired
	private SqlSession sqlsession;
	//전체 업무 - 모든 업무
	public int insert(Template_DTO dto) throws ClassNotFoundException, SQLException{
		TemplateDAO dao = sqlsession.getMapper(TemplateDAO.class);
		int result = dao.insert(dto);
		return result;
	}
	
	public List<Template_DTO> getNotice(Template_DTO dto) throws ClassNotFoundException, SQLException{
		TemplateDAO dao = sqlsession.getMapper(TemplateDAO.class);
		List<Template_DTO> result = dao.getNotice(dto);
		return result;
	}
	
	
	/*//게시물 개수
		public int getCount(String field, String query) throws ClassNotFoundException, SQLException;
		//게시물 입력
		public int insert(Template_DTO dto) throws ClassNotFoundException, SQLException;
		//전체 게시물
		public List<Template_DTO> getNotices(int page, String field, String query) throws ClassNotFoundException, SQLException;
		//게시물 삭제
		public int delete(String template_id) throws ClassNotFoundException, SQLException;
		//게시물 수정
		public int update(Template_DTO dto) throws ClassNotFoundException, SQLException;
		//게시물 상세
		public Template_DTO getNotice(String template_id) throws ClassNotFoundException, SQLException;*/
}
