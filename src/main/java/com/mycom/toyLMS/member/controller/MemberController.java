package com.mycom.toyLMS.member.controller;

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
	@RequestMapping(value="login")
	public String loginForm() {
		return "login";
	}
	
	// 로그인 서비스
	@RequestMapping(value="signIn")
	public String signIn(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		// 로그인 화면에서 입력받은 값 확인
//		System.out.println(id);
//		System.out.println(pwd);
		
		Member member = mService.login(id, pwd);	// 로그인
		
		// 아이디와 비밀번호가 일치하고, 승인받은 회원일때 로그인 성송
		if(member!=null && member.getUse().equals("Y")) {
			System.out.println("로그인 성공");
			session.setAttribute("loginUserInfo", member);
			
			// 로그인한 아이디가 관리자이면 관리자 메인화면으로 이동
			if(member.getGrade().equals("ADMIN")) {
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
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		// 로그아웃 시 세션 해제
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원가입 페이지
	@RequestMapping(value="register")
	public String register() {
		return "register";
	}
	
	// 회원가입 서비스
	@RequestMapping(value="signUp")
	public String signUp(HttpServletRequest request) {
		System.out.println("signUp()");
		
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPwd(request.getParameter("pwd"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phone"));
		member.setMajor(request.getParameter("major"));
		
		mService.signUp(member);
		
		return "redirect:/member/login";
	}
	
	
}
