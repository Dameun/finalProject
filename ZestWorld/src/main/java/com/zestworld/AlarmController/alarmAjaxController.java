package com.zestworld.AlarmController;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zestworld.AlarmService.AlarmService;
import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Alarm_DTO;
import com.zestworld.util.DataController;

/*
 *2017-06-18
 *알람  yooonhee 
 */
@Controller
public class alarmAjaxController {

	@Autowired
	private AlarmService service;
	
	public alarmAjaxController()
	{
		System.out.println("alarmController.alarmController()");
	}
	
	//알람 리스트
	@RequestMapping(value="alarmList.ajax", method = RequestMethod.GET)
    public String alarmList(Model model)
            throws ClassNotFoundException, SQLException{
		
		  List<Alarm_DTO> list = service.GetList();
		  Alarm_DTO alarm_dto;
		  int ReadCheck = 0;
		  for( int i =0; i <list.size(); i ++)
		  { 
			  alarm_dto = list.get(i);
			  if( alarm_dto.getCheck_f().equals("0")) ReadCheck++;
		  }
		  model.addAttribute ("alarmList",list);
		  model.addAttribute ("unCount",ReadCheck);
		  
	      return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
	}
	
	//새 알람시 DB저장 default 안읽은 타입
	@RequestMapping(value="newAlarm.ajax", method = RequestMethod.POST)
    public String newAlarm(@RequestParam(value="newAlarm") String newAlarm,Model model)
            throws ClassNotFoundException, SQLException{
		 
		  //alarmType+'/'+ taskTitle +'/'+selectId = newAlarm
		
		  String[] alarmIdArr={};
		  String[] msgArr = newAlarm.split("/");
		  String alarmType 	= msgArr[0];
		  String taskTitle 	= msgArr[1];
		  alarmIdArr 		= msgArr[2].split(",");
		  String writer 	= msgArr[3];
		  
		  String DbMessage = alarmStrMake(newAlarm);
		  //않읽은 db로 저장하고  알람 카운트 올려주기 
		  Alarm_DTO alarm = new Alarm_DTO();
		  alarm.setAlarm_type(alarmType);
		  alarm.setCheck_f("0");
		  alarm.setImg("img");
		  alarm.setUser_id(writer);
		  alarm.setAcceptUsers(DataController.getInstance().GetUser().getUser_id());
		  alarm.setAlarmTitle(alarmStrMake(newAlarm));
		  service.insert(alarm);
		  List<Alarm_DTO> list = service.GetList();
		  
		  Alarm_DTO alarm_dto = new Alarm_DTO();
		  int ReadCheck = 0;
		  for( int i =0; i <list.size(); i ++)
		  { 
			  alarm_dto = list.get(i);
			  if( alarm_dto.getCheck_f().equals("0")) ReadCheck++;
		  }
		  model.addAttribute  ("alarmList",list);
		  model.addAttribute  ("unCount",ReadCheck);
	      return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
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
	

}
