package com.zestworld.ProjectServiceP;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;



@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	public int assignMemberDelete(int memberId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		int result=dao.assignMemberDelete(memberId);
		
		return result;
		
	}
	
	public List<WorkspaceUser_DTO> workspaceMemberList(int workspaceId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<WorkspaceUser_DTO> wMemberlist = dao.workspaceMemberList(workspaceId);
		
		return wMemberlist;
		
	}
	
	public int projectAssignMember(Project_user_DTO dto){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		int result = dao.projectAssignMember(dto);
		
		return result;
	}
	
	public List<Project_user_DTO> projectMemberList(int projectId){
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<Project_user_DTO> result = dao.projectMemberList(projectId);
		
		return result;
	}
	/*public List<Project_user_DTO> projectMemberList() throws ClassNotFoundException, SQLException{
		IProjectDAO dao = sqlsession.getMapper(IProjectDAO.class);		
		List<Project_user_DTO> memberlist=dao.projectMemberList();
		
		return memberlist;
	}*/

}
