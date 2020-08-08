package com.mycom.toyLMS.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.toyLMS.member.dto.Member;

@Controller
public class AdminController {
	
	// 메인화면으로 이동
	@RequestMapping(value = "index")
	public String index(HttpSession session) {
		Member member = (Member)session.getAttribute("loginUserInfo");
		
		// 관리자가 아니거나, 로그인상태가 아니면 메인화면으로 돌려보냄
		if(!member.getGrade().equals("ADMIN") || session==null )
			return "redirect:/";
		
		return "index";
	}
}
