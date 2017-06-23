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

import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.userStateService.UserStateService;
import com.zestworld.util.DataController;

@Controller
public class workspaceController {

	 @Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JoinService service;
	
	@Autowired
	private UserStateService userstateService;
	
	@RequestMapping("/workSpace.htm")
	public String GetWorkSpace(Principal principal,HttpSession session, Model model)
	{	
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		String workspaceid=" ";
		String usernameid = principal.getName();
		Users_DTO user = service.GetSearchUser(usernameid);
		DataController.getInstance().SetUserSavedata(user);
		
		if( session.getAttribute("workspace_id") != null){
			workspaceid = (String)session.getAttribute("workspace_id");
			
			int strWorkspaceId=Integer.parseInt(workspaceid);
			
			WorkspaceUser_DTO workspaceUser= new WorkspaceUser_DTO ();
			workspaceUser.setWorkspace_id(strWorkspaceId);
			workspaceUser.setUser_id(usernameid);
			
			//String visitUser=DataController.getInstance().GetUser().getUser_id();
			
			List<WorkspaceUser_DTO> listSize= taskDao.GetWorkSpaceMemberChk(workspaceUser);
			
			if(listSize.size()==0){
				taskDao.insertWorkSpaceUser(workspaceUser);
			}	
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

	@RequestMapping("/selectWorkspace.htm")
	public String selectWorkspace(String selectWorkspaceID, Model model)
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace= taskDao.GetWorkSpace(Integer.parseInt(selectWorkspaceID));
		DataController.getInstance().SetCurrentWorkspace(workspace);
		
		//data값 확인
	/*	UserState_DTO SearchuserState= new UserState_DTO();
		List<UserState_DTO> list= userstateService.GetuserStateList( workspace.getWorkspace_id());
		System.out.println(SearchuserState.getState());*/
		
		ArrayList<Project_DTO>projectList = DataController.getInstance().GetProjectList(); 
		model.addAttribute("selectWorkspace", workspace);
		model.addAttribute("projectList", projectList);
		return "home.main";
	}
	
	
	//�썙�겕�뒪�럹�씠�뒪 �깉濡쒕쭔�뱾湲� �셿猷� createWorkspace.htm?workspaceName 
	@RequestMapping("/createWorkspace.htm")
	public String createWorkspace(String workspaceName,String workspaceDiscription,Model model)
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace = new Workspace_DTO ();
		workspace.setWorkspace_name(workspaceName);
		workspace.setDescription(workspaceDiscription);
		workspace.setUser_id(DataController.getInstance().GetUser().getUser_id());
		taskDao.insertWorkSpace(workspace);
		
		//�떎���떎 愿�怨�
		//�쑀�졇�� �썙�겕�뒪�럹�씠�뒪 �뀒�씠釉�(workspaceUser)�뿉�룄 異붽�
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



}
