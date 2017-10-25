package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.repository.MainDao;

@Service
public class MainService {
	
	@Autowired
	private MainDao enrollDao;
	
	public int getLikeTop20() {
		
		enrollDao.getLikeTop20();
		
		return 0;
	}
}