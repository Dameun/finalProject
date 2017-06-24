package com.zestworld.taskListController;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.taskListDAO.taskListDao;
import com.zestworld.taskListService.taskListService;
import com.zestworld.util.DataController;

@Controller
public class taskListController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private taskListService service;
	
	@RequestMapping("titleInsert.htm")
	public String titleInsert(String title,Model model) throws ClassNotFoundException, SQLException{
		
		Category_DTO cateDto = new Category_DTO();
		cateDto.setTitle(title);
		//int project_id = DataController.getInstance().getCurrentProject().getProject_id();

		System.out.println("타이틀 : " + title);
		
		service.titleInsert(cateDto);
		
		/*int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		System.out.println("선택한 project_id : "+ project_id);	
		cateDto.setProject_id(project_id);
		*/
		System.out.println("insert성공함");
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	
	@RequestMapping("tasktitleInsert.htm")
	public String tasktitleInsert(String title, String cateTitle,Model model) throws ClassNotFoundException, SQLException{
		
		System.out.println("tasktitleInsert.htm 접근성공");
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		Category_DTO cateDto = new Category_DTO();
		Task_DTO task = new Task_DTO();
		
		cateDto.setTitle(cateTitle);
		task.setTitle(title);

		
		System.out.println("카테고리 타이틀 : " + cateTitle);
		System.out.println("타이틀 : " + title);
		
		//String userid = dao.getUser_Id();
		int category_id = dao.getCategory_Id(cateDto);
	
		String userid = DataController.getInstance().GetUser().getUser_id();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		
		System.out.println("유저아이디 : " + userid);
		System.out.println("카테고리 아이디: " + category_id);
		System.out.println("프로젝트 ID : " + project_id);
		System.out.println("워크스페이스 아이디: " + workspace_id);
	
		task.setCategory_id(category_id);
		task.setUser_id(userid);
		task.setProject_id(project_id);
		task.setWorkspace_id(workspace_id);
		
		service.tasktitleInsert(task);
		
		cateDto.setProject_id(project_id);
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	
	@RequestMapping(value="taskList.htm", method=RequestMethod.GET)
	   public String taskList(Model model) throws ClassNotFoundException, SQLException{
		System.out.println("컨트롤러 taskList.htm 접근성공");
		
		
		return "task.taskList";
	      
	   }
	
	@RequestMapping("taskLists.htm")
	public String taskLists(Model model) throws ClassNotFoundException, SQLException{
		
		System.out.println("컨트롤러 taskLists.htm 접근성공");
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		System.out.println("선택한 project_id : "+ project_id);	
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	
	}
	
	
	@RequestMapping("deleteTaskList.htm")
	public String delete(String title , Model model) throws ClassNotFoundException, SQLException{
		
		System.out.println("제목 : " + title);
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		Category_DTO cateDto = new Category_DTO();

		cateDto.setTitle(title);
		
	
		int category_id = dao.getCategory_Id(cateDto);
		
		System.out.println("카테고리 ID : "+ category_id);
		
		dao.tasktitleDelete(category_id);
		dao.catetitleDelete(cateDto);

		
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		System.out.println("선택한 project_id : "+ project_id);	
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	}

	
	@RequestMapping("tasktitleCheck.htm")
	public String tasktitleCheck(String task_id,Model model) throws ClassNotFoundException, SQLException{
		
		
		Task_DTO taskDto = new Task_DTO();
		int taskid = Integer.parseInt(task_id);
		taskDto.setTask_id(taskid);
		System.out.println("선택한 업무타이틀 : "+taskDto.getTitle());
		int result = service.tasktitleCheck(taskDto);
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		System.out.println("선택한 project_id : "+ project_id);	
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	}
	
	@RequestMapping("cateUpdate.htm")
	public String cateUpdate(String category_id, String changeTitle,Model model)throws ClassNotFoundException, SQLException{
		
		int cate_id = Integer.parseInt(category_id);
		
		System.out.println("category_id : "+cate_id);
		
		System.out.println("changeTitle : "+changeTitle);
		
		Category_DTO cateDto = new Category_DTO();
		
		cateDto.setCategory_id(cate_id);
		cateDto.setTitle(changeTitle);
		
		service.categoryUpdate(cateDto);
		
		System.out.println("바뀐 타이틀 : " +cateDto.getTitle());
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	
	@RequestMapping(value="detailtaskModal.htm", method=RequestMethod.GET)
	public View detailTask(String task_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("detailmodal*****: " + task_id);
		Task_DTO result= service.detailtask(task_id);
		
		model.addAttribute("detail", result);
 
		return jsonview;
		
	}
	
	@RequestMapping(value="detailtaskModalCheckList.htm", method=RequestMethod.GET)
	public String detailModalCheckList(int task_id, Model model) throws ClassNotFoundException, SQLException{

		List<CheckList_DTO> chklist= service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
		
		return "/task/checkList";
		
	}
	@RequestMapping(value="detailtaskUpdate.htm", method=RequestMethod.GET)
	public String detailUpdate(int task_id,String start,String end,String member, String explain,Model model) throws ClassNotFoundException, SQLException{

		Task_DTO dto= new Task_DTO();
		

		String user_id = DataController.getInstance().getCurrentWorkspace().getUser_id();
		dto.setFollower(user_id);
		dto.setTask_id(task_id);
		dto.setStart_date(start);
		dto.setEnd_date(end);
		dto.setMember(member);
		dto.setExplain(explain);
		
		int result=service.detailUpdate(dto);

		System.out.println("detailUpdate진입:   "+start);
		
		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
 
		return "/task/taskLists";
		
	}
	
	@RequestMapping(value="checklistReg.htm", method=RequestMethod.GET)
	public String checkListReg(int task_id,String contents,Model model) throws ClassNotFoundException, SQLException{
		
		System.out.println("checkList : " +task_id);
		System.out.println("checkList : " +contents);
		
		CheckList_DTO dto= new CheckList_DTO();
		dto.setContents(contents);
		dto.setTask_id(task_id);
		int result=service.checkListReg(dto);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	@RequestMapping(value="updateChklistFlag.htm", method=RequestMethod.GET)
	public String updateChkFlag(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlag(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	@RequestMapping(value="detailtaskDelete.htm", method=RequestMethod.GET)
	public String detailDelete(int task_id,Model model) throws ClassNotFoundException, SQLException{

		
		int result=service.detailDelete(task_id);
		System.out.println("0아니면 delete 성공.. 결과는? " +result);
		
		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "/task/taskLists";
		
	}
	
	@RequestMapping(value="updateSuccess.htm", method=RequestMethod.GET)
	public String updateFlag(String task_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("updateFlag*****: " + task_id);
		service.updateFlag(task_id);

		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "/task/taskLists";
		
	}
	
	@RequestMapping(value="updateSuccessZero.htm", method=RequestMethod.GET)
	public String updateFlagZero(String task_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("updateFlagZero*****: " + task_id);
		service.updateFlagZero(task_id);
		
		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "/task/taskLists";
	}
	
	//체크리스 삭제
	@RequestMapping(value="chkListDelete.htm", method=RequestMethod.GET)
	public String checkListDelete(int task_id,int check_id,Model model) throws ClassNotFoundException, SQLException{
		System.out.println("checklist");
		int result=service.checkListDelete(check_id);
		System.out.println("checklist delete");
		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	
/*	@RequestMapping(value="updateChkFlagZero.htm", method=RequestMethod.GET)
	public View assignMemberList(int project_id, Model model) throws ClassNotFoundException, SQLException{
		List<Users_DTO> assignmember=service.assignMemberList(project_id);

		model.addAttribute("assignmember", assignmember);
 
		return jsonview;
		
	}*/
	
	/*@RequestMapping(value="updateChkFlagZero.htm", method=RequestMethod.GET)
	public String assignMemberReg(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlagZero(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}*/
}
	
}
