package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.UserpageService;
import com.project.vo.FollowVo;
import com.project.vo.FollowlistVo;
import com.project.vo.RecipeBookListVo;
import com.project.vo.SocialUserVo;
import com.project.vo.SubscriptionVo;
import com.project.vo.UserpageVo;

@Controller
@RequestMapping("/userpage")
public class UserpageController {
	
	@Autowired
	private UserpageService userpageService;
	
	@RequestMapping(value="/main")
	public String getlist(@RequestParam("chef_no") int chef_no, 
			  Model model, 
			  HttpSession session) {

		//유저 정보
		UserpageVo chef = userpageService.getUser(chef_no);
		model.addAttribute("chef", chef);
		
		/*		SocialUserVo a = (SocialUserVo)session.getAttribute("authUser");
		System.out.println("확인 "+a);
		
		int authUser = a.getChef_no();
		
		System.out.println(authUser);
		
		/*model.addAttribute("authUser", authUser);*/
		
		//카테고리 리스트
		List<UserpageVo> recipebookList = userpageService.getRecipebookList(chef_no);
		
		System.out.println("recipebook");
		
		//레시피 리스트
		List<UserpageVo> recipeList = userpageService.getRecipeList(chef_no);
		model.addAttribute("recipeList", recipeList);
		
		
	
		//화면 보이고 안보이고 구분하기위한 세션 불러오기
		SocialUserVo a = (SocialUserVo)session.getAttribute("authUser");
		
		int no = a.getChef_no();
		
		System.out.println(no);
		
		//followed리스트
				FollowlistVo followervo =new FollowlistVo();
				followervo.setAuthUser_no(a.getChef_no());
				followervo.setFollow_no(chef_no);
				
				List<UserpageVo> followedList = userpageService.getFollowedList(followervo);
				model.addAttribute("followedList", followedList);
				
				System.out.println(followedList.toString());
		
		//follow여부를 위해 followcheck값 계산
		int followcheck = 3;
		
		for(int i = 0; i < followedList.size(); i++) {
		UserpageVo testNo = followedList.get(i);
		if(no == testNo.getChef_no()) {
			followcheck = 1;
			break;
		}			
		}
		
		System.out.println(recipebookList);
		
		model.addAttribute("followcheck", followcheck);
		
		//구독 정보를 가져오기 위해 session이 구독중인 recipebooklist 가져와야 함
		List<UserpageVo> authUserSubInfoList = userpageService.getSubNo(no);
		
		
		if(authUserSubInfoList.isEmpty()) {
		
		System.out.println("if문 들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
		for(int i = 0; i < recipebookList.size(); i++) {
			 recipebookList.get(i).setSubCheck(5);
			 System.out.println(recipebookList.get(i).getSubCheck());
		}
		
		} else {
		System.out.println("else문 들어옴 !!!!!!!!!!!!!!!!!!!!!!!!!");
					
					for(int i = 0; i < recipebookList.size(); i++) {
						
						System.out.println("for문 들어옴 !!!!!!!!!!!!!!!!!!!!!!!!!!!!");
						
						int rNo = recipebookList.get(i).getRecipebook_no();
						
						System.out.println("rNo의 값은 ????????????" + rNo);
						
							for(int j = 0; j < authUserSubInfoList.size(); j++) {
								
								  System.out.println(i +", "+j);
								  int sNo = authUserSubInfoList.get(j).getRecipebook_no();
								  
								  System.out.println("sNo의 값은 ??????????????????" + sNo );
								  
								  if(rNo == sNo) {
									  recipebookList.get(i).setSubCheck(1);
									  System.out.println(recipebookList.get(i).getSubCheck());
									  break;
								  } else if(rNo != sNo) {
									  recipebookList.get(i).setSubCheck(3);
									  System.out.println(recipebookList.get(i).getSubCheck());
								  } 
							}
					}
		}
		
		System.out.println("recipebookList 출력    " + recipebookList.toString());
		
		model.addAttribute("recipebookList", recipebookList);
		model.addAttribute("authUserSubInfoList", authUserSubInfoList);
		
		System.out.println(authUserSubInfoList);
		return "/user/userpage";
		}
	
	/*유저의 팔로우드리스트*/
	@RequestMapping(value="/followedlist")
	public String followedlist(@RequestParam("chef_no") int chef_no, Model model,HttpSession session) {
		SocialUserVo authUser = (SocialUserVo)session.getAttribute("authUser");
		
		//유저 정보
		UserpageVo chef = userpageService.getUser(chef_no);
		model.addAttribute("chef", chef);
		
		//카테고리 리스트
		List<UserpageVo> recipebookList = userpageService.getRecipebookList(chef_no);
		model.addAttribute("recipebookList", recipebookList);
		
		//팔로워 리스트
		FollowlistVo followervo =new FollowlistVo();
		followervo.setAuthUser_no(authUser.getChef_no());
		followervo.setFollow_no(chef_no);
		List<UserpageVo> followedList = userpageService.getFollowedList(followervo);
		model.addAttribute("followedList", followedList);
		
		return "user/followedlist";
	}
	
	/*유저의 팔로잉리스트*/
	@RequestMapping(value="/followinglist")
	public String followinglist(@RequestParam("chef_no") int chef_no, Model model,HttpSession session) {
		SocialUserVo authUser = (SocialUserVo)session.getAttribute("authUser");
		//유저 정보
		UserpageVo chef = userpageService.getUser(chef_no);
		model.addAttribute("chef", chef);
		
		//카테고리 리스트
		List<UserpageVo> recipebookList = userpageService.getRecipebookList(chef_no);
		model.addAttribute("recipebookList", recipebookList);
		
		//팔로잉 리스트
		FollowlistVo followvo =new FollowlistVo();
		followvo.setAuthUser_no(authUser.getChef_no());
		followvo.setFollow_no(chef_no);
		
		List<UserpageVo> followingList = userpageService.getFollowingList(followvo);
		model.addAttribute("followingList", followingList);
		
		System.out.println(followingList + "followingList///////////////////////////////////////////////////////////////////");
		
		return "user/followinglist";
	}
	
	/*유저의 스크랩리스트*/
	@RequestMapping(value="/scraplist")
	public String scraplist(@RequestParam("chef_no") int chef_no, Model model) {
		//유저 정보
		UserpageVo chef = userpageService.getUser(chef_no);
		model.addAttribute("chef", chef);
		
		//카테고리 리스트
		List<UserpageVo> recipebookList = userpageService.getRecipebookList(chef_no);
		model.addAttribute("recipebookList", recipebookList);
	
		
		
		//스크랩 리스트
		List<UserpageVo> scrapList = userpageService.getScrapList(chef_no);
		System.out.print("#####################스크랩 리스트 :"+scrapList.toString());
		model.addAttribute("scrapList", scrapList);
				
		return "user/scraplist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/categoryRemove")
	public void removeCategory(@RequestBody RecipeBookListVo vo) {
		
		int no = vo.getRecipebookNo();
		
		System.out.println("recipeBook 삭제 들어옴");
		
		userpageService.removeCategory(no);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/categoryAdd")
	public int addCategory(@RequestBody RecipeBookListVo vo) {
		
		System.out.println(vo.toString());
		System.out.println("추가 들어옴");
		int newBookNo = userpageService.addCategory(vo);
		
		return newBookNo;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/followAdd")
	public int addFollow(@RequestBody FollowVo vo) {
		
		System.out.println(vo);
		return userpageService.addFollow(vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "followRemove")
	public int removeFollow(@RequestBody FollowVo vo) {
		System.out.println(vo);
		return userpageService.removeFollow(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/subscriptionPage")
	public int subscription(@RequestBody SubscriptionVo subVo) {
		
		System.out.println("controller에서 " + subVo);
		
		userpageService.addSubscription(subVo);
		
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/subscriptionRemove")
	public int subscriptionRemove(@RequestBody SubscriptionVo subVo) {
		
		System.out.println("controller에서 " + subVo);
		
		userpageService.deleteSubscription(subVo);
		
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/categoryAdjust")
	public void categoryAdjust(@RequestBody SubscriptionVo vo) {
		
		System.out.println("유저페이지 들어옴 " + vo.toString());
		
		userpageService.adjustSubscription(vo);
		
		System.out.println("완료");
	
	}

}
