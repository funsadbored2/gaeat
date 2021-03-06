package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.service.MainService;
import com.project.vo.SocialUserVo;
import com.project.vo.relatedRecipeVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	 @RequestMapping(value="/index", method = RequestMethod.GET)
	   public String index(Model model) {
		 
		  List<relatedRecipeVo> topList = mainService.getLikeTop20();
		 
		  List<relatedRecipeVo> veganList = mainService.getVeganRecipe();
		  
		  List<relatedRecipeVo> meatList = mainService.getMeatRecipe();
		  
		  List<relatedRecipeVo> aloneList = mainService.getAloneRecipe();
		  
		  System.out.println(topList);
		  
		  model.addAttribute("meatList", meatList);
		  model.addAttribute("veganList", veganList);
		  model.addAttribute("topList", topList);
		  model.addAttribute("aloneList", aloneList);
		  
	      return "/main/index";
	   
	 }
	   
	   @RequestMapping(value = "test", method = RequestMethod.GET)
	   public String test() {
	      
	      return "test";
	   
	 }
	   @RequestMapping(value="/logout")
		public String logout(HttpSession session) {
			
		   System.out.println("로그아웃 ");
			SocialUserVo authUser= (SocialUserVo)session.getAttribute("authUser");
			session.removeAttribute("authUser");
			
			return "redirect:/main/index";
		}

	   @RequestMapping(value="/logoutUser")
	 		public String logoutUser(HttpSession session) {
	 			
	 		   System.out.println("로그아웃 ");
	 		  SocialUserVo authUser= (SocialUserVo)session.getAttribute("authUser");
	 			session.removeAttribute("authUser");
	 			
	 			return "redirect:/main/index";
	 		}
	   
}
