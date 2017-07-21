package com.zestworld.AjaxController;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.zestworld.OutlineService.OutlineService;
import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.taskListDAO.taskListDao;
import com.zestworld.userStateService.UserStateService;
import com.zestworld.util.DataController;

/*
 * @FileName : AjaxController.java
 * @Project : ZestWorld
 * @Date : 2017.06.18
 * @Author : 장윤희
 * @Desc : 비동기 페이지 처리 
 * */
@Controller
public class AjaxViewController {

	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private OutlineService service;
	@Autowired
	private UserStateService userstatesService;
	
	@RequestMapping(value = "/CreateDefineEssence.ajax", method = RequestMethod.GET)
	public String createDefineEssence() {
		return DataController.getInstance().GetviewPath("essence") + "defineEssence.jsp";
	}
	
	@RequestMapping(value = "/CreateEssence.ajax", method = RequestMethod.GET)
	public String createEssence() {
		return DataController.getInstance().GetviewPath("essence") + "CreateEssence.jsp";
	}
	
	@RequestMapping(value = "/Createproject.ajax", method = RequestMethod.GET)
	public String createProject() {
		return DataController.getInstance().GetviewPath("home") + "CreateProject.jsp";
	}
	@RequestMapping(value="/Developers.ajax",method = RequestMethod.GET)
	public String developers(){
		return DataController.getInstance().GetviewPath("home")+"Developers.jsp";
	}

	@RequestMapping(value = "/addWorkspace.ajax", method = RequestMethod.GET)
	public String addWorkspace() {
		return DataController.getInstance().GetviewPath("home") + "CreateWorkspace.jsp";
	}
	
	@RequestMapping(value = "/joinEdit.ajax", method = RequestMethod.GET)
	public String joinEdit(Model model) {
		Users_DTO users = DataController.getInstance().GetUser();
		model.addAttribute("member", users);
		return DataController.getInstance().GetviewPath("home") + "joinEdit.jsp";
	}
	
	@RequestMapping(value = "/memberCard.ajax", method = RequestMethod.GET)
	public String memberCard(Model model) {
		Users_DTO users = DataController.getInstance().GetUser();
		model.addAttribute("member", users);
		return DataController.getInstance().GetviewPath("home") + "memberCard.jsp";
	}
	
	@RequestMapping(value = "/taskList.ajax", method = RequestMethod.GET)
	public String totalList(Model model) throws ClassNotFoundException, SQLException {
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		List<Category_DTO> list = service.tasklist(cateDto); 
		model.addAttribute("list",list);
		return DataController.getInstance().GetviewPath("totalTesk") + "taskList.jsp";
	}

	@RequestMapping(value = "/wSpace.ajax", method = RequestMethod.GET)
	public String wSpace() {
		return DataController.getInstance().GetviewPath("totalTesk") + "workSpace.jsp";
	}

	
	@RequestMapping(value = "/member.ajax", method = RequestMethod.GET)
	public String member() {
		return DataController.getInstance().GetviewPath("memberAdministration") + "member.jsp";
	}

	
	@RequestMapping(value = "/chat.ajax", method = RequestMethod.GET)
	public String chat() {
		return DataController.getInstance().GetviewPath("chat") + "chatting.jsp";
	}

	
	@RequestMapping(value = "/calendar.ajax", method = RequestMethod.GET)
	public String calendar(Model model) throws ClassNotFoundException, SQLException {
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Category_DTO> list = dao.tasklist(cateDto);
		model.addAttribute("list",list);
		return DataController.getInstance().GetviewPath("calendar") + "calendar.jsp";
	}

	
	@RequestMapping(value = "/file.ajax", method = RequestMethod.GET)
	public String file() {
		return DataController.getInstance().GetviewPath("file") + "file.jsp";
	}
	
	
	@RequestMapping(value = "/template.ajax", method = RequestMethod.GET)
	public String template() {
		return DataController.getInstance().GetviewPath("template") + "template.jsp";
	}


