package com.kh.ccp.csc.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ccp.common.vo.PageInfo;
import com.kh.ccp.csc.model.vo.Csc;

@Repository
public class CscDao {

	public int selectListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("cscMapper.selectListCount");
		
	} // selectListCount
	
	public ArrayList<Csc> selectNoticeList(SqlSession sqlSession, PageInfo pi, Csc cn) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("cscMapper.selectNotice");
		
		
		
	} // selectNotice
	
} // class
