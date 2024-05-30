package com.kh.ccp.findStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class findStoreController {

	@RequestMapping("findStore.st")
	public String moveFindStore() {
		
		return "findStore/findStore";
		
	} // moveFindStore
	
} // class