	@RequestMapping(value = "/projectMain.ajax", method = RequestMethod.GET)
	public String projectMain(Model model) {
		List<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		ArrayList<Project_DTO> projectUserList = new ArrayList<Project_DTO>();
		int projectid =0;
		IProjectDAO projectDao = sqlsession.getMapper(IProjectDAO.class);
		
		for( int i =0; i <projectList.size(); i++)
		{
			System.out.println("projectList : "+i+"    " +projectList.get(i).getProject_id());
			projectid = projectList.get(i).getProject_id();
			projectList.get(i).setProjectMember(projectDao.projectMemberList(projectid));
		}
		
		//현재 배정 리스트 정렬
		int memberCheck = 0;
		for( int j=0; j <projectList.size(); j++ )
		{
			List<Project_user_DTO> projectmemberList  = projectList.get(j).getProjectMember();
			for( int k=0; k<projectmemberList.size(); k++)
			{
				Project_user_DTO user = projectmemberList.get(k);
				if( user.getUser_id().equals(DataController.getInstance().GetUser().getUser_id()))
				{
					memberCheck++;
				}
			}
			
			if(memberCheck>0)
			{
				projectUserList.add( projectList.get(j) );
			}
			memberCheck = 0;
		}
		
		model.addAttribute("projectList",  projectUserList);
		DataController.getInstance().SetProjectList(projectUserList);
		return DataController.getInstance().GetviewPath("home") + "projectMain.jsp";
	}
	
