package com.zestworld.TemplateController;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.zestworld.Table_DTO.Template_DTO;
import com.zestworld.TemplateService.TemplateService;
import com.zestworld.util.DataController;

@Controller
public class TemplateController {
	
	
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private TemplateService service;
	
	@RequestMapping("TemplateUpload.htm")
	public String templateUpload(String title, String filesrc ,Model model ,HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
		
		String user_id = DataController.getInstance().GetUser().getUser_id();
		Template_DTO dto = new Template_DTO();
		dto.setTitle(title);
		dto.setFilesrc(filesrc);
		dto.setUser_id(user_id);
		
		int insert = service.insert(dto);
		System.out.println("insert :" + insert);
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> filenames = new ArrayList<String>();// 파일명만 추출

		if (files != null && files.size() > 0) {
			// 업로드한 파일이 하나라도 있다면
			for (CommonsMultipartFile multifile : files) {
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath(
						"/customer/upload");
				String fpath = path + "\\" + filename;
				System.out.println(filename + "/" + fpath);
				if (!filename.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename);// 실제 DB insert 할 파일명
			}
		}

		dto.setFilesrc(filenames.get(0));
		dto.setFilesrc2(filenames.get(1));

		
		model.addAttribute("insert", insert);
		/*model.addAttribute("getNotice" , getNotice);*/
		
		
		return "template.template";
		
		}
}
