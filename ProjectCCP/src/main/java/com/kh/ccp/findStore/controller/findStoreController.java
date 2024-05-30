package com.kh.ccp.findStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class findStoreController {

	@RequestMapping("findStore.st")
	public String moveFindStore(Model model) {
		
		model.addAttribute("appKey", "6efe75df65cddf72652dc9ce2bfc991d");
		
		return "findStore/findStore";		
	} // moveFindStore
	
} // class
