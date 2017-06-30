package com.zestworld.ProjectService;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;

/*
* @FileName : ProjectService.java
* @Project : ZestWorld
* @Date : 2017. 7. 01.
* @Author : 최담은
* @Desc : 프로젝트 리스트(멤버 배정,취소)
*/


@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	//프로젝트 멤버 삭제
	public int assignMemberDelete(Project_user_DTO dto){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);
		int result=dao.assignMemberDelete(dto);
		
		return result;	
	}
	
	//워크 스페이스 멤버 리스트
	public List<WorkspaceUser_DTO> workspaceMemberList(int workspaceId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<WorkspaceUser_DTO> wMemberlist = dao.workspaceMemberList(workspaceId);
		
		return wMemberlist;
	}
	
	//프로젝트 멤버 배정
	public int projectAssignMember(Project_user_DTO dto){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		int result = dao.projectAssignMember(dto);
		
		return result;
	}
	
	//프로젝트 멤버 리스트
	public List<Project_user_DTO> projectMemberList(int projectId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<Project_user_DTO> result = dao.projectMemberList(projectId);
		
		return result;
	}
	
	//프로젝트 멤버 리스트
	public List<Project_user_DTO> AssignMemberList(int projectId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<Project_user_DTO> result = dao.AssignMemberList(projectId);
		
		return result;
	}
}
