package com.zestworld.AjaxController;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zestworld.AnalysisService.AnalysisService;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.util.DataController;

/*
 * @FileName : AjaxDataController.java
 * @Project : ZestWorld
 * @Date : 2017.06.25
 * @Author : 황이준
 * @Desc : chart data  
 * */
@Controller
public class AjaxChartController {

	/* CHART(ALL) */	
	//DATA 
	@Autowired
	private AnalysisService analysisService;
	//나에게 배정된 도넛차트_01
	int getTaskMe_comp;
	int getTaskMe_enddateLate;
	int getTaskMe_enddateNo;
	int getTaskMe_ing;
	//나에게 배정된 도넛차트_02
	int getTaskI_comp;
	int getTaskI_enddateLate;
	int getTaskI_enddateNo;
	int getTaskI_ing;
	//나에게 배정된 도넛차트_03
	int getTaskFollow_comp;
	int getTaskFollow_enddateLate;
	int getTaskFollow_enddateNo;
	int getTaskFollow_ing;
	//바차트
	List<Task_DTO> getTaskAllFlow_comp = new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_comp_count ;
	List<Task_DTO> getTaskAllFlow_enddateLate_count= new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_enddateNo_count= new ArrayList<Task_DTO>();
	List<Task_DTO> getTaskAllFlow_ing_count= new ArrayList<Task_DTO>();
	 
	@RequestMapping(value="/analysis.ajax", method=RequestMethod.GET)
	public String analysis(Model model) throws ClassNotFoundException, SQLException
	{	
		
		String user_id = DataController.getInstance().GetUser().getUser_id(); 
		System.out.println("!! @@ user_id @@ !!"+ user_id);
		Task_DTO dto = new Task_DTO();
		Users_DTO dto2 = new Users_DTO();
		
		dto.setUser_id(user_id);
		donutChart_01(user_id);
		donutChart_02(user_id);
		donutChart_03(user_id);
		barChart();
		
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
		
		model.addAttribute("getTaskAllFlow_comp", getTaskAllFlow_comp );
		model.addAttribute("getTaskAllFlow_comp_count", getTaskAllFlow_comp_count);
		model.addAttribute("getTaskAllFlow_enddateLate_count", getTaskAllFlow_enddateLate_count);
		model.addAttribute("getTaskAllFlow_enddateNo_count", getTaskAllFlow_enddateNo_count);
		model.addAttribute("getTaskAllFlow_ing_count", getTaskAllFlow_ing_count);
		
		return DataController.getInstance().GetviewPath("analysis")+"analysisAll.jsp";
	}	
	
	private void donutChart_01(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
 
		getTaskMe_comp = analysisService.getTaskMe_comp(dto);
	    getTaskMe_enddateLate = analysisService.getTaskMe_enddateLate(dto);
		getTaskMe_enddateNo = analysisService.getTaskMe_enddateNo(dto);
		getTaskMe_ing = analysisService.getTaskMe_ing(dto);
	}
	
	private void donutChart_02(String user_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
	
		 getTaskI_comp = analysisService.getTaskI_comp(dto);
		 getTaskI_enddateLate = analysisService.getTaskI_enddateLate(dto);
		 getTaskI_enddateNo = analysisService.getTaskI_enddateNo(dto);
		 getTaskI_ing = analysisService.getTaskI_ing(dto);
	}
	
	
	private void donutChart_03(String user_id) throws ClassNotFoundException, SQLException
	{
		 Task_DTO dto = new Task_DTO();
		 dto.setUser_id(user_id);
	
		 getTaskFollow_comp = analysisService.getTaskFollow_comp(dto);
		 getTaskFollow_enddateLate = analysisService.getTaskFollow_enddateLate(dto);
		 getTaskFollow_enddateNo = analysisService.getTaskFollow_enddateNo(dto);
		 getTaskFollow_ing = analysisService.getTaskFollow_ing(dto);
	}

	
	private void barChart()throws ClassNotFoundException, SQLException
	{
		getTaskAllFlow_comp = analysisService.getTaskAllFlow_comp();
		getTaskAllFlow_comp_count = analysisService.getTaskAllFlow_comp_count();
		
		getTaskAllFlow_enddateLate_count = analysisService.getTaskAllFlow_enddateLate_count();
		getTaskAllFlow_enddateNo_count = analysisService.getTaskAllFlow_enddateNo_count();
		getTaskAllFlow_ing_count = analysisService.getTaskAllFlow_ing_count();
	}
	
	/* CHART(USER) */	

	int getTaskMe_compU;
	int getTaskMe_enddateLateU;
	int getTaskMe_enddateNoU;
	int getTaskMe_ingU;
	//나에게 배정된 도넛차트_02
	int getTaskI_compU;
	int getTaskI_enddateLateU;
	int getTaskI_enddateNoU;
	int getTaskI_ingU;
	//나에게 배정된 도넛차트_03
	int getTaskFollow_compU;
	int getTaskFollow_enddateLateU;
	int getTaskFollow_enddateNoU;
	int getTaskFollow_ingU;
	//바차트
	List<Task_DTO> getTaskAllFlow_compU ;
	List<Task_DTO> getTaskAllFlow_comp_countU ;
	List<Task_DTO> getTaskAllFlow_enddateLate_countU;
	List<Task_DTO> getTaskAllFlow_enddateNo_countU;
	List<Task_DTO> getTaskAllFlow_ing_countU;	
	
