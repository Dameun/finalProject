package com.zestworld.TemplateController;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.zestworld.TemplateDAO.TemplateDAO;
import com.zestworld.AnalysisDAO.AnalysisDAO;
import com.zestworld.Table_DTO.Task_DTO;
import com.zestworld.Table_DTO.Template_DTO;
import com.zestworld.TemplateService.TemplateService;
import com.zestworld.util.DataController;

@Controller
public class TemplateController {
	
	
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private TemplateService service;


	//글쓰기(처리)
	@RequestMapping(value="templateUpload.htm" , method=RequestMethod.POST)
	public String noticeReg(Template_DTO n,HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
		 //다중 파일 업로드 처리
		 //view 단
		 //<input type="file" name="files[0]"
		 //<input type="file" name="files[1]"
		 //files[0] , files[1] 처리
		 //DTO > private List<CommonsMultipartFile> files;
		 //DTO 의 변수명과 input 태그 name 동일 자동화
		System.out.println("다중 파일 글 등록 처리");
		System.out.println("n :" + n.getTitle());
		System.out.println("n :" + n.getFiles().get(0).getName());
		System.out.println("n :" + n.getFiles().get(1).getName());
			
		List<CommonsMultipartFile> files = n.getFiles();	
		List<String> filenames = new ArrayList<String>();//파일명만 추출	
		
		if(files != null && files.size() > 0){
			//업로드한 파일이 하나라도 있다면
			for(CommonsMultipartFile multifile : files){
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/customer/upload");
				String fpath = path + "\\" + filename;
				System.out.println(filename + "/" + fpath);
				if(!filename.equals("")){
					//서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename);// 실제 DB insert 할 파일명
			}
		}
		

		
		TemplateDAO dao = sqlsession.getMapper(TemplateDAO.class);
		
		//DB작업
		n.setFilesrc(filenames.get(0));
		n.setFilesrc2(filenames.get(1));
		
		dao.insert(n);
		return "redirect:template.template";	
			
			
			/*  단일 파일 유효성 검증 없이 처리
			String filename = n.getFile().getOriginalFilename();
			String path = request.getServletContext().getRealPath("/customer/upload");
			
			String fpath = path + "\\" + filename;
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(n.getFile().getBytes());
			fs.close();
			
			//파일명 추가
			n.setFileSrc(filename);
			
			noticeDao.insert(n);
			return "redirect:notice.htm";
			*/
		    
			//주소창 주소 확인하기
			//return "notice.htm" > 요청 주소인경우 
			//결국 : @RequestMapping("notice.htm")
					//       public String notices{ }
					//       위 코드를 한번 실행해서 forward
			//http://localhost:8090/SpringMVC_Basic05_WebSite_Annotation/customer/noticeReg.htm
		
			//return "notice.jsp" > 인경우 
			//페이지만 만들어서 전송
			
			 
			//return "redirect:notice.htm";
			//http://localhost:8090/SpringMVC_Basic05_WebSite_Annotation/customer/notice.htm
			//F5 , 새로고침 처리 목록페이지 보여주도록 설정
			
			//location.href
			//response.sendredirect
			
			// POINT-1***********************************************
			// public String noticeReg(Notice n , HttpServletRequest request)
			// Parameter > Notice n 객체 타입
			// 글쓰기 화면 입력 > 함수(입력한 값)
			// 전제 : <input 태그 name="" 값하고 Notice 객체가 가지는 memberField명 같은 경우
			 
			// POINT-2***********************************************
			// Spring 에서 파일 업로드
			// 웹 서버 upload 폴더 : 파일올리기 (IO)
			// DB : 파일명만 가지면 된다
			
			//<Form 태그에 속성으로 : enctype="multipart/form-data">
			// 1.의존 lib 추가 (fileupload , io)
		    // 2. VO , DTO 쪽에Spring 제공하는
			// CommonsMultipartFile 타입을 갖는 멤버 변수 추가하기 (setter, getter)
			 
			// 3. 전송페이지에서 <form ... enctype="multipart/form-data" 설정
			// -<input type="file" name="file" 파일명 VO 객체 이름 동일 강제사항
			 
			// 4. xml container 에
			// ***CommonsMultipartFile 반드시> id="multipartResolver"***
			//<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver" >
			//   <property name="maxUploadSize" value="10485760"/>
			//</bean>

		}
	
	
	
	
	
	
	
	
/*	//멀티파일 업로드
	//MultipartHttpServletRequest를 이용한 업로드 파일 접근	
	@RequestMapping(value = "/fileUpload2",produces = "application/json") 
	@ResponseBody
	public HashMap<String, Object> fileUpload2(MultipartHttpServletRequest request) 
																		throws Exception{
	    
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		logger.info("타이틀:"+title);
		logger.info("설명:"+description);
		
		//출력 데이터를 저장하기위한 맵 객체 생성.
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		//업로드한 파일 리스트 얻어오기
		List<MultipartFile> mfList = request.getFiles("file");			
		logger.info("업로드 파일 개수:"+mfList.size()); 
		
		
		List<FileInfoModel> fileList = new ArrayList<FileInfoModel>();		
		
		for(MultipartFile mf:mfList){			
				
			logger.info("파라미터이름:"+mf.getName());
			logger.info("파일명:"+mf.getOriginalFilename());
			logger.info("파일사이즈:"+mf.getSize());
		    
			String name = mf.getName(); //필드 이름 얻기
			String fileName = mf.getOriginalFilename(); //파일명 얻기
			String contentType = mf.getContentType(); //컨텐츠 타입 얻기
		
			
			//업로드 파일명을 변경후 저장			
			String uploadedFileName = System.currentTimeMillis() 
					+ UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
		
		    String uploadPath = request.getSession().getServletContext().getRealPath("upload");
		    logger.info("실제 파일 업로드 경로 : "+uploadPath);
		    
		    //지정한주소에 파일 저장	    
		    if(mf.getSize() != 0) {	    	
		    	mf.transferTo(new File(uploadPath+"/"+uploadedFileName));	    	
		    }   
	
		    String downlink = "fileDownload2?of="+URLEncoder.encode(fileName,"UTF-8")
		    						+"&f="+URLEncoder.encode(uploadedFileName,"UTF-8");
		  
		    FileInfoModel file = new FileInfoModel(
		    							name, 
		    							fileName, 
		    							uploadedFileName,
		    							mf.getSize(),
		    							contentType,
		    							downlink);				  
		    fileList.add(file);
			
		}
		   
	    //응답할 데이터 저장
	    result.put("title", title);	    
	    result.put("description", description);
	    result.put("file", fileList);
	   	   
	    return result;
	}*/
	
	
	
	
	
	
	/*@RequestMapping("TemplateUpload.htm")
	public String templateUpload(String title, String filesrc, String user_id , Model model ,HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
		System.out.println("템블릿 컨트롤러 들어옴");
		String user_id = DataController.getInstance().GetUser().getUser_id();
		Template_DTO dto = new Template_DTO();
		
		dto.setTitle(title);
		dto.setFilesrc(filesrc);
		dto.setUser_id(user_id);
		dto.setFiles().set(0).getName();
		dto.setFiles().get(1).getName();
		
		System.out.println("dto.title :" + dto.getTitle());
		System.out.println("dto.filesrc :" + dto.getFilesrc());
		System.out.println("dto.user_id :" + dto.getUser_id());
		System.out.println("dto.getFiles().get(0).getName() :" + dto.getFiles().get(0).getName());
		System.out.println("dto.getFiles().get(0).getName() :" + dto.getFiles().get(1).getName());
		
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> filenames = new ArrayList<String>();// 파일명만 추출
		System.out.println("files!! = " + files);
		if (files != null && files.size() > 0) {
			// 업로드한 파일이 하나라도 있다면
			for (CommonsMultipartFile multifile : files) {
				String filename = multifile.getOriginalFilename();
				String path = request.getServletContext().getRealPath(
						"/customer/upload");
				String fpath = path + "\\" + filename;
				System.out.println(filename + "/" + path);
				if (!filename.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(path);
					fs.write(multifile.getBytes());
					fs.close();
				}
				filenames.add(filename);// 실제 DB insert 할 파일명
			}
		}

		dto.setFilesrc(filenames.get(0));
		dto.setFilesrc2(filenames.get(1));

		int insert = service.insert(dto);
		System.out.println("insert :" + insert);
		
		model.addAttribute("insert", insert);
		model.addAttribute("getNotice" , getNotice);
		
		
		return "template.template";
		
		}*/
}
