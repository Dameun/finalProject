package com.zestworld.ajaxController;

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
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.util.DataController;

/*
2017-06-14 yoonhee
전체 화면 비동기 처리
@RequestMapping(xxx.ajax)
return xxx.jsp
*/
@Controller
public class AjaxViewController {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private OutlineService service;

	public AjaxViewController() {
	}

	@RequestMapping(value = "/Createproject.ajax", method = RequestMethod.GET)
	public String CreateProject() {
		return DataController.getInstance().GetviewPath("home") + "CreateProject.jsp";
	}

	@RequestMapping(value = "/addWorkspace.ajax", method = RequestMethod.GET)
	public String addWorkspace() {
		return DataController.getInstance().GetviewPath("home") + "CreateWorkspace.jsp";
	}

	// mainContentView
	@RequestMapping(value = "/totalTask.ajax", method = RequestMethod.GET)
	public String totalTask(Model model) throws ClassNotFoundException, SQLException {
		// List<Project_DTO> projectlist= service.projectlist();
		List<Project_DTO> list = service.projectlist();
		String workspace_id = "1";
		List<Workspace_DTO> assign = service.writerlist(workspace_id);

		// ModelAndView mav = new ModelAndView("totalTask.jsp");
		model.addAttribute("projectlist", list); // 자동 forward
		model.addAttribute("assign", assign); // 자동 forward
		System.out.println("LIST: " + list.size());
		/*
		 * String workspaceid = DataController.getInstance().getCu
		 */
		return DataController.getInstance().GetviewPath("totalTesk") + "totalTask.jsp";
	}

	// mainContentView
	@RequestMapping(value = "/taskList.ajax", method = RequestMethod.GET)
	public String totalList() {
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

	@RequestMapping(value = "/analysis.ajax", method = RequestMethod.GET)
	public String analysis() {
		return DataController.getInstance().GetviewPath("analysis") + "analysis.jsp";
	}

	@RequestMapping(value = "/template.ajax", method = RequestMethod.GET)
	public String template() {
		return DataController.getInstance().GetviewPath("template") + "template.jsp";
	}

	@RequestMapping(value = "/projectMain.ajax", method = RequestMethod.GET)
	public String projectMain(Model model) {
		model.addAttribute("projectList", DataController.getInstance().GetProjectList());
		return DataController.getInstance().GetviewPath("home") + "projectMain.jsp";
	}

	// 회원정보 수정
	@RequestMapping(value = "/joinEdit.ajax", method = RequestMethod.GET)
	public String GetUser(Model model) throws ClassNotFoundException, SQLException {

		Users_DTO users = DataController.getInstance().GetUser();
		model.addAttribute("member", users);

		return DataController.getInstance().GetviewPath("home") + "joinEdit.jsp";
	}

	// 프로젝트 선택시
	@RequestMapping(value = "/selectProject.ajax", method = RequestMethod.GET)
	public String selectProject(String project_id) {
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO currentProject = taskDao.GetProject(project_id);
		DataController.getInstance().SetCurrentProject(currentProject);
		return "";
	}

	@RequestMapping(value = "/CreateProjectProcess.ajax", method = RequestMethod.GET)
	public String createProject(String p_title, String explain, String etcStr, Model model) {
		String user_id = DataController.getInstance().GetUser().getUser_id();
		String[] strArr = etcStr.split(",");
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = new Project_DTO();
		project.setWorkspace_id(DataController.getInstance().GetSelectWorkSpace().getWorkspace_id());

		project.setP_title(p_title);
		project.setExplain(explain);
		project.setP_admin(DataController.getInstance().GetUser().getUser_id());
		// test源�
		project.setStart_date("2017-06-14");
		project.setEnd_date("2017-07-06");
		project.setAUTHORITY("0");
		project.setP_state("0");
		project.setMark_f(0);
		project.setOpen_f(Integer.parseInt(strArr[0])); // 怨듦컻�뿬遺�
		project.setEssence_f(Integer.parseInt(strArr[1])); // �뿉�꽱�뒪�봽濡쒖젥�듃 �쑀臾�
		taskDao.insertProject(project);

		Project_DTO projectNew = taskDao.GetProjectByname(project);
		Project_user_DTO projectUsers = new Project_user_DTO();
		projectUsers.setProject_id(projectNew.getProject_id());
		projectUsers.setUser_id(user_id);
		projectUsers.setWorkspace_id(DataController.getInstance().getCurrentWorkspace().getWorkspace_id());
		taskDao.InsertProjectUsers(projectUsers);

		DataController.getInstance().dataChangeProject();
		ArrayList<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		model.addAttribute("projectList", projectList);
		return DataController.getInstance().GetviewPath("home") + "CreateProject.jsp";
	}

}
