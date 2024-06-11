package com.kh.ccp.csc.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccp.common.vo.PageInfo;
import com.kh.ccp.csc.model.dao.CscDao;
import com.kh.ccp.csc.model.vo.Csc;

@Service
public class CscServiceImpl implements CscService {

	@Autowired
	private CscDao csDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	@Override
	public ArrayList<Csc> selectNoticeList(Csc cn, PageInfo pi) {
		
		return csDao.selectNoticeList(sqlSession, pi, cn);
		
	} // selectNotice

	
	@Override
	public int selectListCount() {
		
		return csDao.selectListCount(sqlSession);
		
	} // selectListCount
	
	
} // class
