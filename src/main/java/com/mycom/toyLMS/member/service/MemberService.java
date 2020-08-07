package com.mycom.toyLMS.member.service;

import com.mycom.toyLMS.member.dto.Member;

public interface MemberService {

	Member login(String id, String pwd);

}
