package com.zestworld.AnalysisController;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zestworld.AnalysisService.AnalysisService;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.util.DataController;

/*
 * @FileName : AjaxDataController.java
 * @Project : ZestWorld
 * @Date : 2017.06.25
 * @Author : 황이준
 * @Desc : chart data  
 * */

@Controller
public class AnalysisController {
	
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private AnalysisService service;
	/*
	@RequestMapping("/analysis.htm")
	public String analysis(Model model) throws ClassNotFoundException, SQLException{
		
		String userid = DataController.getInstance().GetUser().getUserid(); 
		System.out.println("!! @@ userid @@ !!"+userid);
		Task_DTO dto = new Task_DTO();
		dto.setUserid(userid);
		
		int getTaskMe_comp = service.getTaskMe_comp(dto);
		System.out.println("getTaskMe_comp :" + getTaskMe_comp);
		
		int getTaskMe_enddateLate = service.getTaskMe_enddateLate(dto);
		System.out.println("getTaskMe_enddateLate" + getTaskMe_enddateLate);
		
		int getTaskMe_enddateNo = service.getTaskMe_enddateNo(dto);
		System.out.println("getTaskMe_enddateNo" + getTaskMe_enddateNo);
		
		int getTaskMe_ing = service.getTaskMe_ing(dto);
		System.out.println("getTaskMe_ing" + getTaskMe_ing);
		
		
		
		int getTaskI_comp = service.getTaskI_comp(dto);
		System.out.println("getTaskI_comp :" + getTaskI_comp);
		
		int getTaskI_enddateLate = service.getTaskI_enddateLate(dto);
		System.out.println("getTaskI_enddateLate" + getTaskI_enddateLate);
		
		int getTaskI_enddateNo = service.getTaskI_enddateNo(dto);
		System.out.println("getTaskI_enddateNo" + getTaskI_enddateNo);
		
		int getTaskI_ing = service.getTaskI_ing(dto);
		System.out.println("getTaskI_ing" + getTaskI_ing);
		
		
		
		int getTaskFollow_comp = service.getTaskFollow_comp(dto);
		System.out.println("getTaskFollow_comp :" + getTaskFollow_comp);
		
		int getTaskFollow_enddateLate = service.getTaskFollow_enddateLate(dto);
		System.out.println("getTaskFollow_enddateLate" + getTaskFollow_enddateLate);
		
		int getTaskFollow_enddateNo = service.getTaskFollow_enddateNo(dto);
		System.out.println("getTaskFollow_enddateNo" + getTaskFollow_enddateNo);
		
		int getTaskFollow_ing = service.getTaskFollow_ing(dto);
		System.out.println("getTaskFollow_ing" + getTaskFollow_ing);
		
		
		model.addAttribute("userid" , userid);
		System.out.println("getTaskMe_comp" + getTaskMe_comp);
		model.addAttribute("getTaskMe_comp", getTaskMe_comp);
		model.addAttribute("getTaskMe_enddateLate", getTaskMe_enddateLate);
		model.addAttribute("getTaskMe_enddateNo", getTaskMe_enddateNo);
		model.addAttribute("getTaskMe_ing", getTaskMe_ing);
		
		model.addAttribute("getTaskI_comp", getTaskI_comp);
		model.addAttribute("getTaskI_enddateLate", getTaskI_enddateLate);
		model.addAttribute("getTaskI_enddateNo", getTaskI_enddateNo);
		model.addAttribute("getTaskI_ing", getTaskI_ing);
		
		model.addAttribute("getTaskFollow_comp", getTaskFollow_comp);
		model.addAttribute("getTaskFollow_enddateLate", getTaskFollow_enddateLate);
		model.addAttribute("getTaskFollow_enddateNo", getTaskFollow_enddateNo);
		model.addAttribute("getTaskFollow_ing", getTaskFollow_ing);
		
		
		return "analysis.analysis";
		
		}*/
	
	
	@RequestMapping("/chartAll.htm")
	public String analysisAll(Model model) throws ClassNotFoundException, SQLException{
		
		int getTaskAll = service.getTaskAll();
		System.out.println("getTaskAll :" + getTaskAll);
		
		int getTaskAll_comp = service.getTaskAll_comp();
		System.out.println("getTaskAll_comp :" + getTaskAll_comp);
		
		int getTaskAll_enddateLate = service.getTaskAll_enddateLate();
		System.out.println("getTaskAll_enddateLate" + getTaskAll_enddateLate);
		
		int getTaskAll_enddateNo = service.getTaskAll_enddateNo();
		System.out.println("getTaskAll_enddateNo" + getTaskAll_enddateNo);
		
		int getTaskAll_ing = service.getTaskAll_ing();
		System.out.println("getTaskAll_ing" + getTaskAll_ing);
		
		
		model.addAttribute("getTaskAll", getTaskAll );
		model.addAttribute("getTaskAll_comp", getTaskAll_comp);
		model.addAttribute("getTaskAll_enddateLate", getTaskAll_enddateLate);
		model.addAttribute("getTaskAll_enddateNo", getTaskAll_enddateNo);
		model.addAttribute("getTaskAll_ing", getTaskAll_ing);
		
		
		return "task.workSpace";
	
		}
	
	
	
	
}
