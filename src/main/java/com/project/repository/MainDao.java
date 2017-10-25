package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.relatedRecipeVo;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<relatedRecipeVo> getLikeTop20() {
			
			System.out.println("mainDao");
		
			List<relatedRecipeVo> list = sqlSession.selectList("mainpage.getTopRecipeNo");
			
			List<relatedRecipeVo> topList = new ArrayList<relatedRecipeVo>();
			
			System.out.println(list);
			
			for(int i = 0; i < list.size(); i++) {
			
				relatedRecipeVo vo = list.get(i);
				
				vo.setIdentity("nature");
				
				System.out.println(vo);
				
				int no = vo.getRecipe_no();
				
				vo = sqlSession.selectOne("mainpage.getRecipeList", no);
				
				System.out.println("나왔음!!!!!!!!1" + vo.toString());
				
				topList.add(vo);
				
			}
		
		return topList;
	}
	
	public List<relatedRecipeVo> getVeganRecipe(){
		
    	System.out.println("veganRecipe");
	
	List<relatedRecipeVo> list = sqlSession.selectList("mainpage.getVeganRecipeNo");
	
	List<relatedRecipeVo> veganList = new ArrayList<relatedRecipeVo>();
	
	for(int i = 0; i < list.size(); i++) {
		
		relatedRecipeVo veganVo = list.get(i);
		
		System.out.println(veganVo);
		
		int no = veganVo.getRecipe_no();
		
		veganVo = sqlSession.selectOne("mainpage.getRecipeList", no);
		
		System.out.println("나왔음!!!!!!!!1" + veganVo.toString());
		
		veganVo.setIdentity("vegan");
		
		veganList.add(veganVo);
		
	}
	
	return veganList;
	
}

	
}
