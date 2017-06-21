package com.zestworld.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zestworld.AlarmService.AlarmService;
import com.zestworld.Alarm_DAO.AlarmDAO;
import com.zestworld.Table_DTO.Alarm_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.WorkspaceUser_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.taskDAO.TaskDataDAO;

/*
 * 2017-06-07 
 * jang yoon hee
 * 공용 data/info 저장
 * data : user.currentWorkspace, currentProject
 * info : 
 */

public class DataController {
	
	@Autowired
	private SqlSession sqlsession;
	private  static DataController instance = null;
	 
	private Users_DTO user;
	private Project_DTO currentProject;
	private Workspace_DTO currentWorkspace;
	private ArrayList<Workspace_DTO> workspaceList = new ArrayList<Workspace_DTO> ();
	private ArrayList<Project_DTO> projectList = new ArrayList<Project_DTO> ();
	private ArrayList<Task_DTO> taskList = new ArrayList<Task_DTO> ();
	
	private DataController()
	{
	}
	
	public void Reset()
	{	
	}
	
	//워크스페이스 추가/프로젝트 생성,삭제시 변화 있을때 호출 
	//current data edit 
	public void dataChange()
	{
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		List<WorkspaceUser_DTO> workspaceUserList = taskDao.GetWorkSpaceList(user.getUser_id());
	    List<Workspace_DTO>workspaceList = new ArrayList<Workspace_DTO>();
	    Workspace_DTO workspace;
	    
	    for( int i=0; i<workspaceUserList.size(); i ++)
	    {
	    	int workSpaceId = workspaceUserList.get(i).getWorkspace_id();
	    	workspace= taskDao.GetWorkSpace(workSpaceId);
	    	workspaceList.add(workspace);
	    }
	    SetUserWorkSpace(workspaceList);    
	}
	
	public void dataChangeProject ()
	{
		projectList.clear();
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		projectList = (ArrayList<Project_DTO>)taskDao.GetProjectList(currentWorkspace.getWorkspace_id());
	}
	
	//로그인된 user data
	public void SetUserSavedata (Users_DTO _user)
	{
		this.user = _user;
	}
	
	//워크스페이스 선택시 data
	//선택한 워크스페이스네 프로젝트 data list
	public void SetCurrentWorkspace(Workspace_DTO _currentWorkspace)
	{
		this.currentWorkspace = _currentWorkspace;
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		projectList = (ArrayList<Project_DTO>)taskDao.GetProjectList(currentWorkspace.getWorkspace_id());
	}
	
	// 현재 워크스페이스 위치
	public Workspace_DTO getCurrentWorkspace() {
		return currentWorkspace;
	}
	
	//프로젝트 선택시 선택된 project data
	public void SetCurrentProject (Project_DTO _currentProject)
	{
		this.currentProject = _currentProject;
	}
	
	// 현재 프로젝트 위치
	public Project_DTO getCurrentProject() {
		return currentProject;
	}
	
	//현재 선택된 워크스페이스에서 가지고 있는 프로젝트 리스트
	public void SetUserWorkSpace(List<Workspace_DTO> _workspaceList )
	{
		this.workspaceList = (ArrayList<Workspace_DTO>)_workspaceList;
	}
	
	public Users_DTO GetUser()
	{
		return user;
	}
	
	public ArrayList<Workspace_DTO> GetWorkspaceList ()
	{
		return workspaceList;
	}
	
	
	public ArrayList<Project_DTO> GetProjectList ()
	{
		return projectList;
	}
	
	
	public ArrayList<Task_DTO> GetTaskList ()
	{
		return taskList;
	}
	
	
	public Project_DTO SelectProjectData()
	{
		return currentProject;
	}
	
	public Workspace_DTO GetSelectWorkSpace()
	{
		return currentWorkspace;
	}
	
	public static DataController getInstance()
	{
		if( instance == null )
		{
			instance = new DataController();
		}
		
		return instance;
	}
	
	public void SetAlarm(String msg)
	{
		AlarmDAO alarmDao = sqlsession.getMapper(AlarmDAO.class);
		
		
		  String[] alarmIdArr={};
		  String[] msgArr = msg.split("/");
		  int alarmType 	=  Integer.parseInt(msgArr[0]);
		  String taskTitle 	= msgArr[1];
		  alarmIdArr 		= msgArr[2].split(",");
		  String writer 	= msgArr[3];
		  
		  
		  String DbMessage = alarmStrMake(msg);
		  //않읽은 db로 저장하고  알람 카운트 올려주기 
		  Alarm_DTO alarm = new Alarm_DTO();
		  alarm.setAlarm_type(alarmType);
		  alarm.setCheck_f(0);
		  alarm.setImg("img");
		  alarm.setUser_id(writer);
		  alarm.setAcceptUsers(DataController.getInstance().GetUser().getUser_id());
		  alarm.setAlarmTitle(alarmStrMake(msg));
		  try {
				alarmDao.insert(alarm);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//알람 stirng 만들기 
		private String alarmStrMake(String newAlarm)
		{
			  String[] msgArr = newAlarm.split("/");
			  String alarmType 	= msgArr[0];
			  String taskTitle 	= msgArr[1];
			  String writer 	= msgArr[3];
			  String userId		= DataController.getInstance().GetUser().getUser_id();
			  String returnMsg = "";
			  //0 업무배정받음
			  //1 업무완료알림
			  if( alarmType.equals("0"))
			  {
				  if( writer.equals(userId) )
					  returnMsg = "새로운 업무 "+ taskTitle+ "가 만들어졌습니다.";
				  else
					  returnMsg = writer+"님이" + userId + "님께" + taskTitle+ "배정했습니다.";
			  }else
			  {
				  if( writer.equals(userId) )
					  returnMsg = "업무 "+ taskTitle+ "를 완료하였습니다.";
				  else
					  returnMsg = writer+"님이" +"업무를 완료하였습니다.";
			  }
			  
			  return returnMsg;
		}
	
	public String GetviewPath(String pathType)
	{
		String path = "";
		if( pathType.equals( "home")) path = "/WEB-INF/views/home/";
		if( pathType.equals( "totalTesk")) path = "/WEB-INF/views/task/";
		if( pathType.equals( "memberAdministration")) path = "/WEB-INF/views/memberAdministration/";
		if( pathType.equals( "chat")) path = "/WEB-INF/views/chat/";
		if( pathType.equals( "calendar")) path = "/WEB-INF/views/calendar/";
		if( pathType.equals( "file")) path = "/WEB-INF/views/file/";
		if( pathType.equals( "analysis")) path = "/WEB-INF/views/analysis/";
		if( pathType.equals( "template")) path = "/WEB-INF/views/template/";
		if( pathType.equals( "alarm")) path = "/WEB-INF/views/alarm/";
		return path;
	}
	


}
