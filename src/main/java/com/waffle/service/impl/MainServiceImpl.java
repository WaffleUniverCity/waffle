package com.waffle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waffle.domain.MedicalSubjectVO;
import com.waffle.reporsitory.MainDAO;
import com.waffle.service.MainService;

@Service
public class MainServiceImpl implements MainService
{
	@Autowired
	private MainDAO maindao;
	
	@Override
	public String selecttest() throws Exception
	{
		return maindao.select();
	}
}
