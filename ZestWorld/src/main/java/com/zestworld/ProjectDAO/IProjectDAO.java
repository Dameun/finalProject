package com.zestworld.ProjectDAO;

import java.sql.SQLException;
import java.util.List;

import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;


public interface IProjectDAO {
	//프로젝트 멤버 리스트
	public List<Project_user_DTO> projectMemberList(int projectid);
	
	//프로젝트 멤버 삭제
	public int assignMemberDelete(Project_user_DTO memberId);
	
	//워크 스페이스 멤버 리스트
	public List<WorkspaceUser_DTO> workspaceMemberList(int workspaceId);
	
	//프로젝트 멤버 배정
	public int projectAssignMember(Project_user_DTO dto);
	
	public String stateselect(String user_id);
	
	//프로젝트 멤버 리스트
	public List<Project_user_DTO> AssignMemberList(int projectId);
}
