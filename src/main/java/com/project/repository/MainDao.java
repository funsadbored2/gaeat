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
				
				vo.setIdentity("top");
				
				System.out.println(vo);
				
				int no = vo.getRecipe_no();
				
				vo = sqlSession.selectOne("mainpage.getTopRecipeList", no);
				
				System.out.println("나왔음!!!!!!!!1" + vo.toString());
				
				topList.add(vo);
				
			}
		
		return topList;
	}
	
}
