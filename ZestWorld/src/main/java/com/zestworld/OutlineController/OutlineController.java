package com.zestworld.OutlineController;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.SimpleTimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.zestworld.OutlineService.OutlineService;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.TaskAssignMember_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.util.DataController;

/*
* @FileName : OutlineController.java
* @Project : ZestWorld
* @Date : 2017. 6. 29.
* @Author : 최담은
* @Desc : 전체개요(리스트,필터,상세정보 수정)
*/

@Controller
public class OutlineController {

	@Autowired
	private OutlineService service;

	@Autowired(required = false)
	private View jsonview; // 빈객체의 주소값이 들어와있어야한다.

	@RequestMapping("totalTask.htm")
	public String tasklist(String forme, String writer, String follower, Model model)
			throws ClassNotFoundException, SQLException {

		return "task.totalTask";
	}

	//업무리스트 출력(필터)
	@RequestMapping("taskTotalList.htm")
	public String taskTotalList(String writer, String forme, String follower, String writermember, String success,
			String datefilter, String order,int project_id, int paging, Model model) throws ClassNotFoundException, SQLException {
		List<Task_DTO> basic = service.basictasklist();
		int resultCount = 0;
		Task_DTO dto = new Task_DTO();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		dto.setWorkspace_id(workspace_id);
		dto.setPaging((paging - 1) * 5);

		if (datefilter.equals("30")) {
			cal.add(Calendar.MONTH, -1);
		} else if (datefilter.equals("60")) {
			cal.add(Calendar.MONTH, -2);
		} else {
			cal.add(Calendar.YEAR, -1);
		}

		java.util.Date monthago = cal.getTime();

		String sDate = sdf.format(monthago);
		dto.setFilterDay(sDate);

		String userid = "";

		if (writermember.equals("")) {
			userid = DataController.getInstance().GetUser().getUser_id();
			dto.setUser_id("");
		} else {
			dto.setUser_id(writermember);
		}

		if (success.equals("complete")) {
			dto.setSuccess_f("1");
		} else {
			dto.setSuccess_f("0");
		}

		if (order.equals("end")) {
			dto.setOrder("desc");
		} else {
			dto.setOrder("asc");
		}
		
		int parseInt=0;
		
		
		dto.setProject_id(project_id);
		
		dto.setMember(forme);

		if (follower.equals("check")) {
			dto.setFollower(DataController.getInstance().GetUser().getUser_id());
		} else {
			dto.setFollower("");
		}

		List<Task_DTO> list = service.taskTest(dto);
		int count = service.countList(dto);
		
		if (basic.size() == 0) {
			model.addAttribute("list", basic); // �옄�룞 forward
		} else {
			model.addAttribute("list", list); // �옄�룞 forward
		}
		if (count % 5 == 0) {
			resultCount = (count / 5);
		} else {
			resultCount = (count / 5) + 1;
		}
		System.out.println("listSize : "+ list.size());
		model.addAttribute("count", resultCount);
		model.addAttribute("paging", paging);

		return "/task/totalTaskList";
	}

	@RequestMapping(value = "categoryFilterList.htm", method = RequestMethod.GET)
	public String categoryFilterList(int projectId, Model model) throws ClassNotFoundException, SQLException {

		List<Category_DTO> category = service.categorylist(projectId);
		model.addAttribute("category", category); // �옄�룞 forward

		return "/task/categotyFilterList";
	}

	//업무 추가
	@RequestMapping(value = "taskInsert.htm", method = RequestMethod.GET)
	public String taskInsert(String title, int categoryId, String enddate, int project_id, Model model)
			throws ClassNotFoundException, SQLException {

		Task_DTO dto = new Task_DTO();
		String userid = "";
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		int paging = 0;

		dto.setTitle(title);
		dto.setCategory_id(categoryId);
		userid = DataController.getInstance().GetUser().getUser_id();
		dto.setUser_id(userid);
		dto.setEnd_date(enddate);
		dto.setProject_id(project_id);
		dto.setWorkspace_id(workspace_id);
		dto.setFollower(userid);

		int result = service.insertTask(dto);
		List<Task_DTO> list = service.tasklist(workspace_id);

		model.addAttribute("list", list); // �옄�룞 forward
		model.addAttribute("paging", paging);
		model.addAttribute("count", 2);
		return "/task/totalTaskList";
	}

	//상세보기 모달창
	@RequestMapping(value = "detailModal.htm", method = RequestMethod.GET)
	public View detailTask(String task_id, int project_id, Model model) throws ClassNotFoundException, SQLException {
		Task_DTO result = service.detailTask(task_id);
		System.out.println("detailModal : "+ result.getEnrolldate());
		List<Users_DTO> assignmember = service.assignMemberList(project_id);

		model.addAttribute("detail", result);

		return jsonview;

	}
	
	//체크리스트 출력(select)
	@RequestMapping(value = "detailModalCheckList.htm", method = RequestMethod.GET)
	public String detailModalCheckList(int task_id, Model model) throws ClassNotFoundException, SQLException {

		List<CheckList_DTO> chklist = service.checkListView(task_id);
		model.addAttribute("chklist", chklist);

		return "/task/checkList";

	}

