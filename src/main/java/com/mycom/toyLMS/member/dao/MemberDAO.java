package com.mycom.toyLMS.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.toyLMS.member.dto.Member;

@Repository
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, String id, String pwd) {
		// TODO Auto-generated method stub
		
		// 여러개의 매개변수를 mapper에 전달하기위해 객체타입인 HashMap 사용
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("id", id);
		hs.put("pwd", pwd);
		
		return sqlSession.selectOne("memberMapper.login", hs);
	}

	public void signUp(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		sqlSession.update("memberMapper.signUp", member);
	}
	
	
}
