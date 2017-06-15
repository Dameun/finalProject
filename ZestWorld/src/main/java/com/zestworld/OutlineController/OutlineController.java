package com.zestworld.OutlineController;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.SimpleTimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zestworld.OutlineService.OutlineService;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.util.DataController;

@Controller
public class OutlineController {
	
	@Autowired
	private OutlineService service;
	
	@RequestMapping("totalTask.htm")
	public String tasklist(String forme,String writer,String follower,Model model) throws ClassNotFoundException, SQLException{
		
		return "task.totalTask";
	}
	
	@RequestMapping("taskTotalList.htm")
	public String taskTotalList(String writer,String forme,String follower,String writermember,String success,String datefilter, String order,Model model) throws ClassNotFoundException, SQLException{
		Task_DTO dto=new Task_DTO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		
		//기간검색
		if(datefilter.equals("30")){
			cal.add(Calendar.MONTH ,-1); // 한달전 날짜 가져오기
		}else if(datefilter.equals("60")){
			cal.add(Calendar.MONTH ,-2); // 두달전 날짜 가져오기
		}else{
			cal.add(Calendar.YEAR ,-1); // 일년전 날짜 가져오기
		}
	    //cal.add(Calendar.MONTH ,-1); // 한달전 날짜 가져오기
	    java.util.Date monthago = cal.getTime();
	    
	    String sDate = sdf.format(monthago);
	    
	    dto.setFilterDay(sDate);
	    
	    System.out.println("sDate : " +sDate);
		String userid="";
		System.out.println("forme: " + forme);

		System.out.println("follower: " + follower);

		System.out.println("writer: " + writer);
		System.out.println("writermember: " + writermember);
		
		//String userid= DataController.getInstance().GetUser().getUserid();
		
		//작성자필터
		if(writermember==""){
			userid=DataController.getInstance().GetUser().getUserid();
			dto.setUserid("");
		}else{
			//userid=writermember;
			dto.setUserid(writermember);
			System.out.println("writerNotNulll");
		}
		
		//상태필터
		if(success.equals("ing")){
			dto.setSuccess_f("0");
		}else if(success.equals("complete")){
			dto.setSuccess_f("1");
		}else{
			dto.setSuccess_f("");
			System.out.println("Success_fffffffffffffffffffffff:"+dto.getSuccess_f());
		}
		/*
		//정렬
		if(order.equals("end")){
			dto.setOrder("desc");
		}else{
			dto.setOrder("asc");
		}*/
		
		System.out.println("getUserid : " +dto.getUserid());
		System.out.println("WriterMember : " + userid);
		dto.setMember(forme);
		dto.setFollower(follower);
		
		List<Task_DTO> list= service.taskTest(dto);
		
		model.addAttribute("list", list); //자동 forward 
	
		System.out.println("LIST: "+ list.size());
	
		System.out.println("success_flag="+dto.getSuccess_f());
		return "/task/totalTaskList";
	}
	
	@RequestMapping(value="categoryFilterList.htm", method=RequestMethod.GET)
	public String categoryFilterList(int projectId, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("categoryFilterList.htm1");
		List<Category_DTO> category = service.categorylist(projectId);
		System.out.println("categoryFilterList.htm2");
		model.addAttribute("category", category); //자동 forward 
		
		return "/task/categotyFilterList";
	}
	
	@RequestMapping(value="taskInsert.htm", method=RequestMethod.GET)
	public String taskInsert(String title,int categoryId, Model model) throws ClassNotFoundException, SQLException{
		Task_DTO dto=new Task_DTO();
		String userid="";
		
		dto.setTitle(title);
		dto.setCategory_id(categoryId);
		userid=DataController.getInstance().GetUser().getUserid();
		dto.setUserid(userid);
		
	/*	if(enddate!=null){
			dto.setEnd_date(enddate);
		}*/
		System.out.println("title : "+dto.getTitle());
		System.out.println("category: "+ dto.getCategory_id());
		//System.out.println("End_date: "+ enddate);
	
		
		int result= service.insertTask(dto);
		return "/task/totalTaskList";
	}

}


