package com.waffle.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waffle.service.MainService;

@Controller
public class MainController 
{
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/")
	public String mainPage(Model model) throws Exception
	{
		model.addAttribute("con", mainService.selecttest());
		
		return "Main_Page";
	}	
}
