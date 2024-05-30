package com.kh.ccp.csc.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ccp.csc.model.dao.CscDao;

@Service
public class CscServiceImpl implements CscService {

	@Autowired
	private CscDao csDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
} // class
