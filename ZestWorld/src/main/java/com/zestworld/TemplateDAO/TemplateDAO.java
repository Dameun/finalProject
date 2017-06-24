package com.zestworld.TemplateDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Template_DTO;

public interface TemplateDAO {
	

	//게시물 입력
	public int insert(Template_DTO dto) throws ClassNotFoundException, SQLException;
	//전체 게시물
	public List<Template_DTO> getNotice(Template_DTO dto) throws ClassNotFoundException, SQLException;
	//게시물 삭제
	public int delete(String template_id) throws ClassNotFoundException, SQLException;
	//게시물 수정
	public int update(Template_DTO dto) throws ClassNotFoundException, SQLException;
	//게시물 상세
	public Template_DTO getNotice(String template_id) throws ClassNotFoundException, SQLException;

	
}
