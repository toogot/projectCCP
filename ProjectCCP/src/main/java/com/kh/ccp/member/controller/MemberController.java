package com.kh.ccp.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.web.servlet.headers.HttpPublicKeyPinningDsl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ccp.member.model.service.MemberServiceImpl;
import com.kh.ccp.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bc;
	
	
	@RequestMapping("loginForm.me")
	public String memberLoginForm() {
		
		
		return "member/loginPage";
		
	}
	
	
	@RequestMapping("loginMember.me")
	public String memberLogin(Member m,HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bc.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("alertMsg", "로그인성공");
			session.setAttribute("loginUser", loginUser);
			return "main";
		}else {
			session.setAttribute("alertMsg", "로그인실패");
			return "sdfsdf";
		}
		
		
		
		
		
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
	
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=utf-8")
	public String idCheck(String userId){
		
		int result = mService.idCheck(userId);
		if(result>0) {
			return "중복된 아이디입니다.";
		}else {
			return "사용 가능한 아이디입니다.";
		}
		
		
	}
	
	
	@RequestMapping("inserMember.me")
	public String insertMember(Member m, HttpSession session) {

		
		
		String bcPwd = bc.encode(m.getUserPwd());
		
		m.setUserPwd(bcPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입성공");
			
		}else {
			session.setAttribute("alertMsg", "회원가입실패");
		}
		return "main";
		
	}
	
}
