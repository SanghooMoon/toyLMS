package com.mycom.toyLMS.admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.toyLMS.member.dto.Member;

@Repository
public class AdminDAO {

	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.memberList");
	}

	public ArrayList<Member> approvalList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.approvalList");
	}

	public void approval(SqlSessionTemplate sqlSession, String[] checkedIds) {
		// TODO Auto-generated method stub
		sqlSession.update("adminMapper.approval", checkedIds);
	}

}
