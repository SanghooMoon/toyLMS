package com.mycom.toyLMS.member.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.toyLMS.member.dto.Member;
import com.mycom.toyLMS.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	// 로그인 페이지로 이동
	@RequestMapping(value = "login")
	public String loginForm() {
		return "login";
	}

	// 로그인 서비스
	@RequestMapping(value = "signIn")
	public String signIn(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		// 로그인 화면에서 입력받은 값 확인
//		System.out.println(id);
//		System.out.println(pwd);

		Member member = mService.login(id, pwd); // 로그인

		// 아이디와 비밀번호가 일치하고, 승인받은 회원일때 로그인 성송
		if (member != null && member.getUse().equals("Y")) {
			System.out.println("로그인 성공");
			session.setAttribute("loginUserInfo", member);

			// 로그인한 아이디가 관리자이면 관리자 메인화면으로 이동
			if (member.getGrade().equals("ADMIN")) {
				return "redirect:/admin/index";
			} else {
				return "redirect:/";
			}

		} else {
			System.out.println("로그인 실패");
			return "login";
		}
	}

	// 로그아웃 서비스
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 로그아웃 시 세션 해제
		session.invalidate();

		return "redirect:/";
	}

	// 회원가입 페이지
	@RequestMapping(value = "register")
	public String register() {
		return "register";
	}

	// 회원가입 서비스
	@RequestMapping(value = "signUp")
	public String signUp(HttpServletRequest request) {
		System.out.println("signUp()");

		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPwd(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phone"));
		member.setMajor(request.getParameter("major"));
		member.setEmail(request.getParameter("email"));

		mService.signUp(member);

		return "redirect:/member/login";
	}
	
	// 메일전송
	@RequestMapping("sendMail")
	public void sendEmail(@RequestParam("email") String email) throws Exception{
		
	    System.out.println(email);   
		
	    
		//메일 관련 정보 
        String host = "smtp.naver.com"; 
        final String username = "***"; 	//네이버 이메일 주소중 @ naver.com 앞주소만 작성
        final String password = "***"; 			//네이버 이메일 비밀번호를 작성
        int port=587;                      				//네이버 STMP 포트 번호
        
        //메일 내용 
        String recipient = "fladb25@naver.com";			 //메일을 발송할 이메일 주소를 기재해 줍니다.
        String subject = "테스트 이메일입니다.";   			 //메일 발송시 제목을 작성
        String body = "인증번호: 12345"; 					//메일 발송시 내용 작성
        
        Properties props = System.getProperties();
       
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "false");	
        props.put("mail.smtp.ssl.trust", host);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
            String un=username;
            String pw=password; 
            protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication(un, pw); 
            } 
        });
        session.setDebug(true); //for debug 
        
        Message mimeMessage = new MimeMessage(session); 
        mimeMessage.setFrom(new InternetAddress("***@naver.com")); 
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
        mimeMessage.setSubject(subject); 
        mimeMessage.setText(body); 
        Transport.send(mimeMessage);
        
    }
}
