package com.zestworld.ProjectController;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.ProjectServiceP.ProjectService;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.util.DataController;


@Controller
public class ProjectController {
	
	@Autowired(required=false)
	private ProjectService service;
	
	@Autowired(required=false)
	private View jsonview;
	
	@RequestMapping(value="assignMemberDelete.htm", method=RequestMethod.GET)
	public View assignMemberDelete(String memberId, int project_id,Model model) throws ClassNotFoundException, SQLException{
		System.out.println("assignMemberDelete: "+project_id);
		Project_user_DTO dto= new Project_user_DTO();
		dto.setUser_id(memberId);
		dto.setProject_id(project_id);;
		int result=service.assignMemberDelete(dto);
		
		model.addAttribute("check", "check");
		
		
		/*List<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		
		
		int projectid =0;
		for( int i =0; i <projectList.size(); i++)
		{
			System.out.println("projectList : "+i+"    " +projectList.get(i).getProject_id());
			projectid = projectList.get(i).getProject_id();
			projectList.get(i).setProjectMember(service.projectMemberList(projectid));
			projectList.get(i).projectMember = projectDao.projectMemberList(projectid);
		}

		model.addAttribute("projectList", projectList);*/
		return jsonview;
		
		
		
		
		/*return "/projectMain.ajax";*/
	}
	
	@RequestMapping(value="projectAssignMemberList.htm", method=RequestMethod.GET)
	public View projectAssignMemberList(int workspace_id, Model model) throws ClassNotFoundException, SQLException{
		System.out.println("멤버배정 리스트 확인");
		List<WorkspaceUser_DTO> wMemberList=service.workspaceMemberList(workspace_id);
		System.out.println("멤버 리스트: " + wMemberList.size());
		model.addAttribute("wMemberList", wMemberList);			
		return jsonview;
	}
	
	
	@RequestMapping(value="projectAssignChk.htm", method=RequestMethod.GET)
	public View projectAssignChk(int project_id,String[] chkmember,Model model) throws ClassNotFoundException, SQLException{
		Project_user_DTO memberChk=new Project_user_DTO();
		
		System.out.println();
		
		
		for(int i=0; i<chkmember.length;i++){
			System.out.println("sdasdsadasdas:  "+chkmember[i]);
			memberChk.setUser_id(chkmember[i]);
			memberChk.setProject_id(project_id);
			System.out.println("들어와라: " + memberChk.getUser_id());
			//int result2=service.assignMemberReg(tm);
			service.projectAssignMember(memberChk);
			
		}
		model.addAttribute("success", "success");
		
		return jsonview;
		/*int projectid =0;
		//IProjectDAO projectDao = sqlsession.getMapper(IProjectDAO.class);
		List<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		for( int i =0; i <projectList.size(); i++)
		{
			System.out.println("projectList : "+i+"    " +projectList.get(i).getProject_id());
			projectid = projectList.get(i).getProject_id();
			projectList.get(i).setProjectMember(service.projectMemberList(projectid));
			projectList.get(i).projectMember = projectDao.projectMemberList(projectid);
		}
*/
		/*model.addAttribute("projectList", projectList);*/
		/*return DataController.getInstance().GetviewPath("home") + "projectMain.jsp";*/
	
	}
}
