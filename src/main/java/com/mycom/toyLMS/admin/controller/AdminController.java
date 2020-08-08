package com.mycom.toyLMS.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.toyLMS.admin.service.AdminService;
import com.mycom.toyLMS.member.dto.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	// 메인화면으로 이동
	@RequestMapping(value = "index")
	public String index(HttpSession session) {
		Member member = (Member)session.getAttribute("loginUserInfo");
		
		// 관리자가 아니거나, 로그인상태가 아니면 메인화면으로 돌려보냄
		if(!member.getGrade().equals("ADMIN") || session==null )
			return "redirect:/";
		
		return "index";
	}
	
	// 회원관리 페이지로 이동 (가입이 승인된 회원 목록만 표시)
	@RequestMapping(value = "memberList")
	public String memberList(Model model) {
		
		// 가입 승인된 회원 조회
		ArrayList<Member> memberList = aService.memberList();
		model.addAttribute("memberList", memberList);
		
		return "memberList";
	}
	
	// 가입요청 페이지로 이동(가입을 요청한 회원 목록 표시)
	@RequestMapping(value = "approvalList")
	public String approvalList(Model model) {
		
		// 가입요청한 목록 조회
		ArrayList<Member> approvalList = aService.approvalList();
		model.addAttribute("approvalList", approvalList);
		
		return "approvalList";
	}
	
	// 회원 승인(서비스)
	@RequestMapping(value = "doApproval")
	public String doApproval(@RequestParam("checked") String[] checkedList) {
		System.out.println("doApproval()");
		
		aService.approval(checkedList);
		
		return "forward:/admin/approvalList";
	}
	
	// 회원 거절(서비스)
	@RequestMapping(value = "reject")
	public String reject(@RequestParam("checked") String[] checkedList) {
		System.out.println("reject()");
		
		aService.reject(checkedList);
		
		return "forward:/admin/approvalList";
	}
}
