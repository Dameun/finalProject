package com.zestworld.OutlineController;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.SimpleTimeZone;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class OutlineController {
	
	@Autowired
	private OutlineService service;
	
	@Autowired(required=false)
	private View jsonview; //빈객체의 주소값이 들어와있어야한다.
	
	@RequestMapping("totalTask.htm")
	public String tasklist(String forme,String writer,String follower,Model model) throws ClassNotFoundException, SQLException{
		
		return "task.totalTask";
	}
	
	@RequestMapping("taskTotalList.htm")
	public String taskTotalList(String writer,String forme,String follower,String writermember,String success,String datefilter, String order,Model model) throws ClassNotFoundException, SQLException{
		List<Task_DTO> basic= service.basictasklist();
		
		
		System.out.println("follower : " + follower);
		
		System.out.println("Basic: "+ basic.size());
		Task_DTO dto=new Task_DTO();
		System.out.println(order);
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		int workspace_id=DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		dto.setWorkspace_id(workspace_id);
		//湲곌컙寃��깋
		if(datefilter.equals("30")){
			cal.add(Calendar.MONTH ,-1); // �븳�떖�쟾 �궇吏� 媛��졇�삤湲�
		}else if(datefilter.equals("60")){
			cal.add(Calendar.MONTH ,-2); // �몢�떖�쟾 �궇吏� 媛��졇�삤湲�
		}else{
			cal.add(Calendar.YEAR ,-1); // �씪�뀈�쟾 �궇吏� 媛��졇�삤湲�
		}
	    //cal.add(Calendar.MONTH ,-1); // �븳�떖�쟾 �궇吏� 媛��졇�삤湲�
	    java.util.Date monthago = cal.getTime();
	    
	    String sDate = sdf.format(monthago);
	    
	    dto.setFilterDay(sDate);
	    /*
	    dto.setProject_id(project_id);
	    */
		String userid="";
	
		//String userid= DataController.getInstance().GetUser().getUserid();
		
		//�옉�꽦�옄�븘�꽣
		if(writermember.equals("")){
			userid=DataController.getInstance().GetUser().getUser_id();
			dto.setUser_id("");
		}else{
			//userid=writermember;
			dto.setUser_id(writermember);
		}
		
		//�긽�깭�븘�꽣
		/*if(success.equals("ing")){
			dto.setSuccess_f("0");
		}else if(success.equals("complete")){
			dto.setSuccess_f("1");
		}else{
			dto.setSuccess_f("");
			System.out.println("Success_fffffffffffffffffffffff:"+dto.getSuccess_f());
		}*/
		System.out.println(success);
		if(success.equals("complete")){
			dto.setSuccess_f("1");
		}else{
			dto.setSuccess_f("0");
		}
		
		
		if(order.equals("end")){
			System.out.println("order end");
			
			
			dto.setOrder("desc");
		}else{
			System.out.println("order etc");
			dto.setOrder("asc");
		}
		
		dto.setMember(forme);
		System.out.println("forme : " + forme);
		
		/*
		if(forme.equals("assign")){
			
		}
		*/
		if(follower.equals("check")){
			dto.setFollower(DataController.getInstance().GetUser().getUser_id());
		}else{
			dto.setFollower("");
		}
		System.out.println("follower값 확인 : " +dto.getFollower());
		
		List<Task_DTO> list= service.taskTest(dto);
		
		
		if(basic.size()==0){
			model.addAttribute("list", basic); //�옄�룞 forward 
		}else{
			model.addAttribute("list", list); //�옄�룞 forward 
		}
		System.out.println("LIST: "+ list.size());
	
		System.out.println("success_flag="+dto.getSuccess_f());
		return "/task/totalTaskList";
	}
	
	@RequestMapping(value="categoryFilterList.htm", method=RequestMethod.GET)
	public String categoryFilterList(int projectId, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("categoryFilterList.htm1");
		List<Category_DTO> category = service.categorylist(projectId);
		System.out.println("categoryFilterList.htm2");
		model.addAttribute("category", category); //�옄�룞 forward 
		
		return "/task/categotyFilterList";
	}
	
	@RequestMapping(value="taskInsert.htm", method=RequestMethod.GET)
	public String taskInsert(String title,int categoryId, String enddate,int project_id,  Model model) throws ClassNotFoundException, SQLException{
		System.out.println("들어가니2111111");
		Task_DTO dto=new Task_DTO();
		String userid="";
		
		
		dto.setTitle(title);
		dto.setCategory_id(categoryId);
		userid=DataController.getInstance().GetUser().getUser_id();
		dto.setUser_id(userid);
		dto.setEnd_date(enddate);
		dto.setProject_id(project_id);
		int workspaceId=DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		dto.setWorkspace_id(workspaceId);
		dto.setFollower(userid);
		
	/*	if(enddate!=null){
			dto.setEnd_date(enddate);
		}*/
		System.out.println("title : "+dto.getTitle());
		System.out.println("category: "+ dto.getCategory_id());
		System.out.println("End_date: "+ enddate);
		System.out.println("project_id: "+ dto.getProject_id());
		System.out.println();
		
		
		
		int result= service.insertTask(dto);
		System.out.println("insert 성공 ");
		List<Task_DTO> list= service.tasklist();
		
		model.addAttribute("list", list); //�옄�룞 forward 
		//String str = "success";
		return "/task/totalTaskList";
	}
	
	@RequestMapping(value="detailModal.htm", method=RequestMethod.GET)
	public View detailTask(String task_id,int project_id,Model model) throws ClassNotFoundException, SQLException{
		System.out.println("detailmodal*****: " + task_id);
		System.out.println("detailmodal project_id*****: " + project_id);
		Task_DTO result= service.detailTask(task_id);
		System.out.println("enrolldate:"+result.getEndrolldate());
		
		List<Users_DTO> assignmember=service.assignMemberList(project_id);
/*
		System.out.println("assignmember: " +assignmember.get(0).getUser_id());*/
/*		model.addAttribute("assignmember", assignmember);*/
		model.addAttribute("detail", result);
		
		
 
		return jsonview;
		
	}
	/*
	@RequestMapping(value="detailModalAssign.htm", method=RequestMethod.GET)
	public View detailModalAssign(String task_id,int project_id,Model model) throws ClassNotFoundException, SQLException{
		System.out.println("detailModalAssign*****: " + task_id);
		System.out.println("detailModalAssign project_id*****: " + project_id);
		
		List<Users_DTO> assignmember=service.assignMemberList(project_id);

		System.out.println("assignmember: "+assignmember.size());
		model.addAttribute("assignmember", assignmember);
		return jsonview;
		
	}
	
	*/
	@RequestMapping(value="detailModalCheckList.htm", method=RequestMethod.GET)
	public String detailModalCheckList(int task_id, Model model) throws ClassNotFoundException, SQLException{

		List<CheckList_DTO> chklist= service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
		
		return "/task/checkList";
		
	}
	
	@RequestMapping(value="updateFlag.htm", method=RequestMethod.GET)
	public String updateFlag(String task_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("updateFlag*****: " + task_id);
		service.updateFlag(task_id);
		List<Task_DTO> list=service.tasklist();
		model.addAttribute("list", list);
 
		return "/task/totalTaskList";
		
	}
	
	@RequestMapping(value="updateFlagZero.htm", method=RequestMethod.GET)
	public String updateFlagZero(String task_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("updateFlagZero*****: " + task_id);
		service.updateFlagZero(task_id);
		
		List<Task_DTO> list=service.tasklist();
		model.addAttribute("list", list);
 
		return "/task/totalTaskList";
		
	}
	
	@RequestMapping(value="detailUpdate.htm", method=RequestMethod.GET)
	public String detailUpdate(int task_id,String start,String end, String follower,String explain,String[] chkmember, Model model) throws ClassNotFoundException, SQLException{
		
		TaskAssignMember_DTO tm=new TaskAssignMember_DTO();
		Task_DTO dto= new Task_DTO();
		dto.setTask_id(task_id);
		dto.setStart_date(start);
		dto.setEnd_date(end);
		/*dto.setMember(member);*/
		dto.setExplain(explain);
		dto.setFollower(follower);
		
		int result=service.detailUpdate(dto);
		System.out.println("여기까지는 괜찮니");
		for(int i=0; i<chkmember.length;i++){
			System.out.println("sdasdsadasdas:  "+chkmember[i]);
			tm.setUser_id(chkmember[i]);
			tm.setTask_id(task_id);
			int result2=service.assignMemberReg(tm);
		}
		System.out.println("detailUpdate진입:   "+start);
		List<Task_DTO> list=service.tasklist();
		model.addAttribute("list", list);
 
		return "/task/totalTaskList";
		
	}
	@RequestMapping(value="detailDelete.htm", method=RequestMethod.GET)
	public String detailDelete(int task_id,Model model) throws ClassNotFoundException, SQLException{

		
		int result=service.detailDelete(task_id);

		List<Task_DTO> list=service.tasklist();
		model.addAttribute("list", list);
 
		return "/task/totalTaskList";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//업무 배정인원
	@RequestMapping(value="detailModalAssign.htm", method=RequestMethod.GET)
	public String taskMemberList(int task_id, int project_id, Model model) throws ClassNotFoundException, SQLException{

		List<TaskAssignMember_DTO> assignmember=service.taskMemberList(task_id);


		model.addAttribute("assignmember", assignmember);		
		
		return "/task/taskassignMember";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="taskMemberListChk1.htm", method=RequestMethod.GET)
	public View taskMemberListChk(int project_id , Model model) throws ClassNotFoundException, SQLException{
		System.out.println("멤버배정 리스트 확인");
		List<Users_DTO> member=service.assignMemberList(project_id);
		System.out.println("task_id: " + project_id);
		System.out.println("멤버 리스트: " + member.size());

		model.addAttribute("assignmember", member);		
		
		return jsonview;
	}
	
	
/*	
	System.out.println("detailModalAssign*****: " + task_id);
	System.out.println("detailModalAssign project_id*****: " + project_id);
	
	List<Users_DTO> assignmember=service.assignMemberList(project_id);

	System.out.println("assignmember: "+assignmember.size());
	model.addAttribute("assignmember", assignmember);
	return jsonview;
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="checkListReg.htm", method=RequestMethod.GET)
	public String checkListReg(int task_id,String contents,Model model) throws ClassNotFoundException, SQLException{
		System.out.println("checjList : " +task_id);
		System.out.println("checjList : " +contents);
		CheckList_DTO dto= new CheckList_DTO();
		dto.setContents(contents);
		dto.setTask_id(task_id);
		int result=service.checkListReg(dto);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	@RequestMapping(value="updateChkFlag.htm", method=RequestMethod.GET)
	public String updateChkFlag(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlag(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	@RequestMapping(value="updateChkFlagZero.htm", method=RequestMethod.GET)
	public String updateChkFlagZero(int task_id,int check_id, Model model) throws ClassNotFoundException, SQLException{
		int result=service.updateChkFlagZero(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);
 
		return "/task/checkList";
		
	}
	
	//체크리스 삭제
	@RequestMapping(value="checkListDelete.htm", method=RequestMethod.GET)
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
	
	
	@RequestMapping(value="taskAssign.htm", method=RequestMethod.GET)
	public View taskAssign(String[] checkboxValues,int taskid,Model model) throws ClassNotFoundException, SQLException{
		/*int result=service.updateChkFlagZero(check_id);

		List<CheckList_DTO> chklist=service.checkListView(task_id);
		model.addAttribute("chklist", chklist);*/
		TaskAssignMember_DTO dto= new TaskAssignMember_DTO();
		for(int i=0; i<checkboxValues.length;i++){
			System.out.println("sdasdsadasdas:  "+checkboxValues[i]);
			dto.setUser_id(checkboxValues[i]);
			dto.setTask_id(taskid);
			int result2=service.assignMemberReg(dto);
		}
		return jsonview;
		
	}
	
	@RequestMapping(value="deleteTaskMember.htm", method=RequestMethod.GET)
	public View deleteTaskMember(String memberId,int taskId,Model model) throws ClassNotFoundException, SQLException{
		TaskAssignMember_DTO dto = new TaskAssignMember_DTO();
		System.out.println("deleteTaskMember taskId: " + taskId);
		System.out.println("deleteTaskMember userid: " + memberId);
		dto.setTask_id(taskId);
		dto.setUser_id(memberId);
		int result=service.deleteTaskMember(dto);
		
		/*model.addAttribute("check", "check");*/
		return jsonview;
		
	}
}


