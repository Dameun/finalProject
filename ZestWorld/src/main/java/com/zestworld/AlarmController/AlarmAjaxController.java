package com.zestworld.AlarmController;

import java.sql.SQLException;
import java.util.ArrayList;
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
 * @FileName : AlarmDAO.java
 * @Project : ZestWorld
 * @Date : 2017.06.18
 * @Author : �옣�쑄�씗
 * @Desc : �븣�엺 而⑦듃濡ㅻ윭( 	alarmList.ajax �븣�엺由ъ뒪�듃 議곗쇅/
 * 					 	alarmCount.ajax �븣�엺 移댁슫�듃 議고쉶/ 
 * 						updateAlarm.ajax �겢由��떆 移댁슫�듃 蹂�寃� / 
 * 						newAlarm �븣�엺�떆 DB泥섎━ )
 */
@Controller
public class AlarmAjaxController {

	@Autowired
	private AlarmService service;
	
	@Autowired(required=false)
	private View jsonview; 
	
	
	//�븣�엺 由ъ뒪�듃
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
	
	//�븣�엺 移댁슫�듃 �닔 蹂�寃�
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
		
	
	//�뱶濡�諛뺤뒪 �겢由��떆 �븞�씫�� �븣�엺�뱾 -> �씫�� �븣�엺�쑝濡� db�닔�젙 
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
	
	//�깉 �븣�엺�떆 DB���옣 default �븞�씫�� ���엯
	@RequestMapping(value="newAlarm.ajax", method = RequestMethod.POST)
    public @ResponseBody String newAlarm(@RequestParam(value="newAlarm") String newAlarm,Model model)
            throws ClassNotFoundException, SQLException{
		 
		  String[] alarmIdArr={};
		  String[] msgArr = newAlarm.split("/");
		  int alarmType 	= Integer.parseInt(msgArr[0]);
		  String follower 	= msgArr[3];
		  
		  //�븡�씫�� db濡� ���옣�븯怨�  �븣�엺 移댁슫�듃 �삱�젮二쇨린 
		  Alarm_DTO alarm = new Alarm_DTO();
		  alarm.setAlarm_type(alarmType);
		  alarm.setCheck_f(0);
		  alarm.setImg("img");
		  alarm.setUser_id(msgArr[3]);
		  alarm.setAcceptUsers(msgArr[2]);
		  alarm.setAlarmTitle(alarmStrMak(newAlarm));
		  service.insert(alarm);

		  String success = "success";
		  model.addAttribute("success", success);
	      return success;
	}
	
	//e�븣�엺 stirng 留뚮뱾湲� 
	private String alarmStrMak(String newAlarm)
	{
		  String[] msgArr = newAlarm.split("/");
		  String alarmType 	= msgArr[0];
		  String taskTitle 	= msgArr[1];
		  String follower 	= msgArr[3];
		  String userId		= DataController.getInstance().GetUser().getUser_id();
		  String returnMsg = "";
		
		  //업무 배정시 
		  if( alarmType.equals("0"))
		  {
			  if( userId.equals(follower) )
				  returnMsg = "업무 :  " + taskTitle +"가 배정되었습니다. ";
			  else
				  returnMsg = "업무 :  " + taskTitle +"가 배정되었습니다. follower: "+ follower+ "입니다.";
		  }/*else
		  //완료
		  {
			  if( !writer.equals(userId) )
				  returnMsg = "�뾽臾� "+ taskTitle+ "瑜� �셿猷뚰븯���뒿�땲�떎.";
			  else
				  returnMsg = writer+"�떂�씠" +"�뾽臾대�� �셿猷뚰븯���뒿�땲�떎.";
		  }*/
		  
		  return returnMsg;
	}
}

