package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.EnrollService;
import com.project.vo.RecipeBookListVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeInfo;
import com.project.vo.RecipeIngredients;
import com.project.vo.RecipeTag;



@Controller
@RequestMapping(value = "/enrollform/")
public class EnrollController {

	@Autowired
	private EnrollService enrollService;
	
	public int globalRecipeNo;
	
	@RequestMapping(value = "enrollmentform", method = RequestMethod.GET)
	public String enrollform(@RequestParam int chef_no, Model model) {
		
		List<RecipeBookListVo> rbList = enrollService.getRbookList(chef_no);
		
		System.out.println(rbList.toString());
		
		System.out.println("enrollmentform 들어옴 ");
		
		model.addAttribute("rbList", rbList);
		model.addAttribute("chef_no", chef_no);

		return "user/enrollmentform";
	}

	@ResponseBody
	@RequestMapping(value = "enrollInfo", method = RequestMethod.POST)
	public int enrollInfo(@ModelAttribute("RecipeVo") RecipeInfo recipeVo) {
		
		System.out.println(recipeVo.toString());
	
		enrollService.EnrollRecipeInfo(recipeVo);
		
		System.out.println("갔다옴!!");
		
		recipeVo.getRecipe_no();
		
		System.out.println(recipeVo.getRecipe_no());
		
		return recipeVo.getRecipe_no();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "updateRecipeInfo", method = RequestMethod.POST)
	public int updateRecipeInfo(@ModelAttribute("RecipeVo") RecipeInfo recipeVo) {
		
		System.out.println(recipeVo.getRecipebookName());
		System.out.println(recipeVo.getMainFile());
		System.out.println("여기임");
		
		enrollService.UpdateRecipeInfo(recipeVo);
		
		System.out.println("갔다옴!!");
		
		recipeVo.getRecipe_no();
		
		System.out.println(recipeVo.getRecipe_no());
		
		return recipeVo.getRecipe_no();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollOrder", method = RequestMethod.POST)
	public void enrollOrder(@ModelAttribute("recipeContentVo") RecipeContent recipeContentVo){
		
		System.out.println("enrollOrder들어옴");
		System.out.println("RecipeContent:" + recipeContentVo.toString());
		
		enrollService.EnrollRecipeContent(recipeContentVo);
		
		System.out.println("데이터 넣고 레시피 num반환");
		
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollIngre")
	public int enrollIngre(@RequestParam("recipeNo") int recipeNo,
						   @RequestParam("ingredients[]") List<String> ingredients,
						   @RequestParam("amounts[]") List<String> amounts) {
		
		System.out.println("저장 후 컨트롤러로 복귀");
		
		List<RecipeIngredients> listIngreVo = new ArrayList<RecipeIngredients>();
		
		System.out.println("/////////////////////////////////////////////////////////////////////");
		
		for(int i = 0; i < ingredients.size(); i++) {
			
			RecipeIngredients ingreVo = new RecipeIngredients();
			
			ingreVo.setRecipeNo(recipeNo);
			ingreVo.setMaterialName(ingredients.get(i));
			ingreVo.setAmount(amounts.get(i));
			
			System.out.println("재료이름:"+ingreVo.getMaterialName());
			
			if(ingreVo.getMaterialName() == "") {
				
				System.out.println("빈데이터");
				
			} else {
			
			listIngreVo.add(ingreVo);
			
			
			}
		}
		System.out.println("최종적으로 서비스로 날아가는 값:"+listIngreVo.toString());
		
		enrollService.EnrollIngre(listIngreVo);
		
		return recipeNo;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollOrderPhoto", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void enrollOrderPhoto(@RequestParam("photo") MultipartFile photo,
								 @RequestParam("orderNo") int orderNo,
								 @RequestParam("recipeNo") int recipeNo) {
		
		System.out.println("orderPhoto들어옴");
		System.out.println(photo.getSize());
		
		System.out.println(recipeNo);
		System.out.println(orderNo + "들어왔다!!!!!");
		
		enrollService.OrderPhotoSave(orderNo,recipeNo,photo); 
		
	}
	
	@ResponseBody
	@RequestMapping(value = "saveTag", method = RequestMethod.POST)
	public void enrollTag(@RequestParam("recipeNo") int recipeNo,
						  @RequestParam("tagData[]") List<String> tagData) {
		
		System.out.println("tag들어옴");
		System.out.println(tagData);
		List<RecipeTag> tagList = new ArrayList<RecipeTag>();
		
		RecipeTag tagVo = new RecipeTag();
		
		for(int i = 0; i < tagData.size(); i++) {
			
			tagVo.setRecipeNo(recipeNo);
			tagVo.setTag(tagData.get(i));
			tagList.add(i, tagVo);
		}
		
		enrollService.EnrollTag(tagList);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "autoIngre", method = RequestMethod.POST)
	public List<String> autoIngre() {
		
		List<String> ingreList = enrollService.ingreients();
		
		System.out.println(ingreList);
		
		return ingreList;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "testList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String testList(@RequestParam("RecipeVo") RecipeInfo recipeVo) {
		
		System.out.println(recipeVo.toString());
		
		
		return null;
		
	}
	
	@RequestMapping(value = "lastenroll")
	public String lastenroll(@RequestParam("recipe_no") String recipe_no,
							 Model model) {
		
		model.addAttribute("recipe_no", recipe_no);
		
		return "user/readform";
	}
	
}
