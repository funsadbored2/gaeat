package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.repository.MainDao;
import com.project.vo.relatedRecipeVo;

@Service
public class MainService {
	
	@Autowired
	private MainDao enrollDao;
	
	public List<relatedRecipeVo> getLikeTop20() {
		
		return enrollDao.getLikeTop20();
	}
	
	public List<relatedRecipeVo> getVeganRecipe(){
		
		return enrollDao.getVeganRecipe();
				
	}
	
	public List<relatedRecipeVo> getMeatRecipe(){
		
		return enrollDao.getMeatRecipe();
		
	}
	
	public List<relatedRecipeVo> getAloneRecipe(){
		
		return enrollDao.getAloneRecipe();
		
	}
}
