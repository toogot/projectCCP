package com.kh.ccp.csc.model.service;

import java.util.ArrayList;

import com.kh.ccp.common.vo.PageInfo;
import com.kh.ccp.csc.model.vo.Csc;

public interface CscService {

	ArrayList<Csc> selectNoticeList(Csc cn, PageInfo pi);
	
	int selectListCount();
	
}
