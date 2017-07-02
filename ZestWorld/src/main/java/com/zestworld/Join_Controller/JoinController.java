package com.zestworld.Join_Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.zestworld.Join_DAO.JoinDAO;
import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Email_DTO;
import com.zestworld.Table_DTO.Mail_DTO;
import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.UserState_DTO;
import com.zestworld.Table_DTO.Users_DTO;
import com.zestworld.Table_DTO.Workspace_DTO;
import com.zestworld.userStateService.UserStateService;
import com.zestworld.util.DataController;
/*
* @FileName : JoinController.java
* @Project : ZestWorld
* @Date : 2017. 6. 28.
* @Author : 양건휘
* @Desc : 회원가입, 회원 수정
*/
@Controller
public class JoinController {

	@Autowired
	private VelocityEngine velocityEngine;

	@Autowired
	private JoinService service;

	@Autowired
	protected JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private UserStateService userstateService;
	
	@Autowired(required = false)
	private View jsonview;
	
	@Autowired
	public SqlSession sqlsession;

	@RequestMapping(value = "join.htm", method = RequestMethod.GET)
	public String join() {
		return "home/joinForm";
	}

	@RequestMapping(value = "join.htm", method = RequestMethod.POST)
	public String join(Users_DTO member,Model model) throws ClassNotFoundException, SQLException {

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
				
				//userState도 생성
				UserState_DTO userState = new UserState_DTO();
				userState.setState("업무중");
				userState.setUser_id(member.getUser_id());
				userState.setUser_name(member.getName());
				userstateService.InsertUserState(userState);
			}

			viewpage = "redirect:/index.htm"; // 경로를 이동시켜주는걸
		} else {
			System.out.println("삽입 실패");
			viewpage = "join.htm";
		}
		return "redirect:/index.htm";
	}
	
	//아이디 중복 확인
		
	@RequestMapping("/idchk.ajax")
	public String idchk(Users_DTO user,@RequestParam String user_id) throws ClassNotFoundException, SQLException{
		/*String wid = DataController.getInstance().GetUser().getUser_id();*/
		
		/*JoinDAO dao = sqlsession.getMapper(JoinDAO.class);
		Users_DTO dto = dao.selectId(wid);*/
		
		Users_DTO Member = new Users_DTO();
		Member.setUser_id(user.getUser_id());
		
		String result = service.selectId(Member);
		System.out.println(user_id);
		if (result != null) {
			//model.addAttribute("loginsuccess", "success");
			return "yes";
		}else{
			return "no";
		}
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

		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		MimeMessage msg = mailSender.createMimeMessage();
		String path2 = "http://localhost:8081/main/invitation.htm?workspace_id=" + workspace_id;
		try {

			// MimeMessageHelper messageHelper = new MimeMessageHelper(msg,
			// true, "UTF-8");
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
			msg.setHeader("content-type", "text/html;charset=utf-8");
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
	public String update(@RequestParam Map<String, Object> paramMap, Users_DTO member, HttpServletRequest request)
			throws ClassNotFoundException, SQLException, IOException {
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

		updateMember.setImg(filename);
		updateMember.setPhone(member.getPhone());

		int result = service.updateUser(updateMember);
		if (result != 0) {
			DataController.getInstance().SetUserSavedata(updateMember);

			return "home.main";// 성공시

		} else {

			// 실패시
			return "redirect:/joinEdit.htm";
		}

	}

	// 멤버 초대 로그인창
	@RequestMapping(value = "/invitation.htm", method = RequestMethod.GET)
	public String memberInvitation(String workspace_id, HttpSession session) throws Exception {

		session.setAttribute("workspace_id", workspace_id);
		return "home/loginOk";
	}

	// 맴버 초대 이메일
	@RequestMapping(value = "/invitationSend.htm", method = RequestMethod.GET)
	/*public View invitation(HttpServletRequest request, Model model, @RequestParam String userid) throws Exception {*/
	public View invitation(Model model, String email) throws Exception {
		
		//int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		Mail_DTO mail = new Mail_DTO();
		
		String my =DataController.getInstance().GetUser().getUser_id();
		/*String path2 = "http://localhost:8081/main/invitation.htm?workspace_id=" + workspace_id;
*/
		/*String id = (String) paramMap.get("userid"); // 보내는 사람 아이디는 필요하니깐
*/
		mail.setMailFrom("rorkxso@gmail.com");// 보내는 사람
		mail.setMailTo(email);// 입력시 가는놈
		mail.setMailSubject(my+"님이" + "ZESTWORLD와 함께하길 원합니다.");
		
		sendMail(mail);
		model.addAttribute("success","success");
		return jsonview;
	}

	// 벨로이메일
	public void sendMail(Mail_DTO mail) throws Exception {

		int workspace_id = DataController.getInstance().getCurrentWorkspace().getWorkspace_id();
		String path2 = "http://localhost:8081/main/invitation.htm?workspace_id=" + workspace_id;
		String wid = DataController.getInstance().GetUser().getUser_id();
		String name = DataController.getInstance().GetUser().getName();
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true,"utf-8");
		
		helper.setFrom(mail.getMailFrom());
		helper.setTo(mail.getMailTo());
		helper.setSubject(mail.getMailSubject());

		Template template = velocityEngine.getTemplate("val/val.vm");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("path", path2);
		velocityContext.put("id", wid);
		velocityContext.put("name", name);
		StringWriter stringWriter = new StringWriter();
		template.merge(velocityContext, stringWriter);
		helper.setText(stringWriter.toString(),true);
		mailSender.send(message);

	}

	
}