	//전체업무
	@RequestMapping(value = "/totalTask.ajax", method = RequestMethod.GET)
	public String totalTask(Model model) throws ClassNotFoundException, SQLException {
		int workspace_id=DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		List<Project_DTO> list = DataController.getInstance().GetProjectList(); 
		//List<Project_DTO> list = service.projectlist(workspace_id);
		List<Project_DTO> projectList = new ArrayList<Project_DTO>();
		List<Project_DTO> essenceList = new ArrayList<Project_DTO>();
		int pcount=0;
		int ecount=0;
		for(int i=0;i<list.size();i++){
			if(list.get(i).getEssence_f()==0){
				Project_DTO projectDto= new Project_DTO();
				projectDto.setProject_id(list.get(i).getProject_id());
				projectDto.setP_title(list.get(i).getP_title());
				projectList.add(pcount, projectDto);
				pcount++;
			}else{
				Project_DTO projectDto= new Project_DTO();
				projectDto.setProject_id(list.get(i).getProject_id());
				projectDto.setP_title(list.get(i).getP_title());
				essenceList.add(ecount, projectDto);
				ecount++;
			}
			
		}
		List<Project_DTO> elist = service.essencelist(workspace_id);
		System.out.println("AJAC: "+ workspace_id);
		List<Workspace_DTO> assign = service.writerlist(workspace_id);
/*		model.addAttribute("projectlist", list); // 자동 forward
		model.addAttribute("essencelist", elist); // 자동 forward
		model.addAttribute("assign", assign); // 자동 forward
*/		
		model.addAttribute("projectlist", projectList); // 자동 forward
		model.addAttribute("essencelist", essenceList); // 자동 forward
		model.addAttribute("assign", assign); // 자동 forward
		System.out.println("LIST: " + list.size());

		return DataController.getInstance().GetviewPath("totalTesk") + "totalTask.jsp";
	}

	
	//프로젝트 선택시
	@RequestMapping(value = "/selectProject.ajax", method = RequestMethod.GET)
	public String selectProject(String project_id) {
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO currentProject = taskDao.GetProject(project_id);
		DataController.getInstance().SetCurrentProject(currentProject);
		return "";
	}

	
	//프로젝트 생성시
	@RequestMapping(value = "/CreateProjectProcess.ajax", method = RequestMethod.GET)
	public String createProject(String p_title, String explain, String etcStr, Model model) {
		String user_id = DataController.getInstance().GetUser().getUser_id();

		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = new Project_DTO();
		project.setWorkspace_id(DataController.getInstance().GetSelectWorkSpace().getWorkspace_id());
		project.setP_title(p_title);
		project.setDescription(explain);
		project.setP_admin(DataController.getInstance().GetUser().getUser_id());
		// test
		project.setStart_date("2017-06-14");
		project.setEnd_date("2017-07-06");
		project.setAUTHORITY("0");
		project.setP_state("0");
		project.setMark_f(0);
		project.setOpen_f(Integer.parseInt(etcStr)); 
		project.setEssence_f(0); 
		taskDao.insertProject(project);

		Project_DTO projectNew = taskDao.GetProjectByname(project);
		Project_user_DTO projectUsers = new Project_user_DTO();
		projectUsers.setProject_id(projectNew.getProject_id());
		projectUsers.setUser_id(user_id);
		taskDao.InsertProjectUsers(projectUsers);

		DataController.getInstance().dataChangeProject();
		ArrayList<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		model.addAttribute("projectList", projectList);
		return DataController.getInstance().GetviewPath("home") + "CreateProject.jsp";
	}

	
	//유져 상태 변경시
	@RequestMapping(value = "/userState.ajax", method = RequestMethod.GET)
	public String userStateUpdate(String state) {
		
		String Str = "";
		if( state.equals("01")) Str = "업무중";
		if( state.equals("02")) Str = "외출중";
		if( state.equals("03")) Str = "회의중";
		if( state.equals("04")) Str = "식사중";
		
		UserState_DTO userState = new UserState_DTO();
		userState.setUser_id(DataController.getInstance().GetUser().getUser_id());
		userState.setState(Str);
		userstatesService.UpdateUserState(userState);
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	
	
	//프로젝트 수정시 
	@RequestMapping(value = "/projectEdit.ajax", method = RequestMethod.GET)
	public String projectEdit(String project_id, String editTitle, String editExplain) 
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = taskDao.GetProject(project_id);
		project.setP_title(editTitle);
		project.setDescription(editExplain);
		
		taskDao.updateProject(project);
		 DataController.getInstance().dataChangeProject();
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	
	
	//프로젝트 삭제시
	@RequestMapping(value = "/projectDelete.ajax", method = RequestMethod.GET)
	public String projectDelete(String project_id) 
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = taskDao.GetProject(project_id);
		taskDao.deleteTaskByProjectid(project);
		taskDao.deleteProject(project);
		DataController.getInstance().dataChangeProject();
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	

	//워크 스페이스 수정시 
	@RequestMapping(value = "/workspacdEdit.ajax", method = RequestMethod.GET)
	public String workspacdEdit(String workSpace_id, String workSpaceTitle, String workSpaceExplain) 
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Workspace_DTO workspace = taskDao.GetWorkSpace(Integer.parseInt(workSpace_id));
		workspace.setWorkspace_name(workSpaceTitle);
		workspace.setDescription(workSpaceExplain);
		taskDao.updateWorkspace(workspace);
		DataController.getInstance().dataChange();
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	
	//워크 스페이스 삭제시 
	@RequestMapping(value = "/workspaceDelete.ajax", method = RequestMethod.GET)
	public String deleteWorkspace(int workSpace_id) 
	{
		System.out.println("deleteWorkspaceEnter");
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		List<Project_DTO> projectList = taskDao.GetProjectList(workSpace_id);
		for( int i=0; i<projectList.size(); i++)
		{
			taskDao.deleteTaskByProjectid(projectList.get(i));	//task 지움
			taskDao.deleteProject(projectList.get(i));			//프로젝트 지움
		}

		taskDao.deleteWorkspace(workSpace_id);
		List<WorkspaceUser_DTO> list = taskDao.GetWorkSpaceMember(workSpace_id);
		for( int j=0; j<list.size(); j++ )
		{
			WorkspaceUser_DTO user= list.get(j);
			taskDao.deleteWorkspaceUsers(user);
		}
		
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}

}
