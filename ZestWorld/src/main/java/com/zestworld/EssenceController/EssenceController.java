package com.zestworld.EssenceController;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import com.zestworld.EssenceService.EssenceService;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.EssenceDefine_DTO;
import com.zestworld.Table_DTO.Project_DTO;
import com.zestworld.Table_DTO.Project_user_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.taskDAO.TaskDataDAO;
import com.zestworld.util.DataController;
/*
 * @FileName : IEssenceDAO.java
 * @Project : ZestWorld
 * Date : 2017.06.23
 * @Author : 장윤희
 * @Desc : 에센스 생성 및 저장 사용자 UX 정보제어
 */
@Controller
public class EssenceController {
	
	@Autowired
	private EssenceService  essenceService;
	
	@Autowired(required=false)
	private View jsonview; 
	
	@Autowired
	private SqlSession sqlsession;
	
	private String[] milestoneList = {};
	private String[] cateStrList = {"기회","이해관계자","요구사항","소프트웨어시스템","팀","작업방식","작업"};
	private HashMap<String, List<String>> selectEssenceMap = new HashMap();
	private ArrayList<HashMap> totalEssenceInfo = new ArrayList<HashMap>();
	private String p_title = "";
	private String explain = "";
	private String etcStr  = "";
	
	//마일스톤 저장페이지
	@RequestMapping(value="CreateEssenceMilestone.ajax", method=RequestMethod.GET)
	public View CreateEssenceMilestone (String milestoneContentStr,String p_title,String explain,
			String etcStr, Model model){
		milestoneList = milestoneContentStr.split(",");
		this.p_title = p_title;
		this.explain = explain;
		this.etcStr = "";
		
		for(int i=0; i<milestoneList.length; i++)
		{
			 selectEssenceMap.put(milestoneList[i], new ArrayList<String>());
		}
	
		String success = "success";
		model.addAttribute("success", success);
		return jsonview;
	}
	
