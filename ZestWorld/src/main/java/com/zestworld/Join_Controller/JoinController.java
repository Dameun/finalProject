package com.zestworld.Join_Controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;

@Controller
public class JoinController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JoinService service;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
/*	@RequestMapping(value="join.htm" , method=RequestMethod.GET)
	public String join(){
		System.out.println("회원가입페이지 요청(UI)");
		
		//return "join.jsp";
		  return "joinus.join";
	}
	*/
	
	@RequestMapping(value="join.htm",method=RequestMethod.GET)
	public String join(){
		return "home/joinForm";
	}
	
	@RequestMapping(value="join.htm" , method=RequestMethod.POST)
	public String join(Users_DTO member) throws ClassNotFoundException, SQLException{
	
		String viewpage = "";
		member.setPassword(this.bCryptPasswordEncoder.encode(member.getPassword()));

		int result = service.insert(member);
		
		if (result > 0) {
			Role_DTO role = new Role_DTO();
			role.setUserid (member.getUserid());
			role.setAuthority_name("ROLE_USER");
			result = service.insertRoll(role);
			
			if(member.getUserid().equals("admin")){
				role = new Role_DTO();
				role.setUserid (member.getUserid());
				role.setAuthority_name("ROLE_ADMIN");
				result = service.insertRoll(role);	
			}

			viewpage = "redirect:/index.htm"; //경로를 이동시켜주는걸
		} else {
			System.out.println("삽입 실패");
			viewpage = "join.htm";
		}
		return "redirect:/index.htm";
	}
	
}
















