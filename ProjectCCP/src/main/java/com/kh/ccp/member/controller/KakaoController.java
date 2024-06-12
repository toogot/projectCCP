package com.kh.ccp.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.ccp.member.model.service.MemberServiceImpl;
import com.kh.ccp.member.model.vo.Member;

@Controller
public class KakaoController {
	
	@Autowired
	private MemberServiceImpl mService;
	
	
	@RequestMapping("kakaoCallback.me")
	public String kakaoLogin(String code,HttpSession session) {
		String spec = "https://kauth.kakao.com/oauth/token";
		spec += "?grant_type=authorization_code";
		spec += "&client_id=0746476497ec8c987bca594c88f0b09c";
		spec += "&redirect_uri=http://localhost:8053/ccp/kakaoCallback.me";
		spec += "&code="+code;
		
		
		
		try {
			URL url = new URL(spec);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			
			
			BufferedReader bw = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line=bw.readLine())!=null) {
				result += line;
			}
			
			bw.close();
			conn.disconnect();
			JsonParser jpar = new JsonParser();
			
			Object obj = jpar.parse(result);
			
			JsonObject jobj = (JsonObject)obj;
			
			
			
			String userInfo = userInfo(jobj.get("access_token").toString());
			
			JsonParser userParser = new JsonParser();
			
			Object obj2 = userParser.parse(userInfo);
			
			JsonObject juserInfo = (JsonObject)obj2;
			
			JsonObject properties = (JsonObject) juserInfo.get("properties");
			
			Member m = new Member();
			
			m.setUserId(juserInfo.get("id").toString());
			m.setUserName(properties.get("nickname").toString());
			m.setAddress("kakao");
			m.setEmail("kakao@kakao.com");
			m.setPhone("kakao");
			m.setUserPwd("kakao"+(int)(Math.random()*1000000+10000));
			
			int check = mService.checkKakao(properties.get("nickname").toString());
			
			
			
			
			
			//System.out.println(userNick);
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "member/loginPage";
	}
	
	public String userInfo(String result) {
		String spec = "https://kapi.kakao.com/v2/user/me";
		String line = "";
		String result2 = "";
		try {
			URL url = new URL(spec);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestProperty("Authorization", "Bearer " + result);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			
			
			while((line=br.readLine())!=null) {
				result2 += line;
			}
			
			
			
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return result2;
	}
}


	
