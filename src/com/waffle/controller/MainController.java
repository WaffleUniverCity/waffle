package com.waffle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waffle.service.impl.MainServiceImpl;

@Controller
public class MainController {
	
	private MainServiceImpl mainServieImpl;
	
	@RequestMapping("/")
	public String mainPage(Model model)
	{
		String msg ="Controller";
		
		return "Main_Page";
		
	}
	

}
