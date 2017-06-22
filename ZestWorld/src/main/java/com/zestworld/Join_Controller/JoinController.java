package com.zestworld.Join_Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.emailDTO.Email_DTO;
import com.zestworld.util.DataController;

@Controller
public class JoinController {

	@Autowired
	private JoinService service;

	@Autowired
	protected JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	/*
	 * @RequestMapping(value="join.htm" , method=RequestMethod.GET) public
	 * String join(){ System.out.println("회원가입페이지 요청(UI)");
	 * 
	 * //return "join.jsp"; return "joinus.join"; }
	 */

	@RequestMapping(value = "join.htm", method = RequestMethod.GET)
	public String join() {
		return "home/joinForm";
	}

	@RequestMapping(value = "join.htm", method = RequestMethod.POST)
	public String join(Users_DTO member) throws ClassNotFoundException, SQLException {

		String viewpage = "";
		member.setPassword(this.bCryptPasswordEncoder.encode(member.getPassword()));
		member.setName(member.getName());
		member.setPhone(member.getPhone());

		int result = service.insert(member);

		if (result > 0) {
			Role_DTO role = new Role_DTO();
			role.setUser_id(member.getUser_id());
			role.setAuthority_name("ROLE_USER");
			result = service.insertRoll(role);

			if (member.getUser_id().equals("admin")) {
				role = new Role_DTO();
				role.setUser_id(member.getUser_id());
				role.setAuthority_name("ROLE_ADMIN");
				result = service.insertRoll(role);
			}

			viewpage = "redirect:/index.htm"; // 경로를 이동시켜주는걸
		} else {
			System.out.println("삽입 실패");
			viewpage = "join.htm";
		}
		return "redirect:/index.htm";
	}

	@RequestMapping(value = "/sendpw.htm", method = RequestMethod.POST)
	public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, Users_DTO member) throws Exception {
		ModelAndView mav;

		// 난수 발생코드
		String Str = "";
		Random random = new Random();

		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		for (int i = 0; i < 5; i++) {
			Str += chars[random.nextInt(chars.length)];
		}
		String id = (String) paramMap.get("userid");
		String phone = (String) paramMap.get("phone");

		System.out.println(id);
		System.out.println(phone);

		Users_DTO updateMember = new Users_DTO();
		updateMember.setPassword(this.bCryptPasswordEncoder.encode(Str));
		updateMember.setUser_id(member.getUser_id());
		updateMember.setPhone(member.getPhone());

		int result = service.pwEdit(updateMember);
		System.out.println("mem " + member);

		if (result != 0) {

			Email_DTO email = new Email_DTO();
			email.setContent("비밀번호는 " + Str + " 입니다.");
			email.setReceiver(id);
			email.setSubject(id + "님 비밀번호 찾기 메일입니다.");
			SendEmail(email);
			mav = new ModelAndView("redirect:/index.htm");// 성공시
			return mav;

		} else {
			mav = new ModelAndView("redirect:/join.htm");// 실패시
			return mav;
		}
	}

	// 이메일 보내는
	public void SendEmail(Email_DTO email) throws Exception {

		MimeMessage msg = mailSender.createMimeMessage();

		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));

		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try {
			mailSender.send(msg);
		} catch (MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
	}

	// 회원정보 수정
	@RequestMapping(value = "/joinEdit.htm", method = RequestMethod.GET)
	public String GetUser(Model model) throws ClassNotFoundException, SQLException {

		Users_DTO users = DataController.getInstance().GetUser();
		model.addAttribute("member", users);

		return "home.joinEdit";
	}

	@RequestMapping(value = "/updateUser.htm", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam Map<String, Object> paramMap, Users_DTO member, HttpServletRequest request,
			ModelAndView mav, Model model) throws ClassNotFoundException, SQLException, IOException {
		String filename = member.getFile().getOriginalFilename();
		
		String path = request.getServletContext().getRealPath("upload");

		String fpath = path + "\\" + filename;
		System.out.println(fpath);
		System.out.println(filename);
		FileOutputStream fs = new FileOutputStream(fpath);
		fs.write(member.getFile().getBytes());
		fs.close();

		String password = (String) paramMap.get("password");
		String phone = (String) paramMap.get("phone");
		System.out.println(password);
		System.out.println(phone);
		Users_DTO updateMember = new Users_DTO();
		updateMember.setUser_id(member.getUser_id());
		updateMember.setName(member.getName());
		updateMember.setPassword(this.bCryptPasswordEncoder.encode(member.getPassword()));
		updateMember.setImg(filename);
		updateMember.setPhone(member.getPhone());

		System.out.println("1111");
		int result = service.updateUser(updateMember);
		if (result != 0) {
		DataController.getInstance().SetUserSavedata(updateMember);
			/*Users_DTO users = DataController.getInstance().GetUser();
			 model.addAttribute("member", users);*/
			// mav= new ModelAndView("");//성공시
		mav = new ModelAndView("redirect:joinEdit.htm");// 실패시
		return mav;

		} else {
			// 성공시
			// return mav;
			mav = new ModelAndView("redirect:joinEdit.htm");// 실패시
			return mav;
		}

	}

	//멤버 초대 로그인창
		@RequestMapping(value="/invitation.htm", method=RequestMethod.GET)	
		 public String memberInvitation () throws Exception {
		        return "home/loginOk";
		}
		
		
		//맴버 초대 이메일
		@RequestMapping(value = "/invitation.htm", method = RequestMethod.POST)
		public String invitation(@RequestParam Map<String, Object> paramMap,Workspace_DTO member,HttpServletRequest request,Model model) throws Exception {

			// mail 코드랑, 어떻게 보낼지 생각해보자 spring 이메일초대
			String path = "";
			String path2 ="http://localhost:8090/main/invitation.htm";
			//일단 로그인 페이지로 보내줌 로그인페이지에서 값을 받고 처리하자 
			
			//StringBuffer realpath = request.getRequestURL();
			//로그인 경로로 뿌려주고 로그인에서 ? 이것으로 프로잭트명,비싯 설정해서 넘겨줘라
			
			String id=(String) paramMap.get("userid"); //보내는 사람 아이디는 필요하니깐
			
			//여기만 처리 잘하면 될듯한데 여기만 넘기자
			/*Workspace_DTO workSpace= new Workspace_DTO();
			workSpace.setWorkspace_id(workSpace.getWorkspace_id());
			workSpace.setVisit_id(workSpace.getVisit_id());
			workSpace.setUser_id(workSpace.getUser_id());*/
			
			//List<Workspace_DTO> list= service.invitation(wo);
			//여기서 어떻게 뿌려줄까...
			
	/*		Users_DTO updateMember = new Users_DTO();
		    updateMember.setUserid(member.getUserid());
	*/	    
		    //어차피 mapper 태워서 누구한테 보냈다는 쿼리 작성해야함
			//디비가 필요 없을려나 경로만 보내주니깐
			//List<Workspace_DTO> result = service.invitation(member); //아이디를 찍어서 보내주기만하는 쿼리짜면될듯
			//로그인페이지에서 호출 생각!!
		    if (path2 != null) {
				
				Email_DTO email = new Email_DTO();
				email.setContent("초대이메일입니다."+ path2 + " 입니다.");
				email.setReceiver(id);
				email.setSubject(id+"님 멤버초대 메일입니다.");
				SendEmail(email);
			}
			//이것만 잘 설정하면 될거같은데
		   // model.addAttribute("workSpace",workSpace);
			return "task.workSpace";
		}
		
	

}
