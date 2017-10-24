package com.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.FollowVo;
import com.project.vo.RecipeBookListVo;
import com.project.vo.SubscriptionVo;
import com.project.vo.UserpageVo;

@Repository
public class UserpageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserpageVo getUser(int chef_no) {
		UserpageVo userpageVo = sqlSession.selectOne("userpage.selectUserByNo", chef_no);
		return userpageVo;
	}
	
	public List<UserpageVo> getRecipebookList(int chef_no) {
		
		List<UserpageVo> recipebookList = sqlSession.selectList("userpage.getRecipebookList", chef_no);
		
		
		for(int i = 0; i < recipebookList.size(); i++) {
			
			int no = recipebookList.get(i).getRecipebook_no();
			
			System.out.println("subno + " +no);
			
			int subNo = sqlSession.selectOne("userpage.getSubscriptionCount", no);
			
			recipebookList.get(i).setSubscription_count(subNo);
		
			System.out.println("카운트 됐을까 ?//////////////////////////////////////////////" + recipebookList.get(i).getSubscription_count());
		}

		return recipebookList;
	}
	
	public List<UserpageVo> getRecipeList(int chef_no) {
		return sqlSession.selectList("userpage.getRecipeList", chef_no);
	}
	
	public List<UserpageVo> getFollowedList(int chef_no) {
		return sqlSession.selectList("userpage.getFollowedList", chef_no);
	}
	
	public List<UserpageVo> getFollowingList(int chef_no) {
		return sqlSession.selectList("userpage.getFollowingList", chef_no);
	}
	
	public List<UserpageVo> getScrapList(int chef_no) {
		return sqlSession.selectList("userpage.getScrapList", chef_no);
	}
	
	public void removeCategory(int no) {
		
		List<Integer> list = sqlSession.selectList("userpage.selectRecipeNoDelete", no);
		
		System.out.println(list.toString());
		
		for(int i = 0; i < list.size(); i++ ) {
			
			System.out.println(i);
			System.out.println(list.size());
			int number = list.get(i);
			System.out.println(number);
			System.out.println("레시피번호 " + number);
			
			sqlSession.delete("userpage.deleteContents", number);
			System.out.println("콘텐츠 삭제");
			sqlSession.delete("userpage.deleteComments", number);
			System.out.println("댓글삭제");
			sqlSession.delete("userpage.deleteRecipe", number);	
			System.out.println("recipe삭제");
		}
		
		sqlSession.delete("userpage.removeCategory", no);
	
	}
	
	public int addCategory(RecipeBookListVo vo) {
		
		sqlSession.insert("userpage.addCategory", vo);
		
		return vo.getRecipebookNo();
	
	}
	
	public int addFollow(FollowVo vo) {
		
		System.out.println("DAO FOLLOW");
		
		int no = vo.getUser_no();
		
		sqlSession.insert("userpage.addFollow", vo);
		
		return 1;
	}
	
	public List<UserpageVo> getSubNo(int no){
		
		return sqlSession.selectList("selectSubHistory", no);
	}

	public int removeFollow(FollowVo vo) {
		return sqlSession.delete("userpage.removeFollow", vo);
	}
	
	public void addSubscription(SubscriptionVo vo) {
		
		System.out.println(vo.toString() + "///////////////////////////서브스크립션!!");
		
		sqlSession.insert("userpage.addSubscription", vo);
	}
	
	public void deleteSubscription(SubscriptionVo vo) {
		
		System.out.println(vo.toString() + "///////////////////////////서브스크립션!!");
		
		sqlSession.delete("userpage.deleteSubscription", vo);
	}
	
	public void adjustSubscription(SubscriptionVo vo) {
		
		sqlSession.update("userpage.adjustSubscription", vo);
		
	}
}
