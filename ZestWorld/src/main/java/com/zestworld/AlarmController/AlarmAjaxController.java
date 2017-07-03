package com.zestworld.AlarmController;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import com.zestworld.AlarmService.AlarmService;
import com.zestworld.Table_DTO.Alarm_DTO;
import com.zestworld.util.DataController;

/*
 * @FileName : AlarmAjaxController.java
 * @Project : ZestWorld
 * @Date : 2017.07.01
 * @Author : 장윤희
 * @Desc : 알람 컨트롤러 
 * 		   alarmList: 알람 리스트 호출 
 * 		   alarmCount : 헤더부분 알람카운터 
 * 		   updateAlarm : 알람 읽은후 처리 
 * 		   newAlarm : 새로운 알람 등록
 * */
@Controller
public class AlarmAjaxController {

	@Autowired
	private AlarmService service;
	
	@Autowired(required=false)
	private View jsonview; 
	

	@RequestMapping(value="alarmList.ajax", method = RequestMethod.GET)
    public String alarmList(Model model)
            throws ClassNotFoundException, SQLException{
		
		  List<Alarm_DTO> list = new ArrayList<Alarm_DTO>();
		  list = service.GetList();
		  Alarm_DTO alarm_dto;
		  for( int i =0; i <list.size(); i ++)alarm_dto = list.get(i);	

		  model.addAttribute ("alarmList",list);
	      return DataController.getInstance().GetviewPath("alarm")+"newAlarm.jsp";
	}

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

		  String success = "success";
		  model.addAttribute("success", success);
	      return success;
	}
	
	@RequestMapping(value="newAlarm.ajax", method = RequestMethod.POST)
    public @ResponseBody String newAlarm(@RequestParam(value="newAlarm") String newAlarm,Model model)
            throws ClassNotFoundException, SQLException{
		 
		
		Calendar date = Calendar.getInstance();
		String strTime = date.get(Calendar.HOUR_OF_DAY) + ":" +
		date.get(Calendar.MINUTE) + ":" +
		date.get(Calendar.SECOND);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = dateFormat.format(date.getTime());
		
		  String[] alarmIdArr={};
		  String[] msgArr = newAlarm.split("/");
		  int alarmType 	= Integer.parseInt(msgArr[0]);
		  String follower 	= msgArr[3];
		  
		  Alarm_DTO alarm = new Alarm_DTO();
		  alarm.setAlarm_type(alarmType);
		  alarm.setCheck_f(0);
		  alarm.setImg("img");
		  alarm.setUser_id(msgArr[3]);	//보내는 사람 
		  alarm.setAcceptUsers(msgArr[2]);	//받는 사람 
		  alarm.setAlarmTitle(alarmStrMak(newAlarm));
		  alarm.setImg(now);
		  service.insert(alarm);

		  String success = "success";
		  model.addAttribute("success", success);
	      return success;
	}
	
	  
    public static String getCurrentTime(String timeFormat){
        return new SimpleDateFormat(timeFormat).format(System.currentTimeMillis());
    }

    //	send('1','title',$('#hiddenFollower').val(), $('#hiddenUserId').val());
	private String alarmStrMak(String newAlarm)
	{
		  String[] msgArr = newAlarm.split("/");
		  String alarmType 	= msgArr[0];
		  String taskTitle 	= msgArr[1];
		  String taskAccept = msgArr[2];
		  String follower 	= msgArr[3];
		  String userId		= DataController.getInstance().GetUser().getUser_id();
		  String returnMsg = "";
		
		  //업무 배정시 
		  if( alarmType.equals("0"))
		  {
			  if( taskAccept.equals(follower) )
				  returnMsg = "업무 :  " + taskTitle +"이/가 배정되었습니다. ";
			  else
				  returnMsg = "업무 :  " + taskTitle +"이/가 배정되었습니다. follower: "+ follower+ "입니다.";
		  }else
		  //완료
		  {
			  if( !taskAccept.equals(follower) )
				  returnMsg = "업무 :  " + taskTitle +"가 완료되었습니다.";
			  else
				  returnMsg = "업무 :  " + taskTitle +"가 완료되었습니다.";
		  }
		  
		  return returnMsg;
	}
}

