package com.kh.ccp.csc.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ccp.common.template.Pagination;
import com.kh.ccp.common.vo.PageInfo;
import com.kh.ccp.csc.model.service.CscServiceImpl;
import com.kh.ccp.csc.model.vo.Csc;

@Controller
public class CscController {

	@Autowired
	private CscServiceImpl csService;
	
	
	@RequestMapping("cscMain.cs")
	public String cscMain() {
		
		return "csc/cscMain";
	} // CscMain
	
	@RequestMapping("notice.no")
	public ModelAndView moveNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv,Csc cn) {
		
		int listCount = csService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);		
		ArrayList<Csc> selectNotice = csService.selectNoticeList(cn,pi);
		
		
		mv.addObject("selectNotice", selectNotice);
		mv.addObject("pi", pi);
		mv.setViewName("csc/selectNotice");
		
		return mv;
		
	} // moveNotice
	
	
} // class
