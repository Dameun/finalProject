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
import com.zestworld.AnalysisService.AnalysisService;
import com.zestworld.OutlineService.OutlineService;
import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
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

	public AjaxViewController() {
		System.out.println("AjaxViewController.AjaxViewController()");
	}
	

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
	public String calendar() {
		return DataController.getInstance().GetviewPath("calendar") + "calendar.jsp";
	}

	@RequestMapping(value = "/file.ajax", method = RequestMethod.GET)
	public String file() {
		return DataController.getInstance().GetviewPath("file") + "file.jsp";
	}
	

	//======================================================================================================================
/* CHART(ALL) */	
	//DATA 
	@Autowired
	private AnalysisService analysisService;
	//나에게 배정된 도넛차트_01
	int getTaskMe_comp;
	int getTaskMe_enddateLate;
	int getTaskMe_enddateNo;
	int getTaskMe_ing;
	//나에게 배정된 도넛차트_02
	int getTaskI_comp;
	int getTaskI_enddateLate;
	int getTaskI_enddateNo;
	int getTaskI_ing;
	//나에게 배정된 도넛차트_03
	int getTaskFollow_comp;
	int getTaskFollow_enddateLate;
	int getTaskFollow_enddateNo;
	int getTaskFollow_ing;
	//바차트
	List<Task_DTO> getTaskAllFlow_comp = new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_comp_count ;
	List<Task_DTO> getTaskAllFlow_enddateLate_count= new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_enddateNo_count= new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_ing_count= new ArrayList<Task_DTO>();
	 
	@RequestMapping(value="/analysis.ajax", method=RequestMethod.GET)
	public String analysis(Model model) throws ClassNotFoundException, SQLException
	{	
		
		String user_id = DataController.getInstance().GetUser().getUser_id(); 
		System.out.println("!! @@ user_id @@ !!"+ user_id);
		Task_DTO dto = new Task_DTO();
		Users_DTO dto2 = new Users_DTO();
		
		dto.setUser_id(user_id);
		donutChart_01(user_id);
		donutChart_02(user_id);
		donutChart_03(user_id);
		barChart();
		
		model.addAttribute("getTaskMe_comp", getTaskMe_comp);
		model.addAttribute("getTaskMe_enddateLate", getTaskMe_enddateLate);
		model.addAttribute("getTaskMe_enddateNo", getTaskMe_enddateNo);
		model.addAttribute("getTaskMe_ing", getTaskMe_ing);
		
		model.addAttribute("getTaskI_comp", getTaskI_comp);
		model.addAttribute("getTaskI_enddateLate", getTaskI_enddateLate);
		model.addAttribute("getTaskI_enddateNo", getTaskI_enddateNo);
		model.addAttribute("getTaskI_ing", getTaskI_ing);
		
		model.addAttribute("getTaskFollow_comp", getTaskFollow_comp);
		model.addAttribute("getTaskFollow_enddateLate", getTaskFollow_enddateLate);
		model.addAttribute("getTaskFollow_enddateNo", getTaskFollow_enddateNo);
		model.addAttribute("getTaskFollow_ing", getTaskFollow_ing);
		
		model.addAttribute("getTaskAllFlow_comp", getTaskAllFlow_comp );
		model.addAttribute("getTaskAllFlow_comp_count", getTaskAllFlow_comp_count);
		model.addAttribute("getTaskAllFlow_enddateLate_count", getTaskAllFlow_enddateLate_count);
		model.addAttribute("getTaskAllFlow_enddateNo_count", getTaskAllFlow_enddateNo_count);
		model.addAttribute("getTaskAllFlow_ing_count", getTaskAllFlow_ing_count);
		
		return DataController.getInstance().GetviewPath("analysis")+"analysis.jsp";
	}	
	
	private void donutChart_01(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
 
		getTaskMe_comp = analysisService.getTaskMe_comp(dto);
	    getTaskMe_enddateLate = analysisService.getTaskMe_enddateLate(dto);
		getTaskMe_enddateNo = analysisService.getTaskMe_enddateNo(dto);
		getTaskMe_ing = analysisService.getTaskMe_ing(dto);
	}
	
	private void donutChart_02(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
	
		 getTaskI_comp = analysisService.getTaskI_comp(dto);
		 getTaskI_enddateLate = analysisService.getTaskI_enddateLate(dto);
		 getTaskI_enddateNo = analysisService.getTaskI_enddateNo(dto);
		 getTaskI_ing = analysisService.getTaskI_ing(dto);
	}
	
	
	private void donutChart_03(String user_id) throws ClassNotFoundException, SQLException
	{
		 Task_DTO dto = new Task_DTO();
		 dto.setUser_id(user_id);
	
		 getTaskFollow_comp = analysisService.getTaskFollow_comp(dto);
		 getTaskFollow_enddateLate = analysisService.getTaskFollow_enddateLate(dto);
		 getTaskFollow_enddateNo = analysisService.getTaskFollow_enddateNo(dto);
		 getTaskFollow_ing = analysisService.getTaskFollow_ing(dto);
	}

	
	private void barChart()throws ClassNotFoundException, SQLException
	{
		getTaskAllFlow_comp = analysisService.getTaskAllFlow_comp();
		getTaskAllFlow_comp_count = analysisService.getTaskAllFlow_comp_count();
		
		getTaskAllFlow_enddateLate_count = analysisService.getTaskAllFlow_enddateLate_count();
		getTaskAllFlow_enddateNo_count = analysisService.getTaskAllFlow_enddateNo_count();
		getTaskAllFlow_ing_count = analysisService.getTaskAllFlow_ing_count();
	}
	
