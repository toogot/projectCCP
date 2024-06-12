package com.kh.ccp.member.model.service;

import com.kh.ccp.member.model.vo.Member;

public interface MemberService {
	Member loginMember(Member m);
	int idCheck(String userId);
	int insertMember(Member m);
	int checkKakao(String memId);
	int isertKakaoMember(Member m);
	Member loginKakaoMember(String memId);
	
}
