package com.zestworld.Join_Controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zestworld.Join_Service.JoinService;
import com.zestworld.Table_DTO.Role_DTO;
import com.zestworld.Table_DTO.Users_DTO;
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


}
