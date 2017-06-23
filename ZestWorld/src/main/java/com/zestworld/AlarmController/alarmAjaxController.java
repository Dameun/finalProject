package com.zestworld.AlarmController;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.annotation.JsonView;
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
	
	@Autowired(required=false)
	private View jsonview; //빈객체의 주소값이 들어와있어야한다.
	
	public alarmAjaxController()
	{
	}
	
	//알람 리스트
	@RequestMapping(value="alarmList.ajax", method = RequestMethod.GET)
    public String alarmList(Model model)
            throws ClassNotFoundException, SQLException{
		
		  List<Alarm_DTO> list = new ArrayList<Alarm_DTO>();
		  list = service.GetList();
		  Alarm_DTO alarm_dto;
		  for( int i =0; i <list.size(); i ++)
		  { 
			  alarm_dto = list.get(i);	
		  }
		  model.addAttribute ("alarmList",list);
	      return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
	}
	
	//알람 카운트 수 변경
	@RequestMapping(value="alarmCount.ajax", method = RequestMethod.GET)
    public @ResponseBody String  alarmCount(Model model)
            throws ClassNotFoundException, SQLException{
		
		  List<Alarm_DTO> list = new ArrayList<Alarm_DTO>();
		  list = service.GetList();
		  Alarm_DTO alarm_dto;
		  int ReadCheck = 0;
		  for( int i =0; i <list.size(); i ++)
		  { 
			  alarm_dto = list.get(i);
			  if( alarm_dto.getCheck_f() == 0) ReadCheck++;
		  }
		
		  String unCountStr = String.valueOf(ReadCheck);
		  model.addAttribute("unCountStr", unCountStr);
	      return unCountStr;
	}
		
	
	//드롭박스 클릭시 안읽은 알람들 -> 읽은 알람으로 db수정 
	@RequestMapping(value="updateAlarm.ajax", method = RequestMethod.GET)
    public @ResponseBody String updateAlarm(Model model)throws ClassNotFoundException, SQLException
	{
		  List<Alarm_DTO> list = service.GetList();
		  Alarm_DTO alarm = new Alarm_DTO();
		  for( int i=0; i< list.size(); i ++)
		  {
			  alarm = list.get(i);
			  alarm.setCheck_f(1);
			  service.updateAlarm(alarm);
		  }
		  
		 // model.addAttribute ("alarmList",list);
	      //return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
		  String success = "success";
		  model.addAttribute("success", success);
	      return success;
	}
	
	//새 알람시 DB저장 default 안읽은 타입
	@RequestMapping(value="newAlarm.ajax", method = RequestMethod.POST)
    public @ResponseBody String newAlarm(@RequestParam(value="newAlarm") String newAlarm,Model model)
            throws ClassNotFoundException, SQLException{
		 
		  //alarmType+'/'+ taskTitle +'/'+selectId = newAlarm
		
		  String[] alarmIdArr={};
		  String[] msgArr = newAlarm.split("/");
		  int alarmType 	= Integer.parseInt(msgArr[0]);
		  String taskTitle 	= msgArr[1];
		  alarmIdArr 		= msgArr[2].split(",");
		  String writer 	= msgArr[3];
		  
		  String DbMessage = alarmStrMake(newAlarm);
		  //않읽은 db로 저장하고  알람 카운트 올려주기 
		  Alarm_DTO alarm = new Alarm_DTO();
		  alarm.setAlarm_type(alarmType);
		  alarm.setCheck_f(0);
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
			  if( alarm_dto.getCheck_f()==0) ReadCheck++;
		  }
		  
		  String success = "success";
		  model.addAttribute("success", success);
	      return success;
	      //return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
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
