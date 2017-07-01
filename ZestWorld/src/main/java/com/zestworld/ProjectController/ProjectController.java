package com.zestworld.ProjectController;

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

import com.zestworld.ProjectService.ProjectService;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;

/*
* @FileName : ProjectController.java
* @Project : ZestWorld
* @Date : 2017. 7. 1.
* @Author : 최담은
* @Desc : 프로젝트 리스트(멤버 배정,취소)
*/

@Controller
public class ProjectController {
	
	@Autowired(required=false)
	private SqlSession sqlsession;
	
	@Autowired(required=false)
	private ProjectService service;
	
	@Autowired(required=false)
	private View jsonview;
	
	//프로젝트 멤버 삭제
	@RequestMapping(value="assignMemberDelete.htm", method=RequestMethod.GET)
	public View assignMemberDelete(String memberId, int projectId,Model model) throws ClassNotFoundException, SQLException{
		
		Project_user_DTO dto= new Project_user_DTO();
		dto.setUser_id(memberId);
		dto.setProject_id(projectId);
		int result=service.assignMemberDelete(dto);
		
		model.addAttribute("check", "check");
		
		return jsonview;
	}
	
	//워크 스페이스 멤버 리스트
	@RequestMapping(value="projectAssignMemberList.htm", method=RequestMethod.GET)
	public View projectAssignMemberList(int workspace_id,int project_id, Model model) throws ClassNotFoundException, SQLException{
		List<WorkspaceUser_DTO> wMemberList=service.workspaceMemberList(workspace_id);
		List<Project_user_DTO> projectMember=service.AssignMemberList(project_id);
		
		List<String> workspaceMemberList=new ArrayList<String>();
		List<String> projectMemberList=new ArrayList<String>();
		List<String> resultList=new ArrayList<String>();
		
		int k=0;
		int count=0;
		
		for(int i=0;i<wMemberList.size();i++){
			workspaceMemberList.add(i,wMemberList.get(i).getUser_id());
		}
		
		if(projectMember.size()==0){
			for(int i=0;i<wMemberList.size();i++){
				resultList.add(i,wMemberList.get(i).getUser_id());
			}
		}else{
			for(int i=0;i<projectMember.size();i++){
				projectMemberList.add(i,projectMember.get(i).getUser_id());
			}
			
			for(int i=0;i<workspaceMemberList.size();i++){
				count=0;
				for (int j=0;j<projectMemberList.size();j++){
					if (workspaceMemberList.get(i).equals(projectMemberList.get(j))) {
						count++;
						
						
					}
				}
				
				if (count == 0) {
					resultList.add(k, workspaceMemberList.get(i));
					if(resultList.size()!=0){
						System.out.println("resultList  : "+resultList.get(k));
					}
					k++;
				}
			}
			
		}
		
		
		model.addAttribute("wMemberList", resultList);					
		return jsonview;
	}
	
	//프로젝트 멤버 배정
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
