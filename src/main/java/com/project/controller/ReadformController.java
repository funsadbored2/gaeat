package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.ReadformService;
import com.project.service.UserpageService;
import com.project.vo.DatVo;
import com.project.vo.LikeVo;
import com.project.vo.ModifyContentVo;
import com.project.vo.ModifyIngreVo;
import com.project.vo.ModifyVo;
import com.project.vo.ReadformVo;
import com.project.vo.ScrapVo;
import com.project.vo.SocialUserVo;
import com.project.vo.UserpageVo;


@Controller
@RequestMapping("/read")
public class ReadformController {
   
   @Autowired
   private ReadformService readformService;
   
   @Autowired
   private UserpageService userpageService;
   
   //readform할시 실행
   @RequestMapping(value="/readform")
   public String getlist(@ModelAttribute ReadformVo readformVo,
         @ModelAttribute ReadformVo readformVo2,
         @ModelAttribute ReadformVo readformVo3,Model model,Model model2,
         HttpSession session) {
      
   
      //요리 순서글
      List<ReadformVo> list = readformService.getlist(readformVo);
      System.out.println(readformVo2.toString()+"###############################"); 
      //레시피 제목,소개글,조리난이도,조리시간 왼쪽에 표시할 셰프 정보
      readformVo2=readformService.getread(readformVo2);
      //레시피 주인의 팔로우 정보 가져오기
      UserpageVo chef = readformService.getUser(readformVo2.getChef_no());
      
      //재료이름,재료양
      List<ReadformVo> list3=readformService.getmaterial(readformVo3);
      
      //비교를 위한 authUser정보
      SocialUserVo authUser=(SocialUserVo) session.getAttribute("authUser");
      
      //레시피 작성자의 follow정보 가져오기
      List<UserpageVo> followedList = userpageService.getFollowedList(readformVo2.getChef_no());
      model.addAttribute("followedList", followedList);
      
      //팔로우 검사를 위한 변수 생성
      int followcheck = 3;
      if(authUser!=null) {
         int user_chef_no=authUser.getChef_no();
         model.addAttribute("user_chef_no", user_chef_no);
         //레시피 사용자의 followlist안에 authUser가 있는 지 체크 후 변수 변경해줌
         for(int i = 0; i < followedList.size(); i++) {
            UserpageVo testNo = followedList.get(i);
            if(user_chef_no == testNo.getChef_no()) {
               followcheck = 1;
               break;
            }         
         }
      
      }
      
      model.addAttribute("followcheck", followcheck);
      //카테고리 리스트
      List<UserpageVo> recipebookList = readformService.getRecipebookList(readformVo2.getChef_no());
      
      System.out.println("레시피북 리스트입니다 !!!!!!!!!!!!!!!!" + recipebookList);
      
      /*List<UserpageVo> followedList = userpageService.getFollowedList(chef_no);*/
      /*model.addAttribute("followedList", followedList);*/
      
      model.addAttribute("recipebookList", recipebookList);
      model.addAttribute("list",list);   
      model.addAttribute("chef", chef);
      model2.addAttribute("readformVo2",readformVo2);
      model2.addAttribute("list3",list3);
      
      
 /*     Scrapcheck check =new Scrapcheck();
      check.setChef_no(authUser.getChef_no());
      check.setRecipe_no(readformVo2.getRecipe_no());
      */
      /*스크랩 체크 */
      readformVo2.setChef_no(authUser.getChef_no());
      String  check1= readformService.scrapcheck(readformVo2);
      model.addAttribute("check", check1);
      
     /* 좋아요 체크 */
      LikeVo likecheck = new LikeVo();
     likecheck.setRecipe_no(readformVo2.getRecipe_no());
     likecheck.setChef_no(authUser.getChef_no());
     System.out.println("likecheck1");
    String likecheck1= readformService.likecheck(likecheck);
    model.addAttribute("likecheck", likecheck1);
      return "/user/readform";
   }
   
   @RequestMapping(value="/delete")
   public String delete(@ModelAttribute ReadformVo readformVo) {
      
      System.out.println("int 전에");
      System.out.println("삭제 도착: "+readformVo.toString());
      int no=readformVo.getRecipe_no();
      
      readformService.deleteTag(no);
      readformService.deleteRecipe(no);
      
      
      
      
      return "main/index";
   }
   
