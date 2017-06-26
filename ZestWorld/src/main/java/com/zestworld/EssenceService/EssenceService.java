package com.zestworld.EssenceService;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zestworld.Essence_DAO.IEssenceDAO;
import com.zestworld.Table_DTO.Category_DTO;
import com.zestworld.Table_DTO.EssenceDefine_DTO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.taskListDAO.taskListDao;

@Service
public class EssenceService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<EssenceDefine_DTO> GetdefineList(){
		IEssenceDAO dao = sqlsession.getMapper(IEssenceDAO.class);
		List<EssenceDefine_DTO> list= dao.getDefineAllList();
		return list;
	}
	
	public List<EssenceDefine_DTO> GetdefineCateList(EssenceDefine_DTO essenceDefine_DTO){
		IEssenceDAO dao = sqlsession.getMapper(IEssenceDAO.class);
		List<EssenceDefine_DTO> list = dao.getDefineCateList(essenceDefine_DTO);
		return list;
	}
	
	public EssenceDefine_DTO getDefineByid(EssenceDefine_DTO essenceDefine_DTO){
		IEssenceDAO dao = sqlsession.getMapper(IEssenceDAO.class);
		EssenceDefine_DTO cate= dao.getDefineByid(essenceDefine_DTO);
		return cate;
	}	
	
	public Category_DTO getCategory(Category_DTO category_DTO){
		IEssenceDAO dao = sqlsession.getMapper(IEssenceDAO.class);
		Category_DTO cate= dao.getCategory(category_DTO);
		return cate;
	}	
	
	public void tasktitleInsert(Task_DTO dto){
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		dao.tasktitleInsert(dto);
	}

	public int InsertTask(Task_DTO task_DTO){
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		dao.tasktitleInsert(task_DTO);
		return 1;
	}	
	
	public int InsertECategory(Category_DTO category_DTO){
		taskListDao dao = sqlsession.getMapper(taskListDao.class);
		try {
			dao.titleInsert(category_DTO);
		} catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}	
}
