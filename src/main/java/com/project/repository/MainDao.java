package com.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int getLikeTop20() {
		
		sqlSession.selectList("main.getTop20RecipeList");
		
		return 0;
	}
	
}
