package com.zestworld.workspaceController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zestworld.Join_Service.JoinService;
import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.userStateService.UserStateService;
import com.zestworld.util.DataController;

/*
 * @FileName : workspaceController.java
 * @Project : ZestWorld
 * @Date : 2017.06.16
 * @Author : 장윤희
 * @Desc : workspace, project 생성 및 수정 
 * */

@Controller
public class workspaceController {

	 @Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JoinService service;
	
	@Autowired
	private UserStateService userstateService;
	
	//
	@RequestMapping("/workSpace.htm")
	public String GetWorkSpace(Principal principal,HttpSession session, Model model)
	{	
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		String workspaceid=" ";
		String usernameid = principal.getName();
		Users_DTO user = service.GetSearchUser(usernameid);
		session.setAttribute("user", user);
		DataController.getInstance().SetUserSavedata(user);
		
		if( session.getAttribute("workspace_id") != null){
			workspaceid = (String)session.getAttribute("workspace_id");
			int strWorkspaceId=Integer.parseInt(workspaceid);
			WorkspaceUser_DTO workspaceUser= new WorkspaceUser_DTO ();
			workspaceUser.setWorkspace_id(strWorkspaceId);
			workspaceUser.setUser_id(usernameid);
			List<WorkspaceUser_DTO> listSize= taskDao.GetWorkSpaceMemberChk(workspaceUser);
			
			if(listSize.size()==0)taskDao.insertWorkSpaceUser(workspaceUser);				
		}
		
		workspaceid = "";
        List<WorkspaceUser_DTO> workspaceUserList = taskDao.GetWorkSpaceList(usernameid);
        List<Workspace_DTO>workspaceList = new ArrayList<Workspace_DTO>();
        Workspace_DTO workspace;
        
        for( int i=0; i<workspaceUserList.size(); i ++)
        {
        	int workSpaceId = workspaceUserList.get(i).getWorkspace_id();
        	workspace= taskDao.GetWorkSpace(workSpaceId);
        	workspaceList.add(workspace);
        }
       
        DataController.getInstance().SetUserWorkSpace (workspaceList);
        model.addAttribute ("workspaceList", workspaceList);
		return "home/workSpace";
	}

	//워크스페이스 선택시 
	@RequestMapping("/selectWorkspace.htm")
	public String selectWorkspace(String selectWorkspaceID, Model model)
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace= taskDao.GetWorkSpace(Integer.parseInt(selectWorkspaceID));
		DataController.getInstance().SetCurrentWorkspace(workspace);

		ArrayList<Project_DTO>projectList = DataController.getInstance().GetProjectList(); 
		model.addAttribute("selectWorkspace", workspace);
		model.addAttribute("projectList", projectList);
		return "home.main";
	}
	
	@RequestMapping("/createWorkspace.htm")
	public String createWorkspace(String workspaceName,String workspaceDiscription,Model model)
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace = new Workspace_DTO ();
		workspace.setWorkspace_name(workspaceName);
		workspace.setDescription(workspaceDiscription);
		workspace.setUser_id(DataController.getInstance().GetUser().getUser_id());
		taskDao.insertWorkSpace(workspace);
		
		WorkspaceUser_DTO workspaceUser= new WorkspaceUser_DTO ();
		workspace = taskDao.GetWorkSpaceByname(workspace);
		workspaceUser.setWorkspace_id(workspace.getWorkspace_id());
		workspaceUser.setUser_id(DataController.getInstance().GetUser().getUser_id());
		
		taskDao.insertWorkSpaceUser(workspaceUser);
		DataController.getInstance().dataChange();
		List<Workspace_DTO>workspaceList = new ArrayList<Workspace_DTO>();
		workspaceList = DataController.getInstance().GetWorkspaceList();
		model.addAttribute ("workspaceList", workspaceList);
		UserStateCreate(workspace.getWorkspace_id(),DataController.getInstance().GetUser().getUser_id() );
		return "home/workSpace";
	}
	
	//워크스페이스 생성시 상태테이블도 같이 생성 
	private void UserStateCreate(int workspace_id, String user_id)
	{
		UserState_DTO userState = new UserState_DTO();
		userState.setState("업무중");
		userState.setUser_id(user_id);
		userState.setWorkspace_id(workspace_id);
		userstateService.InsertUserState(userState);
	}
	
	@RequestMapping("/userstateView.htm")
	@ResponseBody
	private String UserStateView(){
		IProjectDAO ipd=sqlsession.getMapper(IProjectDAO.class);
		String state= ipd.stateselect(	DataController.getInstance().GetUser().getUser_id());
		System.out.println(state);
		if(state.equals("업무중")){
			return "1";
		}else if(state.equals("외출중")){
			return "2";			
		}else if(state.equals("회의중")){
			return "3";
		}else{
			return "4";
		}
	
	}
}
