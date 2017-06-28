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
import com.zestworld.ProjectService.ProjectService;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.util.DataController;

/*
* @FileName : ProjectController.java
* @Project : ZestWorld
* @Date : 2017. 6. 26.
* @Author : 최담은
* @Desc : 프로젝트 리스트(멤버 배정,취소)
*/

@Controller
public class ProjectController {
	
	@Autowired(required=false)
	private ProjectService service;
	
	@Autowired(required=false)
	private View jsonview;
	
	@RequestMapping(value="assignMemberDelete.htm", method=RequestMethod.GET)
	public View assignMemberDelete(String memberId, int projectId,Model model) throws ClassNotFoundException, SQLException{
		
		Project_user_DTO dto= new Project_user_DTO();
		dto.setUser_id(memberId);
		dto.setProject_id(projectId);
		int result=service.assignMemberDelete(dto);
		
		model.addAttribute("check", "check");
		
		return jsonview;
	}
	
	@RequestMapping(value="projectAssignMemberList.htm", method=RequestMethod.GET)
	public View projectAssignMemberList(int workspace_id, Model model) throws ClassNotFoundException, SQLException{
		List<WorkspaceUser_DTO> wMemberList=service.workspaceMemberList(workspace_id);
		model.addAttribute("wMemberList", wMemberList);			
		return jsonview;
	}
	
	
	@RequestMapping(value="projectAssignChk.htm", method=RequestMethod.GET)
	public View projectAssignChk(int project_id,String[] chkmember,Model model) throws ClassNotFoundException, SQLException{
		Project_user_DTO memberChk=new Project_user_DTO();	
		
		for(int i=0; i<chkmember.length;i++){
			memberChk.setUser_id(chkmember[i]);
			memberChk.setProject_id(project_id);

			service.projectAssignMember(memberChk);
			
		}
		model.addAttribute("success", "success");
		
		return jsonview;
	}
}
