package com.mycom.toyLMS.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.toyLMS.member.dao.MemberDAO;
import com.mycom.toyLMS.member.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	@Override
	public Member login(String id, String pwd) {
		// TODO Auto-generated method stub
		return mDAO.login(sqlSession, id, pwd);
	}
	
	
}
