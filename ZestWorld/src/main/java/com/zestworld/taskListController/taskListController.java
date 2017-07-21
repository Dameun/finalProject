package com.zestworld.taskListController;

import java.sql.SQLException;
import java.util.ArrayList;
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
import com.zestworld.Table_DTO.TaskAssignMember_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.taskListDAO.taskListDao;
import com.zestworld.taskListService.taskListService;
import com.zestworld.util.DataController;

/*
 * @FileName : taskListController.java
 * @Project : ZestWorld
 * @Date : 2017.07.01
 * @Author : 김민성
 * @Desc : 업무리스트 페이지 처리부분
 * 
 */

@Controller
public class taskListController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private taskListService service;
	
	
	//카테고리 타이틀 추가
	@RequestMapping("titleInsert.htm")
	public String titleInsert(String title,Model model) throws ClassNotFoundException, SQLException{
		
		Category_DTO cateDto = new Category_DTO();
		cateDto.setTitle(title);
		
		service.titleInsert(cateDto);
		
	
	
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	
	//업무 추가
	@RequestMapping("tasktitleInsert.htm")
	public String tasktitleInsert(String title, int cateId,Model model) throws ClassNotFoundException, SQLException{
		
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		Task_DTO task = new Task_DTO();
		Category_DTO cateDto =  new Category_DTO();
		task.setTitle(title);

		String userid = DataController.getInstance().GetUser().getUser_id();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
	
		task.setCategory_id(cateId);
		task.setUser_id(userid);
		task.setProject_id(project_id);
		task.setWorkspace_id(workspace_id);
		task.setEssence("0");
		service.tasktitleInsert(task);
		task.setFollower(userid);
		
		cateDto.setProject_id(project_id);
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	
	//업무페이지 이동
	@RequestMapping(value="taskList.htm", method=RequestMethod.GET)
	   public String taskList(Model model) throws ClassNotFoundException, SQLException{
		
		return "task.taskList";
	      
	   }
	
	//비동기 리스트
	@RequestMapping("taskLists.htm")
	public String taskLists(Model model) throws ClassNotFoundException, SQLException{
		
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();	
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	
	}
	
	//업무리스트 삭제
	@RequestMapping("deleteTaskList.htm")
	public String delete(int cateId , Model model) throws ClassNotFoundException, SQLException{
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		
		Category_DTO cateDto = new Category_DTO();

		cateDto.setCategory_id(cateId);
	
		dao.tasktitleDelete(cateId);
		dao.catetitleDelete(cateDto);

		
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	}

	//업무 완료여부
	@RequestMapping("tasktitleCheck.htm")
	public String tasktitleCheck(String task_id,Model model) throws ClassNotFoundException, SQLException{
		
		
		Task_DTO taskDto = new Task_DTO();
		int taskid = Integer.parseInt(task_id);
		taskDto.setTask_id(taskid);
		int result = service.tasktitleCheck(taskDto);
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
	}
	
	//카테고리 타이틀 변경
	@RequestMapping("cateUpdate.htm")
	public String cateUpdate(String category_id, String changeTitle,Model model)throws ClassNotFoundException, SQLException{
		
		int cate_id = Integer.parseInt(category_id);
		Category_DTO cateDto = new Category_DTO();
		
		cateDto.setCategory_id(cate_id);
		cateDto.setTitle(changeTitle);
		
		service.categoryUpdate(cateDto);
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/task/taskLists";
		
	}
	//상세업무 modal 
	@RequestMapping(value="detailtaskModal.htm", method=RequestMethod.GET)
	public View detailTask(String task_id,int project_id,Model model) throws ClassNotFoundException, SQLException{
		
		Task_DTO result= service.detailTask(task_id);
		List<Users_DTO> assignmember=service.assignMemberList(project_id);

		model.addAttribute("detail", result);
		
		return jsonview;
		
	}
	
	//체크리스트  리스트 출력
	@RequestMapping(value="detailtaskModalCheckList.htm", method=RequestMethod.GET)
	public String detailModalCheckList(int task_id, Model model) throws ClassNotFoundException, SQLException{

		List<CheckList_DTO> chklist= service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
		
		return "/task/checkList";
		
	}
	
	//상세업무 수정
	@RequestMapping(value="detailtaskUpdate.htm", method=RequestMethod.GET)
	public String detailUpdate(int task_id,String start,String end, String follower,String member, String explain,Model model) throws ClassNotFoundException, SQLException{

		Task_DTO dto= new Task_DTO();
		

		
		dto.setFollower(follower);
		dto.setTask_id(task_id);
		dto.setStart_date(start);
		dto.setEnd_date(end);
		dto.setMember(member);
		
		dto.setDescription(explain);
		
		
		int result=service.detailUpdate(dto);

		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
 
		return "/task/taskLists";
		
	}
	
	//체크리스트 등록
	@RequestMapping(value="checklistReg.htm", method=RequestMethod.GET)
	public String checkListReg(int task_id,String contents,Model model) throws ClassNotFoundException, SQLException{
		
		
		CheckList_DTO dto= new CheckList_DTO();
		dto.setContents(contents);
		dto.setTask_id(task_id);
		int result=service.checkListReg(dto);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	//체크리스트 변경
	@RequestMapping(value="updateChklistFlag.htm", method=RequestMethod.GET)
	public String updateChklistFlag(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlag(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	//업무 삭제
	@RequestMapping(value="detailtaskDelete.htm", method=RequestMethod.GET)
	public String detailDelete(int task_id,Model model) throws ClassNotFoundException, SQLException{

		
		int result=service.detailDelete(task_id);
		
		Category_DTO cateDto = new Category_DTO();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		cateDto.setProject_id(project_id);
		
		List<Category_DTO> list = service.tasklist(cateDto);
		List<Task_DTO> list2 = service.tasklist2();
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "/task/taskLists";
		
	}
	
	//업무 완료
	@RequestMapping(value="updateSuccess.htm", method=RequestMethod.GET)
	public String updateFlag(String task_id, Model model) throws ClassNotFoundException, SQLException{
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
	
	//업무완료 해제 
	@RequestMapping(value="updateSuccessZero.htm", method=RequestMethod.GET)
	public String updateFlagZero(String task_id, Model model) throws ClassNotFoundException, SQLException{
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
	
	//체크리스트 삭제
	@RequestMapping(value="chkListDelete.htm", method=RequestMethod.GET)
	public String checkListDelete(int task_id,int check_id,Model model) throws ClassNotFoundException, SQLException{
		int result=service.checkListDelete(check_id);
		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
	}	
	
	//배정된멤버 리스트
	@RequestMapping(value="taskMemberListCheck1.htm", method=RequestMethod.GET)
	public View taskMemberListCheck(int project_id , Model model) throws ClassNotFoundException, SQLException{
		
		List<Users_DTO> member=service.assignMemberList(project_id);
		model.addAttribute("assignmember", member);		
		
		return jsonview;
	}
	
	//배정된멤버 등록
	@RequestMapping(value="TaskAssign.htm", method=RequestMethod.GET)
	public View taskAssign(String[] checkboxValues,int taskid,Model model) throws ClassNotFoundException, SQLException{
		
		String send = "";
		TaskAssignMember_DTO dto = new TaskAssignMember_DTO();
		for (int i = 0; i < checkboxValues.length; i++) {
			dto.setUser_id(checkboxValues[i]);
			dto.setTask_id(taskid);
			int result2 = service.assignMemberReg(dto);
		}
		send = DataController.getInstance().GetUser().getUser_id();
		model.addAttribute("send", send);
		return jsonview;
		
	}
		

	//업무 배정인원
	@RequestMapping(value="detailAssign.htm", method=RequestMethod.GET)
	public String taskMemberList(int task_id, int project_id, Model model) throws ClassNotFoundException, SQLException{

		List<TaskAssignMember_DTO> assignmember=service.taskMemberList(task_id);
		model.addAttribute("assignmember", assignmember);		
		
		return "/task/taskassignMember";
	}
	
	
	//업무 완료여부체크
	@RequestMapping(value="updateChkFlag_Zero.htm", method=RequestMethod.GET)
	public String updateChkFlagZero(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlagZero(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	//배정된맴버 삭제
	@RequestMapping(value="deleteAssignMember.htm", method=RequestMethod.GET)
	public View deleteTaskMember(String memberId,int taskId,Model model) throws ClassNotFoundException, SQLException{
		
		TaskAssignMember_DTO dto = new TaskAssignMember_DTO();
		
		dto.setTask_id(taskId);
		dto.setUser_id(memberId);
		int result=service.deleteTaskMember(dto);
		
		String userid=DataController.getInstance().GetUser().getUser_id();
		model.addAttribute("userid", userid);
	
		
		return jsonview;
		
	}
	
	//배정된맴버 완료여부
	@RequestMapping(value="taskMemberCheck.htm", method=RequestMethod.GET)
	public View taskMemberListChk(int project_id, int task_id, Model model) throws ClassNotFoundException, SQLException{

		List<String> projectMember= new ArrayList<String>();
		List<String> projectAssignmember = new ArrayList<String>();
		List<String> resultList = new ArrayList<String>();
		List<Users_DTO> member = service.assignMemberList(project_id); //프로젝트 멤버
		List<TaskAssignMember_DTO> assignmember = service.taskMemberList(task_id); 
 		
		int count = 0;
		int k = 0;
		
		//프로젝트 멤버
		for (int i = 0; i < member.size(); i++) {
			projectMember.add(i, member.get(i).getUser_id());
		
		}
		
		if(assignmember.size()==0){
			for (int i = 0; i < member.size(); i++) {
				resultList.add(i, member.get(i).getUser_id());
			}
		}else{
			//배정된멤버
			for (int i = 0; i < assignmember.size(); i++) {
				projectAssignmember.add(i, assignmember.get(i).getUser_id());			
			}
	
			for (int i = 0; i < projectMember.size(); i++) {
				count=0;
				for (int j = 0; j < projectAssignmember.size(); j++) {
					if (projectMember.get(i).equals(projectAssignmember.get(j))) {
						count++;
						
					}
				}
				if (count == 0) {
					resultList.add(k, projectMember.get(i));
					if(resultList.size()!=0){
					}
					k++;
				}
			}
		}
		model.addAttribute("assignmember", resultList);
	
		
		return jsonview;
	}
	
	
	
	//카테고리 타이틀 수정시 타이틀 정보 받아오는 곳 
	@RequestMapping(value="getcateTitle.htm", method=RequestMethod.GET)
	public View getCatetitle(int category_id,Model model) throws ClassNotFoundException, SQLException{
		
		Category_DTO dto = new Category_DTO();
		dto.setCategory_id(category_id);
		
		Category_DTO list = service.getCatetitle(dto);
		
		model.addAttribute("category", list);
		
		return jsonview;
	}

}
