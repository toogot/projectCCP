package com.kh.ccp.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.web.servlet.headers.HttpPublicKeyPinningDsl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ccp.member.model.service.MemberServiceImpl;
import com.kh.ccp.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	
	@RequestMapping("loginForm.me")
	public String memberLoginForm() {
		
		
		return "member/loginPage";
		
	}
	
	
	@RequestMapping("loginMember.me")
	public String memberLogin(Member m,HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		session.setAttribute("loginUser", loginUser);
		
		return "main";
		
	}
	
	@RequestMapping("logout.me")
	public String memberLogout(HttpSession session) {
		session.setAttribute("loginUser", null);
		return "main";
	}
	
	
	@RequestMapping("insertForm.me")
	public String memberInsertForm() {
		return "member/insertMember";
	}
	
	@RequestMapping("insertIdCheck.me")
	public String idCheck(String userId){
		
		
		
	}
	
}