   @RequestMapping(value="/modify")
   public String modify(@ModelAttribute ReadformVo readformVo,
         ModifyVo modifyVo,Model model) {
      
      int no=readformVo.getRecipe_no();
      modifyVo=readformService.modifyData(no);
      
      System.out.println(modifyVo.toString());
      
      List<ModifyIngreVo> ingreVoList = readformService.modifyIngre(no);
      
      int last_ingre_no = ingreVoList.size();
      
      System.out.println(ingreVoList);
      
      List<ModifyContentVo> contentVoList = readformService.modifyContent(no);
      
      int last_order_no = 1;
      
      for(int i = 0; i < contentVoList.size(); i++) {
		   
    	  last_order_no = + 1; 
    	  
 		  int order_no = contentVoList.get(i).getOrder_no();
 		  
 		  String div_name = "div_" + order_no;
 		  String order_name = "order_" + order_no;
 		  String content_name = "textContent_" + order_no;
 		  
 		 contentVoList.get(i).setDiv_name(div_name);
 		 contentVoList.get(i).setContent_name(content_name);
 		 contentVoList.get(i).setOrder_name(order_name);
 		 
 	   }
      
      modifyVo.setRecipe_no(no);
      
      System.out.println(contentVoList);
      
      model.addAttribute("last_ingre_no", last_ingre_no);
      model.addAttribute("last_order_no", last_order_no);
      model.addAttribute("modifyVo", modifyVo);
      model.addAttribute("ingreVoList", ingreVoList);
      model.addAttribute("contentVoList",contentVoList);
      
      return "user/modifyform";
   }
   
   
   
   //js로 가는 구문들
    @ResponseBody
   @RequestMapping(value="/list",method=RequestMethod.POST)
   public List<DatVo> list(DatVo datVo, @RequestParam("recipe_no") int recipe_no,HttpSession session) {
      
       SocialUserVo authUser=(SocialUserVo) session.getAttribute("authUser");
       //로그인 되어 있을때
       if(authUser!=null) 
       {
       int chef_no=authUser.getChef_no();
              
       datVo.setRecipe_no(recipe_no);
       System.out.println("aa");
      List<DatVo> list=readformService.getdatlist(datVo);
      
      for(int i=0;i<list.size();i++) {
         if(chef_no!=(list.get(i).getChef_no())) {
            list.get(i).setChef_no(0);
                                       }
         else {list.get(i).setChef_no(1);}
                              }
      System.out.println(list.toString());
      return list;
      //비로그인 일때
       }else {
          datVo.setRecipe_no(recipe_no);
           
          List<DatVo> list=readformService.getdatlist(datVo);
          
          return list;
          
       }
       
       
   }

   
   
   
   @ResponseBody//list로 보낼때 주소로 보내야 되는 데 주소가 없으므로 body로 보낸다
   @RequestMapping(value="/add",method=RequestMethod.POST)
   public DatVo add(@ModelAttribute DatVo datVo) {
      
      
      readformService.insertVo(datVo);
      
      
      return datVo;
   }
   //js로 가는 구문들
   
   //readform시 실행
   
   
   //delete시 시행
   
   
   @ResponseBody
   @RequestMapping(value = "/delete",method=RequestMethod.POST)
   public DatVo delte(DatVo datVo,@RequestParam("comment_no") int comment_no,Model model) {
      
      datVo.setComment_no(comment_no);
      System.out.println(datVo.toString());
      
      readformService.delete(datVo);
      
      
      return datVo;
   }
   
   @ResponseBody
   @RequestMapping(value = "/scrap", method = RequestMethod.POST)
   public int scrap(@RequestBody ScrapVo vo) {
      
      System.out.println(vo.toString());
      
      return readformService.addScrap(vo);
      
   }

   @ResponseBody
   @RequestMapping(value = "/scrapremove", method = RequestMethod.POST)
   public int scrapremove(@RequestBody ScrapVo vo) {
	   System.out.println("@@@@scrapremove  "+vo.getUserNo());
      System.out.println("@@@@scrapremove  "+vo.getRecipe_no());
      return readformService.removeScrap(vo);
      
   }
   @ResponseBody
   @RequestMapping(value = "/addlike", method = RequestMethod.POST)
   public int addlike(@RequestBody LikeVo vo) {
	   System.out.println("@@@@likehistory  "+vo.getChef_no());
      System.out.println("@@@@likehistory  "+vo.getRecipe_no());
      return readformService.addlike(vo);
      
   }  
   @ResponseBody
   @RequestMapping(value = "/dellike", method = RequestMethod.POST)
   public int dellike(@RequestBody LikeVo vo) {
	   System.out.println("@@@@dellike  "+vo.getChef_no());
      System.out.println("@@@@dellike  "+vo.getRecipe_no());
      return readformService.dellike(vo);
      
   }


}