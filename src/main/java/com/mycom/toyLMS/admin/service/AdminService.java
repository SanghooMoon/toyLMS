package com.mycom.toyLMS.admin.service;

import java.util.ArrayList;

import com.mycom.toyLMS.member.dto.Member;

public interface AdminService {

	ArrayList<Member> memberList();

	ArrayList<Member> approvalList();

	void approval(String[] checkedList);

	void reject(String[] checkedList);

}
