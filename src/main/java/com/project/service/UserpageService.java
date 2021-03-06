package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.repository.UserpageDao;
import com.project.vo.FollowVo;
import com.project.vo.FollowlistVo;
import com.project.vo.RecipeBookListVo;
import com.project.vo.SubscriptionVo;
import com.project.vo.UserpageVo;

@Service
public class UserpageService {

	@Autowired
	private UserpageDao userpageDao;
	
	
	public UserpageVo getUser(int chef_no){
		return userpageDao.getUser(chef_no);
	}
	
	public List<UserpageVo> getRecipebookList(int chef_no) {
		return userpageDao.getRecipebookList(chef_no);
	}
	
	public List<UserpageVo> getRecipeList(int chef_no) {
		return userpageDao.getRecipeList(chef_no);
	}
	
	public List<UserpageVo> getFollowedList(FollowlistVo followervo) {
		return userpageDao.getFollowedList(followervo);
	}
	
	public List<UserpageVo> getFollowingList(FollowlistVo followvo) {
		return userpageDao.getFollowingList(followvo);
	}
	
	public List<UserpageVo> getScrapList(int chef_no) {
		return userpageDao.getScrapList(chef_no);
	}
	
	public void removeCategory(int no) {
		userpageDao.removeCategory(no);
	} 
	
	public int addCategory(RecipeBookListVo vo) {
		return userpageDao.addCategory(vo);
	}
	
	public int addFollow(FollowVo vo) {
		System.out.println("serviceFOLLOW");
		return userpageDao.addFollow(vo);
		
	}
	
	public List<UserpageVo> getSubNo(int no){
		
		return userpageDao.getSubNo(no);
	}
	
	public int removeFollow(FollowVo vo) {
		return userpageDao.removeFollow(vo);
	} 
	
	public void addSubscription(SubscriptionVo vo) {
		userpageDao.addSubscription(vo);
	}
	
	public void deleteSubscription(SubscriptionVo vo) {
		userpageDao.deleteSubscription(vo);
	}
	
	public void adjustSubscription(SubscriptionVo vo) {
		userpageDao.adjustSubscription(vo);
	}
}
