package com.kh.ccp.member.model.service;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccp.member.model.dao.MemberDao;
import com.kh.ccp.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return mDao.loginMember(sqlSession,m);
	}

	@Override
	public int idCheck(String userId) {
		
		return mDao.idCheck(sqlSession,userId);
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return mDao.insertMember(sqlSession,m);
	}

	@Override
	public int checkKakao(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int isertKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member loginKakaoMember(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

}
