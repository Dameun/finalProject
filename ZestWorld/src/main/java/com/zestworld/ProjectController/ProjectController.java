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

import com.zestworld.ProjectDAO.IProjectDAO;
import com.zestworld.ProjectService.ProjectService;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.TaskAssignMember_DTO;
import com.zestworld.Table_DTO.Users_DTO;
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
	private SqlSession sqlsession;
	
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
					System.out.println("count : "+ count);
					if(resultList.size()!=0){
						System.out.println("resultList  : "+resultList.get(k));
					}
					k++;
				}
				System.out.println();
			}
			
		}
		
		
		model.addAttribute("wMemberList", resultList);					
		return jsonview;
	}
	
	/*@RequestMapping(value="projectAssignMemberList.htm", method=RequestMethod.GET)
	public View projectAssignMemberList(int workspace_id, Model model) throws ClassNotFoundException, SQLException{
		List<WorkspaceUser_DTO> wMemberList=service.workspaceMemberList(workspace_id);
		
		List<String> workspaceMember= new ArrayList<String>();
		List<String> projectAssignmember = new ArrayList<String>();
		List<String> resultList = new ArrayList<String>();
 		
		int count = 0;
		int k = 0;
		List<Project_DTO> projectList = DataController.getInstance().GetProjectList();
		System.out.println("projectListSize : " +projectList.size());
		
		int projectid =0;
		IProjectDAO projectDao = sqlsession.getMapper(IProjectDAO.class);
		
		//프로젝트 배정멤버
		for( int i =0; i <projectList.size(); i++)
		{
			System.out.println("projectList : "+i+"    " +projectList.get(i).getProject_id());
			projectid = projectList.get(i).getProject_id();
			projectList.get(i).setProjectMember(projectDao.projectMemberList(projectid));
			
			if(projectList.get(i).projectMember.size()!=0){
				for(int j=0;j<projectList.get(i).projectMember.size();j++){
					projectAssignmember.add(i,projectList.get(i).projectMember.get(j).getUser_id());
				}
			}
			
		}
		System.out.println("++++++++++++++++++++++++++:"+i+"+++"+projectList.get(i).projectMember.get(i).getUser_id());
		
		System.out.println("projectAssignmember : " +projectAssignmember.size());
		//model.addAttribute("projectList", projectList);
		
		//워크스페이스 멤버
		for (int i = 0; i < wMemberList.size(); i++) {
			workspaceMember.add(i, wMemberList.get(i).getUser_id());
		
		}
		
		
		for(int i=0; i<projectAssignmember.size();i++){
			System.out.println("********배정된 멤버*********** : "+ projectAssignmember.get(i));
		}
		
		for(int i=0; i<wMemberList.size();i++){
			System.out.println("********워크스페이스*********** : "+ wMemberList.get(i).getUser_id());
		}
		
		if(projectAssignmember.size()==0){
			for (int i = 0; i < wMemberList.size(); i++) {
				resultList.add(i, wMemberList.get(i).getUser_id());
			}
		}else{
			//배정된멤버
			
			for (int i = 0; i < workspaceMember.size(); i++) {
				count=0;
				for (int j = 0; j < projectAssignmember.size(); j++) {
					if (workspaceMember.get(i).equals(projectAssignmember.get(j))) {
						count++;
						System.out.println("workspaceMember  : "+workspaceMember.get(i));
						System.out.println("projectAssignmember  : "+projectAssignmember.get(j));
						
					}
				}
				if (count == 0) {
					resultList.add(k, workspaceMember.get(i));
					System.out.println("count : "+ count);
					if(resultList.size()!=0){
						System.out.println("resultList  : "+resultList.get(k));
					}
					k++;
				}
				System.out.println();
			}
		}
		model.addAttribute("assignmember", resultList);
		
		model.addAttribute("wMemberList", wMemberList);			
		
		
		
		
		
		
		return jsonview;
	}
	
	*/
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
