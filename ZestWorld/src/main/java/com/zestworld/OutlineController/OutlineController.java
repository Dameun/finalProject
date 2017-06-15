package com.zestworld.OutlineController;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zestworld.OutlineService.OutlineService;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.util.DataController;


@Controller
public class OutlineController {
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private OutlineService service;

	
	@RequestMapping("totalTask.htm")
	public String tasklist(String forme,String writer,String follower,Model model) throws ClassNotFoundException, SQLException{
		
		return "task.totalTask";
	}
	
	@RequestMapping("taskTotalList.htm")
	public String taskTotalList(String writer,String forme,String follower,Model model) throws ClassNotFoundException, SQLException{

		System.out.println("forme: " + forme);

		System.out.println("follower: " + follower);

		System.out.println("writer: " + writer);
		System.out.println();
		
		String userid= DataController.getInstance().GetUser().getUserid();
		
		//String follower1="follower2";
		
		Task_DTO dto=new Task_DTO();
		dto.setUserid(userid);
		dto.setMember(forme);
		dto.setFollower(follower);
		
		List<Task_DTO> list= service.taskTest(dto);
		
		model.addAttribute("list", list); //자동 forward 
		
		System.out.println("LIST: "+ list.size());
	
		return "/task/totalTaskList";
	}
}


