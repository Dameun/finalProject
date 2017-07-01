package com.zestworld.fullcalendarController;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.fullcalendarDAO.CalendarDAO;
import com.zestworld.taskListDAO.taskListDao;
import com.zestworld.util.DataController;

@Controller
public class fullcalendarController {

	@Autowired
	public SqlSession sqlsession;

	@RequestMapping("Schedule.htm")
	public String schedule(Model model) throws ClassNotFoundException, SQLException {
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		Category_DTO cateDto = new Category_DTO();
		cateDto.setProject_id(project_id);
		
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		List<Category_DTO> list = dao.tasklist(cateDto);
		model.addAttribute("list",list);
		
		return "calendar.calendar";
	}
	
	
	@RequestMapping("calendarList.htm")
	public void calendarList(HttpServletResponse response) throws ClassNotFoundException, SQLException, ParseException{
		System.out.println("calendarList.htm접근");
		
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		String user_id = DataController.getInstance().GetUser().getUser_id();
		
		Task_DTO taskDto = new Task_DTO();
		
	
		taskDto.setProject_id(project_id);
		taskDto.setUser_id(user_id);
	
		System.out.println("프젝ID: "+taskDto.getProject_id());

		System.out.println("유저ID: "+taskDto.getUser_id());
		CalendarDAO dao = sqlsession.getMapper(CalendarDAO.class);
		
		List<Task_DTO> calendarList = dao.scheduleList(taskDto);
		
		JSONArray array = new JSONArray();
		
		for(int i =0; i<calendarList.size();i++){
			
			JSONObject obj =new JSONObject();
			String start = calendarList.get(i).getStart_date();
			String end = calendarList.get(i).getEnd_date();
			obj.put("title", calendarList.get(i).getTitle());
			obj.put("explain", calendarList.get(i).getExplain());
			obj.put("start",start);
			
		
			SimpleDateFormat sformat = new SimpleDateFormat("yyyy-mm-dd");	
			Calendar cdar = Calendar.getInstance();
			Date date = sformat.parse(end);
			
			cdar.setTime(date);
			cdar.add(Calendar.DATE, +1);
			end = sformat.format(cdar.getTime());
			
			obj.put("end", end);
			
			array.add(obj);
			
			System.out.println(array);
			
		}
		
		try{
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(array);
		}catch(Exception e){
			e.printStackTrace();
		}
		
}
	
	
	//일정 추가
	@RequestMapping("CalendarIns.htm")
	public String scheduleInsert(int cateID, String title, String content, String start_date, String end_date) throws ClassNotFoundException, SQLException {
		
		System.out.println("카테고리 아이디 : " + cateID);
		System.out.println("업무제목 : " + title);
		System.out.println("설명 : " + content);
		System.out.println("시작날짜 : " + start_date);
		System.out.println("끝날짜 : " + end_date);
		
		
		
		taskListDao tdao = sqlsession.getMapper(taskListDao.class);
		CalendarDAO cdao = sqlsession.getMapper(CalendarDAO.class);
		
		String user_id =DataController.getInstance().getCurrentWorkspace().getUser_id();
		int workspace_id = DataController.getInstance().getCurrentProject().getWorkspace_id();
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		
		Task_DTO dto = new Task_DTO();
			
		dto.setCategory_id(cateID);
		dto.setUser_id(user_id);
		dto.setWorkspace_id(workspace_id);
		dto.setProject_id(project_id);
		dto.setTitle(title);
		dto.setExplain(content);
		dto.setStart_date(start_date);
		dto.setEnd_date(end_date);
		
		cdao.scheduleInsert(dto);
		System.out.println("일정추가 컨트롤러 접근");
		return "calendar.calendar";
	}
	
	
	
	
	//일정삭제
	@RequestMapping("CalendarDel.htm")
	public String scheduleDel(String title, String content) throws ClassNotFoundException, SQLException {
		

		
		System.out.println("컨텐츠 : "+content);
		CalendarDAO dao = sqlsession.getMapper(CalendarDAO.class);
		
		Task_DTO dto = new Task_DTO();
		dto.setTitle(title);
		dto.setExplain(content);
		
		dao.scheduleDelete(dto);
		
		return "calendar.calendar";
	}
	
	
}
