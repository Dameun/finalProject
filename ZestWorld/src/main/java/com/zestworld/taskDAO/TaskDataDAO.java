package com.zestworld.taskDAO;

import java.util.List;

import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

public interface TaskDataDAO 
{
   public List<WorkspaceUser_DTO> GetWorkSpaceList(String userid);
   public Workspace_DTO GetWorkSpace(int workspaceid); 		
   public Workspace_DTO GetWorkSpaceByname(Workspace_DTO workspace); 		
   public void insertWorkSpace(Workspace_DTO workspace);
   public void insertProject(Project_DTO project_DTO);
   public void InsertProjectUsers(Project_user_DTO projectUsers);
   public void insertWorkSpaceUser(WorkspaceUser_DTO workspace);
   public List<Project_DTO> GetProjectList(int WorkSpaceid);	 
   public Project_DTO GetProject(String projectid);			
   public Project_DTO GetProjectByname(Project_DTO project);			
   public void updateProject(Project_DTO project);
   public void deleteProject(Project_DTO project);
   public void updateWorkspace(Workspace_DTO project);
   public void deleteWorkspace(int workspaceid);
   public void deleteTaskByProjectid(Project_DTO project);
   public List<WorkspaceUser_DTO> GetWorkSpaceMemberChk(WorkspaceUser_DTO workspaceUser_DTO);
}