	//마일스톤 클릭시
	@RequestMapping(value = "/CreateDefineSelectEssence.ajax", method = RequestMethod.GET)
	public String CreateDefineEssence(String milestoneIdx, HttpSession seesion) {
		int idx = Integer.parseInt(milestoneIdx);
		seesion.setAttribute("selectMilestone", milestoneList[idx]);
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	
	
	//마일스톤 및 카테고리 선택 화면 구성
	@RequestMapping(value="CreateEssenceData.ajax", method=RequestMethod.GET)
	public View CreateEssence ( Model model ) {
		
		EssenceDefine_DTO define_dto = new EssenceDefine_DTO();
		
		define_dto.setTitle(cateStrList[0]);
		List<EssenceDefine_DTO> defineist_0 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[1]);
		List<EssenceDefine_DTO> defineist_1 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[2]);
		List<EssenceDefine_DTO> defineist_2 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[3]);
		List<EssenceDefine_DTO> defineist_3 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[4]);
		List<EssenceDefine_DTO> defineist_4 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[5]);
		List<EssenceDefine_DTO> defineist_5 = essenceService.GetdefineCateList(define_dto);
		
		define_dto.setTitle(cateStrList[6]);
		List<EssenceDefine_DTO> defineist_6 = essenceService.GetdefineCateList(define_dto);
		
		model.addAttribute("milestoneList", milestoneList);
		model.addAttribute("cateStrList", cateStrList);
		model.addAttribute("defineist_0", defineist_0);	//기회
		model.addAttribute("defineist_1", defineist_1); //이해관계자
		model.addAttribute("defineist_2", defineist_2);	//요구사항
		model.addAttribute("defineist_3", defineist_3);	//소프트웨어시스템
		model.addAttribute("defineist_4", defineist_4);	//팀
		model.addAttribute("defineist_5", defineist_5); //작업방식
		model.addAttribute("defineist_6", defineist_6); //작업
		
		return jsonview;
	}
	
	//마일스톤 및 카테고리 선택 화면 구성
	@RequestMapping(value="cateDetailContent.ajax", method=RequestMethod.GET)
	public View SelectCateData (String checkboxid, Model model,HttpSession seesion) {
		
		String[] cateidArr = checkboxid.split("_");
		int id = Integer.parseInt(cateidArr[1]);
		EssenceDefine_DTO defineCate = new EssenceDefine_DTO();
		defineCate.setEcate_id(id);
		EssenceDefine_DTO define = essenceService.getDefineByid(defineCate);
		String[] defineDetailList = define.getContent().split("/");
		String defineDetailTitle = define.getSubTitle();
		//선택한 카드 디테일내용 보여주기
		model.addAttribute("defineDetailTitle", defineDetailTitle);
		model.addAttribute("defineDetailList", defineDetailList);

		return jsonview;
	}
	
	//마일스톤 선택완료시 데이터 저장
	@RequestMapping(value="selectCateSaveByMilstone.ajax", method=RequestMethod.GET)
	private String SelectEssenceDataSave( @RequestParam(value="results[]") List<String> arrayParams, HttpSession session)
	{
		String selectMilestone = (String)session.getAttribute("selectMilestone");
		selectEssenceMap.put(selectMilestone,arrayParams);
		
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	

	//에센스 완료 
	@RequestMapping(value="FinishCreateEssence.ajax", method=RequestMethod.GET)
	private String FinishCreateEssence( )
	{
		//프로젝트 생성하기 
		CreateProject("");
		//에센스 프로젝트 생성하기
		int eprojectId = CreateProject(p_title+"_Essence");
		//에센스 카테고리 만들기(유져가 입력한 마일스톤 명)
		CreateEsseceTask(eprojectId);
		return DataController.getInstance().GetviewPath("home") + "success.jsp";
	}
	
	
	private int CreateProject(String Essence)
	{
		int eProject=0;
		String user_id = DataController.getInstance().GetUser().getUser_id();
		TaskDataDAO taskDao = sqlsession.getMapper(TaskDataDAO.class);
		Project_DTO project = new Project_DTO();
		project.setWorkspace_id(DataController.getInstance().GetSelectWorkSpace().getWorkspace_id());

		if( Essence.length() >0)
		{
			project.setP_title(Essence);
			project.setEssence_f(Integer.parseInt("1"));
		}else
		{
			project.setP_title(p_title);
			project.setEssence_f(Integer.parseInt("0"));
		}
		
		project.setDescription(explain);
		project.setP_admin(DataController.getInstance().GetUser().getUser_id());
		// test
		project.setStart_date("2017-06-14");
		project.setEnd_date("2017-07-06");
		project.setAUTHORITY("0");
		project.setP_state("0");
		project.setMark_f(0);
		project.setOpen_f(0);
		
		taskDao.insertProject(project);
		Project_DTO projectNew = taskDao.GetProjectByname(project);
		Project_user_DTO projectUsers = new Project_user_DTO();
		projectUsers.setProject_id(projectNew.getProject_id());
		projectUsers.setUser_id(user_id);
	
		taskDao.InsertProjectUsers(projectUsers);

		DataController.getInstance().dataChangeProject();
		eProject = projectNew.getProject_id();
		return eProject;
	}
	

	private void CreateEsseceTask(int project_id)
	{
		//카테고리 만들기(유져가 입력한 마일스톤 명)
		Category_DTO cateDto;
		int result = 0;
		ArrayList<String> cataList = new ArrayList<String>();
		for( int i=0; i<milestoneList.length; i++)
		{
			cateDto =  new Category_DTO();
			cateDto.setTitle(milestoneList[i]);
			cateDto.setProject_id(project_id);
			essenceService.InsertECategory(cateDto);
			cataList = (ArrayList<String>) selectEssenceMap.get(milestoneList[i]);
			EssenceDefine_DTO define = new EssenceDefine_DTO();
			EssenceDefine_DTO defineNew = new EssenceDefine_DTO();
			Task_DTO task = new Task_DTO();
			//업무만들기 (유져가 선택한 카테고리 )
			for( int j=0; j< cataList.size(); j++)
			{
				String[] strArr = cataList.get(j).split("_");
				int idx = Integer.parseInt(strArr[0]);
				int cateidx = Integer.parseInt(strArr[1]);
				define.setEcate_id(cateidx);
				defineNew = essenceService.getDefineByid(define);
				String taskName = cateStrList[idx]+ ": "+defineNew.getSubTitle();
				String[] cheakList = defineNew.getContent().split("/");
				
				Category_DTO cateDtoNew= essenceService.getCategory(cateDto);
				task.setCategory_id(cateDtoNew.getCategory_id());
				task.setTitle(taskName);
				
				task.setUser_id(DataController.getInstance().GetUser().getUser_id());
				task.setProject_id(project_id);
				task.setWorkspace_id(DataController.getInstance().getCurrentWorkspace().getWorkspace_id());
				task.setEssence("1");
				task.setFollower(DataController.getInstance().GetUser().getUser_id());
				essenceService.tasktitleInsert(task);
			
				int taskID = essenceService.getMaxtaskId();
				CheckList_DTO dto;
				
				for( int k=0; k<cheakList.length; k++)
				{
					dto= new CheckList_DTO();
					dto.setContents(cheakList[k]);
					dto.setTask_id(taskID);	
					essenceService.checkListReg(dto);
				}
				
			
			}
		}
	
	}

}
















