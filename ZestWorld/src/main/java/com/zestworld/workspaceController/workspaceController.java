package com.zestworld.workspaceController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.util.DataController;
import org.springframework.ui.Model;

@Controller
public class workspaceController {

	 @Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JoinService service;
	
	//로그인시 
	@RequestMapping("/workSpace.htm")
	public String GetWorkSpace(Principal principal, Model model)
	{	
		String usernameid = principal.getName();
		
		Users_DTO user = service.GetSearchUser(usernameid);
		DataController.getInstance().SetUserSavedata(user);
		
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
	

        List<WorkspaceUser_DTO> workspaceUserList = taskDao.GetWorkSpaceList(usernameid);
        List<Workspace_DTO>workspaceList = new ArrayList<Workspace_DTO>();
        Workspace_DTO workspace;
        
        for( int i=0; i<workspaceUserList.size(); i ++)
        {
        	String workSpaceId = workspaceUserList.get(i).getWorkspace_id();
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
		Workspace_DTO workspace= taskDao.GetWorkSpace(selectWorkspaceID);
		DataController.getInstance().SetCurrentWorkspace(workspace);
		//ArrayList<Project_DTO>projectList = DataController.getInstance().GetProjectList(); 
		//model.addAttribute("selectWorkspace", workspace);
		//model.addAttribute("projectList", projectList);
		return "home.main";
	}
	
	
	//워크스페이스 새로만들기 완료 createWorkspace.htm?workspaceName 
	@RequestMapping("/createWorkspace.htm")
	public String createWorkspace(String workspaceName,String workspaceDiscription,Model model)
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace = new Workspace_DTO ();
		workspace.setWorkspace_name(workspaceName);
		workspace.setDescription(workspaceDiscription);
		workspace.setUser_id(DataController.getInstance().GetUser().getUserid());
		taskDao.insertWorkSpace(workspace);
		
		//다대다 관계
		//유져와 워크스페이스 테이블(workspaceUser)에도 추가
		WorkspaceUser_DTO workspaceUser= new WorkspaceUser_DTO ();
		workspace = taskDao.GetWorkSpaceByname(workspace);
		workspaceUser.setWorkspace_id(workspace.getWorkspace_id());
		workspaceUser.setUserid(DataController.getInstance().GetUser().getUserid());
		
		taskDao.insertWorkSpaceUser(workspaceUser);
		DataController.getInstance().dataChange();
		List<Workspace_DTO>workspaceList = new ArrayList<Workspace_DTO>();
		workspaceList = DataController.getInstance().GetWorkspaceList();
		model.addAttribute ("workspaceList", workspaceList);
		return "home/workSpace";
	}
	
	//프로젝트 생성
	@RequestMapping("/CreateProjectProcess.htm")
	public String createProject(String p_title,String explain, String etcStr, Model model)
	{
		String[] strArr = etcStr.split(",");
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = new Project_DTO();
		project.setWorkspace_id (DataController.getInstance().GetSelectWorkSpace().getWorkspace_id());
		project.setP_title(p_title);
		project.setExplain(explain);
		project.setP_admin(DataController.getInstance().GetUser().getUserid());
		//test깂
		project.setStart_date("2017-06-14");
		project.setEnd_date("2017-07-06");
		project.setAuthoriy("0");
		project.setP_state("0");
		project.setMark_f(0);
		project.setOpen_f(Integer.parseInt(strArr[0]));	//공개여부
		project.setEssence_f(Integer.parseInt(strArr[1])); //에센스프로젝트 유무
		taskDao.insertProject(project);
		
		DataController.getInstance().dataChangeProject();
		ArrayList<Project_DTO>projectList = DataController.getInstance().GetProjectList(); 
		model.addAttribute("projectList", projectList);
		return "home.main";
	}
	
}
