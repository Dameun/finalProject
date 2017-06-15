package com.zestworld.ajaxController;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zestworld.util.DataController;



@Controller
public class AjaxViewController {

	@Autowired
	private SqlSession sqlsession;
 
	public AjaxViewController()
	{
	}
	
	
	@RequestMapping(value="/Createproject.ajax", method=RequestMethod.GET)
	public String CreateProject()
	{
		return DataController.getInstance().GetviewPath("home")+ "CreateProject.jsp";
	}
	
	@RequestMapping(value="/addWorkspace.ajax", method=RequestMethod.GET)
	public String addWorkspace()
	{
		return DataController.getInstance().GetviewPath("home")+ "CreateWorkspace.jsp";
	}
	
	//mainContentView
	@RequestMapping(value="/totalTask.ajax", method=RequestMethod.GET)
	public String totalTask()
	{
		return DataController.getInstance().GetviewPath("totalTesk")+ "totalTask.jsp";
	}
	
	//mainContentView
	@RequestMapping(value="/taskList.ajax", method=RequestMethod.GET)
	public String totalList()
	{
		return DataController.getInstance().GetviewPath("totalTesk")+ "taskList.jsp";
	}
	

	@RequestMapping(value="/wSpace.ajax", method=RequestMethod.GET)
	public String wSpace()
	{
		return DataController.getInstance().GetviewPath("totalTesk")+ "workSpace.jsp";
	}
	

	@RequestMapping(value="/member.ajax", method=RequestMethod.GET)
	public String member()
	{
		return DataController.getInstance().GetviewPath("memberAdministration")+"member.jsp";
	}
	

	@RequestMapping(value="/chat.ajax", method=RequestMethod.GET)
	public String chat()
	{
		return DataController.getInstance().GetviewPath("chat")+"chatting.jsp";
	}
		

	@RequestMapping(value="/calendar.ajax", method=RequestMethod.GET)
	public String calendar()
	{
		return DataController.getInstance().GetviewPath("calendar")+"calendar.jsp";
	}


	@RequestMapping(value="/file.ajax", method=RequestMethod.GET)
	public String file()
	{
		return DataController.getInstance().GetviewPath("file")+"file.jsp";
	}
	
	@RequestMapping(value="/analysis.ajax", method=RequestMethod.GET)
	public String analysis()
	{
		return DataController.getInstance().GetviewPath("analysis")+"analysis.jsp";
	}	
	
	@RequestMapping(value="/template.ajax", method=RequestMethod.GET)
	public String template()
	{
		return DataController.getInstance().GetviewPath("template")+"template.jsp";
	}	
	
	@RequestMapping(value="/projectMain.ajax", method=RequestMethod.GET)
	public String projectMain(Model model)
	{
		model.addAttribute("projectList", DataController.getInstance().GetProjectList());
		return DataController.getInstance().GetviewPath("home")+"projectMain.jsp";
	}	
}