	@RequestMapping(value="/analysisU.ajax", method=RequestMethod.GET)
	public String analysisU(Model model) throws ClassNotFoundException, SQLException
	{	
		
		String user_id = DataController.getInstance().GetUser().getUser_id(); 
		int project_id = DataController.getInstance().getCurrentProject().getProject_id();
		
		
		System.out.println("!! @@ user_id @@ !!"+ user_id);
		Task_DTO dto = new Task_DTO();
		Users_DTO dto2 = new Users_DTO();
		
		dto.setUser_id(user_id);
		dto.setProject_id(project_id);
		System.out.println(" @project_id 는 :" + project_id);
		
		donutChartU_01(user_id,project_id);
		donutChartU_02(user_id,project_id);
		donutChartU_03(user_id,project_id);
		barChartU(project_id);
		
		model.addAttribute("getTaskMe_compU", getTaskMe_compU);
		model.addAttribute("getTaskMe_enddateLateU", getTaskMe_enddateLateU);
		model.addAttribute("getTaskMe_enddateNoU", getTaskMe_enddateNoU);
		model.addAttribute("getTaskMe_ingU", getTaskMe_ingU);
		
		model.addAttribute("getTaskI_compU", getTaskI_compU);
		model.addAttribute("getTaskI_enddateLateU", getTaskI_enddateLateU);
		model.addAttribute("getTaskI_enddateNoU", getTaskI_enddateNoU);
		model.addAttribute("getTaskI_ingU", getTaskI_ingU);
		
		model.addAttribute("getTaskFollow_compU", getTaskFollow_compU);
		model.addAttribute("getTaskFollow_enddateLateU", getTaskFollow_enddateLateU);
		model.addAttribute("getTaskFollow_enddateNoU", getTaskFollow_enddateNoU);
		model.addAttribute("getTaskFollow_ingU", getTaskFollow_ingU);
		
		model.addAttribute("getTaskAllFlow_compU", getTaskAllFlow_compU );
		model.addAttribute("getTaskAllFlow_comp_countU", getTaskAllFlow_comp_countU);
		model.addAttribute("getTaskAllFlow_enddateLate_countU", getTaskAllFlow_enddateLate_countU);
		model.addAttribute("getTaskAllFlow_enddateNo_countU", getTaskAllFlow_enddateNo_countU);
		model.addAttribute("getTaskAllFlow_ing_countU", getTaskAllFlow_ing_countU);
		
		
		
		return DataController.getInstance().GetviewPath("analysis")+"analysis2.jsp";
	}	
	
	private void donutChartU_01(String user_id , int project_id) throws ClassNotFoundException, SQLException
	{	
		
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
		dto.setProject_id(project_id);
		System.out.println("project_id 담은바보 : " + project_id);
		getTaskMe_compU = analysisService.getTaskMe_compU(dto);
		System.out.println("getTaskMe_compU****** : " + getTaskMe_compU);
	    getTaskMe_enddateLateU = analysisService.getTaskMe_enddateLateU(dto);
		getTaskMe_enddateNoU = analysisService.getTaskMe_enddateNoU(dto);
		getTaskMe_ingU = analysisService.getTaskMe_ingU(dto);
		
	}
	
	private void donutChartU_02(String user_id , int project_id) throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		dto.setUser_id(user_id);
		dto.setProject_id(project_id);
		 getTaskI_compU = analysisService.getTaskI_compU(dto);
		 getTaskI_enddateLateU = analysisService.getTaskI_enddateLateU(dto);
		 getTaskI_enddateNoU = analysisService.getTaskI_enddateNoU(dto);
		 getTaskI_ingU = analysisService.getTaskI_ingU(dto);		 
	}
	
	
	private void donutChartU_03(String user_id , int project_id) throws ClassNotFoundException, SQLException
	{
		 Task_DTO dto = new Task_DTO();
		 dto.setUser_id(user_id);
		 dto.setProject_id(project_id);
		 
		 
		 getTaskFollow_compU = analysisService.getTaskFollow_compU(dto);
		 getTaskFollow_enddateLateU = analysisService.getTaskFollow_enddateLateU(dto);
		 getTaskFollow_enddateNoU = analysisService.getTaskFollow_enddateNoU(dto);
		 getTaskFollow_ingU = analysisService.getTaskFollow_ingU(dto);
		 
	}

	
	private void barChartU(int project_id)throws ClassNotFoundException, SQLException
	{
		Task_DTO dto = new Task_DTO();
		System.out.println("바차트안" + project_id);  
		dto.setProject_id(project_id);
		System.out.println("바차트유저아이디 " +dto.getProject_id());
		
		getTaskAllFlow_compU = analysisService.getTaskAllFlow_compU(project_id);
		getTaskAllFlow_comp_countU = analysisService.getTaskAllFlow_comp_countU(project_id);
		
		getTaskAllFlow_enddateLate_countU = analysisService.getTaskAllFlow_enddateLate_countU(project_id);
		getTaskAllFlow_enddateNo_countU = analysisService.getTaskAllFlow_enddateNo_countU(project_id);
		getTaskAllFlow_ing_countU = analysisService.getTaskAllFlow_ing_countU(project_id);		
		
	}
}
