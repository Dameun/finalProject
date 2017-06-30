package com.zestworld.Essence_DAO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.zestworld.Table_DTO.Alarm_DTO;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.CheckList_DTO;
import com.zestworld.Table_DTO.EssenceDefine_DTO;
import com.zestworld.Table_DTO.Task_DTO;

public interface IEssenceDAO {
	
	//카케고리 정의서 가져오기
	public Category_DTO getCategory(Category_DTO categoryDto);
	public List<EssenceDefine_DTO> getDefineAllList();
	public List<EssenceDefine_DTO> getDefineCateList(EssenceDefine_DTO essenceDefine_DTO);
	public EssenceDefine_DTO getDefineByid(EssenceDefine_DTO essenceDefine_DTO);
	public int getTask(Task_DTO task_DTO);
	public int checkListReg(CheckList_DTO checkList_DTO);
}
