package com.zestworld.fullcalendarController;

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

@Controller
public class fullcalendaController {

	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping(value= "/schedule.htm", method = RequestMethod.GET)
	public String schedule() throws ClassNotFoundException, SQLException {
		
		
		/*IFullCalendar fullcalendarDAO = sqlsession.getMapper(IFullCalendar.class);
		
		model.addAttribute("collabo_no", collabo_no);
		
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		
		List<Team_Users_DTO> user_id = fullcalendarDAO.selectTeam_id(dto.getUser_id());

		model.addAttribute("role_no", dto.getRole_no());
		model.addAttribute("team_id", user_id);
		model.addAttribute("finish_check", "0");
*/
		return "calendar.calendar";
	}
	
	//일정 추가(ajax 해야할듯)
	@RequestMapping(value= "/calendarAdd.htm", method = RequestMethod.POST)
	public String scheduleAdd() throws ClassNotFoundException, SQLException {
		
		
		/*IFullCalendar fullcalendarDAO = sqlsession.getMapper(IFullCalendar.class);
		
		model.addAttribute("collabo_no", collabo_no);
		
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		
		List<Team_Users_DTO> user_id = fullcalendarDAO.selectTeam_id(dto.getUser_id());

		model.addAttribute("role_no", dto.getRole_no());
		model.addAttribute("team_id", user_id);
		model.addAttribute("finish_check", "0");
*/
		return "calendar.calendar";
	}
	
	//일정삭제
	@RequestMapping(value= "/calendarDel.htm", method = RequestMethod.POST)
	public String scheduleDel() throws ClassNotFoundException, SQLException {
		
		
		/*IFullCalendar fullcalendarDAO = sqlsession.getMapper(IFullCalendar.class);
		
		model.addAttribute("collabo_no", collabo_no);
		
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		
		List<Team_Users_DTO> user_id = fullcalendarDAO.selectTeam_id(dto.getUser_id());

		model.addAttribute("role_no", dto.getRole_no());
		model.addAttribute("team_id", user_id);
		model.addAttribute("finish_check", "0");
*/
		return "calendar.calendar";
	}
	
	
}