/* CHART(USER) */
	

	int getTaskMe_compU;
	int getTaskMe_enddateLateU;
	int getTaskMe_enddateNoU;
	int getTaskMe_ingU;
	//나에게 배정된 도넛차트_02
	int getTaskI_compU;
	int getTaskI_enddateLateU;
	int getTaskI_enddateNoU;
	int getTaskI_ingU;
	//나에게 배정된 도넛차트_03
	int getTaskFollow_compU;
	int getTaskFollow_enddateLateU;
	int getTaskFollow_enddateNoU;
	int getTaskFollow_ingU;
	//바차트
	List<Task_DTO> getTaskAllFlow_compU = new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_comp_countU ;
	List<Task_DTO> getTaskAllFlow_enddateLate_countU = new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_enddateNo_countU = new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_ing_countU = new ArrayList<Task_DTO>();	
	
	@RequestMapping(value="/analysisU.ajax", method=RequestMethod.GET)
	public String analysisU(Model model) throws ClassNotFoundException, SQLException
	{	
		
		String user_id = DataController.getInstance().GetUser().getUser_id(); 
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		System.out.println("!! @@ user_id @@ !!"+ user_id);
		Task_DTO dto = new Task_DTO();
		Users_DTO dto2 = new Users_DTO();
		
		dto.setUser_id(user_id);
		dto.setProject_id(project_id);
		
		donutChartU_01(user_id);
		donutChartU_02(user_id);
		donutChartU_03(user_id);
		barChartU();
		
		model.addAttribute("getTaskMe_compU", getTaskMe_compU);
		model.addAttribute("getTaskMe_enddateLateU", getTaskMe_enddateLateU);
		model.addAttribute("getTaskMe_enddateNoU", getTaskMe_enddateNoU);
		model.addAttribute("getTaskMe_ingU", getTaskMe_ingU);
		
		model.addAttribute("getTaskI_compU", getTaskI_compU);
		model.addAttribute("getTaskI_enddateLateU", getTaskI_enddateLateU);
		model.addAttribute("getTaskI_enddateNoU", getTaskI_enddateNoU);
		model.addAttribute("getTaskI_ingU", getTaskI_ingU);
		
		model.addAttribute("getTaskFollow_compU", getTaskFollow_compU);
		model.addAttribute("getTaskFollow_enddateLateU", getTaskFollow_enddateLateU);
		model.addAttribute("getTaskFollow_enddateNoU", getTaskFollow_enddateNoU);
		model.addAttribute("getTaskFollow_ingU", getTaskFollow_ingU);
		
		model.addAttribute("getTaskAllFlow_compU", getTaskAllFlow_compU );
		model.addAttribute("getTaskAllFlow_comp_countU", getTaskAllFlow_comp_countU);
		model.addAttribute("getTaskAllFlow_enddateLate_countU", getTaskAllFlow_enddateLate_countU);
		model.addAttribute("getTaskAllFlow_enddateNo_countU", getTaskAllFlow_enddateNo_countU);
		model.addAttribute("getTaskAllFlow_ing_countU", getTaskAllFlow_ing_countU);
		
		
		
		return DataController.getInstance().GetviewPath("analysis")+"analysis2.jsp";
	}	
	
	private void donutChartU_01(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
 		
		getTaskMe_compU = analysisService.getTaskMe_compU(dto);
	    getTaskMe_enddateLateU = analysisService.getTaskMe_enddateLateU(dto);
		getTaskMe_enddateNoU = analysisService.getTaskMe_enddateNoU(dto);
		getTaskMe_ingU = analysisService.getTaskMe_ingU(dto);
		
	}
	
	private void donutChartU_02(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
	
		 getTaskI_compU = analysisService.getTaskI_compU(dto);
		 getTaskI_enddateLateU = analysisService.getTaskI_enddateLateU(dto);
		 getTaskI_enddateNoU = analysisService.getTaskI_enddateNoU(dto);
		 getTaskI_ingU = analysisService.getTaskI_ingU(dto);		 
	}
	
	
	private void donutChartU_03(String user_id) throws ClassNotFoundException, SQLException
	{
		 Task_DTO dto = new Task_DTO();
		 dto.setUser_id(user_id);
		 
		 
		 getTaskFollow_compU = analysisService.getTaskFollow_compU(dto);
		 getTaskFollow_enddateLateU = analysisService.getTaskFollow_enddateLateU(dto);
		 getTaskFollow_enddateNoU = analysisService.getTaskFollow_enddateNoU(dto);
		 getTaskFollow_ingU = analysisService.getTaskFollow_ingU(dto);
		 
	}

	
	private void barChartU()throws ClassNotFoundException, SQLException
	{
		
		getTaskAllFlow_compU = analysisService.getTaskAllFlow_compU();
		getTaskAllFlow_comp_countU = analysisService.getTaskAllFlow_comp_countU();
		
		getTaskAllFlow_enddateLate_countU = analysisService.getTaskAllFlow_enddateLate_countU();
		getTaskAllFlow_enddateNo_countU = analysisService.getTaskAllFlow_enddateNo_countU();
		getTaskAllFlow_ing_countU = analysisService.getTaskAllFlow_ing_countU();		
		
	}
	
	
	///////////////////////////
	
	
	
	

	
	@RequestMapping(value = "/template.ajax", method = RequestMethod.GET)
	public String template() {
		return DataController.getInstance().GetviewPath("template") + "template.jsp";
	}


	@RequestMapping(value = "/projectMain.ajax", method = RequestMethod.GET)
	public String projectMain(Model model) {
		List<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		List<Project_DTO> projectUserList = new ArrayList<Project_DTO>();
		int projectid =0;
		IProjectDAO projectDao = sqlsession.getMapper(IProjectDAO.class);
		
		for( int i =0; i <projectList.size(); i++)
		{
			System.out.println("projectList : "+i+"    " +projectList.get(i).getProject_id());
			projectid = projectList.get(i).getProject_id();
			projectList.get(i).setProjectMember(projectDao.projectMemberList(projectid));
		}
		
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
		return DataController.getInstance().GetviewPath("home") + "projectMain.jsp";
	}
	
	
	@RequestMapping(value = "/totalTask.ajax", method = RequestMethod.GET)
	public String totalTask(Model model) throws ClassNotFoundException, SQLException {
		// List<Project_DTO> projectlist= service.projectlist();
		
		int workspace_id=DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		List<Project_DTO> list = service.projectlist(workspace_id);
		System.out.println("AJAC: "+ workspace_id);
		List<Workspace_DTO> assign = service.writerlist(workspace_id);

		model.addAttribute("projectlist", list); // 자동 forward
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
		project.setExplain(explain);
		project.setP_admin(DataController.getInstance().GetUser().getUser_id());
		// test
		project.setStart_date("2017-06-14");
		project.setEnd_date("2017-07-06");
		project.setAUTHORITY("0");
		project.setP_state("0");
		project.setMark_f(0);
		project.setOpen_f(Integer.parseInt(etcStr)); // 怨듦컻�뿬遺�
		project.setEssence_f(0); // �뿉�꽱�뒪�봽濡쒖젥�듃 �쑀臾�
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
		userState.setWorkspace_id(DataController.getInstance().GetSelectWorkSpace().getWorkspace_id());
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
		project.setExplain(editExplain);
		
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
		//체크리스트 지움
		//테스크 지움
		taskDao.deleteTaskByProjectid(project);
		//프로젝트 지움 
		taskDao.deleteProject(project);
		DataController.getInstance().dataChangeProject();
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}

}
