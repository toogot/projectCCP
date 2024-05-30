package com.kh.ccp.csc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CscController {

	@RequestMapping("cscMain.cs")
	public String cscMain() {
		
		return "csc/cscMain";
	} // CscMain
	
} // class
