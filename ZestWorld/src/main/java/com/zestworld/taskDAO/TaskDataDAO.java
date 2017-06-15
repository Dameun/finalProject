package com.zestworld.taskDAO;

import java.util.List;

import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;

public interface TaskDataDAO 
{
   public List<WorkspaceUser_DTO> GetWorkSpaceList(String userid);//�썙�겕�뒪�럹�씠�뒪�듃由ъ뒪�듃  諛섑솚 
   public Workspace_DTO GetWorkSpace(String workspaceid); 		  //�썙�겕�뒪�럹�씠�뒪諛섑솚
   public Workspace_DTO GetWorkSpaceByname(Workspace_DTO workspace); 		  //�썙�겕�뒪�럹�씠�뒪諛섑솚
   public void insertWorkSpace(Workspace_DTO workspace);
   public void insertProject(Project_DTO workspace);
   
   public void insertWorkSpaceUser(WorkspaceUser_DTO workspace);
   public List<Project_DTO> GetProjectList(String WorkSpaceid);	  //�썙�겕�뒪�럹�씠�뒪 湲곗� �봽濡쒖젥�듃 諛섑솚
   public Project_DTO GetProject(String projectid);			  //�봽濡쒖젥�듃 諛섑솚
 
}
