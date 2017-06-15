package com.zestworld.taskDAO;

import java.util.List;

import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

public interface TaskDataDAO 
{
   public List<WorkspaceUser_DTO> GetWorkSpaceList(String userid);//워크스페이스트리스트  반환 
   public Workspace_DTO GetWorkSpace(String workspaceid); 		  //워크스페이스반환
   public Workspace_DTO GetWorkSpaceByname(Workspace_DTO workspace); 		  //워크스페이스반환
   public void insertWorkSpace(Workspace_DTO workspace);
   public void insertProject(Project_DTO workspace);
   
   public void insertWorkSpaceUser(WorkspaceUser_DTO workspace);
   public List<Project_DTO> GetProjectList(String WorkSpaceid);	  //워크스페이스 기준 프로젝트 반환
   public Project_DTO GetProject(String WorkSpaceid);			  //프로젝트 반환
 
}
