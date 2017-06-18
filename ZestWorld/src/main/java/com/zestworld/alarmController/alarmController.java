package com.zestworld.alarmController;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zestworld.util.DataController;

@Controller
public class alarmController {

	@Autowired
	private SqlSession sqlsession;
	
	//새 알람시 DB저장 default 안읽은 타입
	@RequestMapping(value="newAlarm.htm", method = RequestMethod.POST)
    public String newAlarm(@RequestParam(value="newAlarm") String newAlarm,HttpSession session)
            throws ClassNotFoundException, SQLException{
		
			
	      return "newAlarm";
	      
	}
}
