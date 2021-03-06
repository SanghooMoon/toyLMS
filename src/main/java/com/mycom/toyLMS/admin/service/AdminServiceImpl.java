package com.mycom.toyLMS.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.toyLMS.admin.dao.AdminDAO;
import com.mycom.toyLMS.member.dto.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원 목록
	@Override
	public ArrayList<Member> memberList() {
		return aDAO.memberList(sqlSession);
	}
	
	// 가입 요청 목록
	@Override
	public ArrayList<Member> approvalList() {
		// TODO Auto-generated method stub
		return aDAO.approvalList(sqlSession);
	}

	// 가입 승인
	@Override
	public void approval(String[] checkedList) {
		// TODO Auto-generated method stub
		aDAO.approval(sqlSession, checkedList);
	}
	
	// 가입 거절
	@Override
	public void reject(String[] checkedList) {
		// TODO Auto-generated method stub
		aDAO.reject(sqlSession, checkedList);
	}
	
	
	
}