	//상세보기 모달창에서 성공여부 flag 값 update
	@RequestMapping(value = "updateFlag.htm", method = RequestMethod.GET)
	public String updateFlag(String task_id, Model model) throws ClassNotFoundException, SQLException {
		service.updateFlag(task_id);
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		int paging = 1;
		List<Task_DTO> list = service.tasklist(workspace_id);
		String userId = DataController.getInstance().GetUser().getUser_id();

		model.addAttribute("list", list);
		model.addAttribute("userId", userId);
		model.addAttribute("paging", paging);
		return "/task/totalTaskList";

	}

	//성공여부 flag값 update
	@RequestMapping(value = "updateFlagZero.htm", method = RequestMethod.GET)
	public String updateFlagZero(String task_id, Model model) throws ClassNotFoundException, SQLException {
		service.updateFlagZero(task_id);
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		int paging = 1;
		List<Task_DTO> list = service.tasklist(workspace_id);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return "/task/totalTaskList";

	}

	//상세보기 모달창에서 수정(update)
	@RequestMapping(value = "detailUpdate.htm", method = RequestMethod.GET)
	public String detailUpdate(int task_id, String start, String end, String follower, String explain,
			String[] chkmember, Model model) throws ClassNotFoundException, SQLException {

		TaskAssignMember_DTO tm = new TaskAssignMember_DTO();
		Task_DTO dto = new Task_DTO();
		dto.setTask_id(task_id);
		dto.setStart_date(start);
		dto.setEnd_date(end);
		dto.setDescription(explain);
		dto.setFollower(follower);

		int result = service.detailUpdate(dto);
		for (int i = 0; i < chkmember.length; i++) {
			tm.setUser_id(chkmember[i]);
			tm.setTask_id(task_id);
			int result2 = service.assignMemberReg(tm);
		}
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		int paging = 1;
		List<Task_DTO> list = service.tasklist(workspace_id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return "/task/totalTaskList";

	}
	
	//업무삭제
	@RequestMapping(value = "detailDelete.htm", method = RequestMethod.GET)
	public String detailDelete(int task_id, Model model) throws ClassNotFoundException, SQLException {
		int result = service.detailDelete(task_id);
		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		int paging = 1;

		List<Task_DTO> list = service.tasklist(workspace_id);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("count", 2);
		return "/task/totalTaskList";

	}

	// 업무 배정인원
	@RequestMapping(value = "detailModalAssign.htm", method = RequestMethod.GET)
	public String taskMemberList(int task_id, int project_id, Model model) throws ClassNotFoundException, SQLException {
		
		List<TaskAssignMember_DTO> assignmember = service.taskMemberList(task_id);
		
		model.addAttribute("assignmember", assignmember);

		return "/task/taskassignMember";
	}

	//업무 배정 (insert)
	@RequestMapping(value = "taskAssign.htm", method = RequestMethod.GET)
	public View taskAssign(String[] checkboxValues, int taskid, Model model)
			throws ClassNotFoundException, SQLException {

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
	
	//배정받은 멤버 삭제
	@RequestMapping(value = "deleteTaskMember.htm", method = RequestMethod.GET)
	public View deleteTaskMember(String memberId, int taskId, Model model) throws ClassNotFoundException, SQLException {

		TaskAssignMember_DTO dto = new TaskAssignMember_DTO();
		
		dto.setTask_id(taskId);
		dto.setUser_id(memberId);
		int result=service.deleteTaskMember(dto);
		
		String userid=DataController.getInstance().GetUser().getUser_id();
		model.addAttribute("userid", userid);
		
		return jsonview;

	}
	
	//멤버배정하기 위한 리스트 (업무 배정 테이블 insert)
	@RequestMapping(value = "taskMemberListChk1.htm", method = RequestMethod.GET)
	public View taskMemberListChk(int project_id, int task_id, Model model) throws ClassNotFoundException, SQLException {
		
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

	//체크리스트 등록
	@RequestMapping(value = "checkListReg.htm", method = RequestMethod.GET)
	public String checkListReg(int task_id, String contents, Model model) throws ClassNotFoundException, SQLException {
		CheckList_DTO dto = new CheckList_DTO();
		dto.setContents(contents);
		dto.setTask_id(task_id);
		int result = service.checkListReg(dto);

		List<CheckList_DTO> chklist = service.checkListView(task_id);
		model.addAttribute("chklist", chklist);

		

		
		return "/task/checkList";

	}

	//체크리스트 완료  update
	@RequestMapping(value = "updateChkFlag.htm", method = RequestMethod.GET)
	public String updateChkFlag(int task_id, int check_id, Model model) throws ClassNotFoundException, SQLException {
		int result = service.updateChkFlag(check_id);

		List<CheckList_DTO> chklist = service.checkListView(task_id);
		model.addAttribute("chklist", chklist);

		return "/task/checkList";

	}
	//체크리스트 완료x  update
	@RequestMapping(value = "updateChkFlagZero.htm", method = RequestMethod.GET)
	public String updateChkFlagZero(int task_id, int check_id, Model model)
			throws ClassNotFoundException, SQLException {
		int result = service.updateChkFlagZero(check_id);

		List<CheckList_DTO> chklist = service.checkListView(task_id);
		model.addAttribute("chklist", chklist);

		return "/task/checkList";

	}

	// 체크리스트 삭제
	@RequestMapping(value = "checkListDelete.htm", method = RequestMethod.GET)
	public String checkListDelete(int task_id, int check_id, Model model) throws ClassNotFoundException, SQLException {
		int result = service.checkListDelete(check_id);

		List<CheckList_DTO> chklist = service.checkListView(task_id);
		model.addAttribute("chklist", chklist);

		return "/task/checkList";

	}


}
