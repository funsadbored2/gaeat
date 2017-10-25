package com.project.mobile.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.ReadformService;
import com.project.service.SearchService;
import com.project.service.UserService;
import com.project.vo.JSONResult;
import com.project.vo.ReadformVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeVo;
import com.project.vo.SocialUserVo;
import com.project.vo.TagVo;;

@Controller
public class MobileController {

	@Autowired
	private ReadformService rs;
	@Autowired
	private SearchService ss;
	@Autowired
	private UserService us;

	@ResponseBody
	@RequestMapping("/read_rmain")
	public JSONResult<ReadformVo> getListRMain(String recipe_no) {
		// 레시피 정보 json 객체생성
		JSONResultRecipeMainInfo result = new JSONResultRecipeMainInfo();
		int rNo = Integer.parseInt(recipe_no);
		System.out.println("받아온 레시피번호는 "+recipe_no); 
		//int recipe_no = 1; // 설정한 사용자 번호

		// 데이타 가져오기
		ReadformVo r_main = rs.getRecipeInfo(rNo);
		String r_material = rs.getRecipeMaterial(rNo); // 특정 레시피의 재료를 다 들고 온다.
		r_main.setMaterial_name(r_material);

		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(r_main);

		return result;
	}

	@ResponseBody
	@RequestMapping("/read_rcontent")
	public JSONResult<List<RecipeContent>> getListRContent(String recipe_no) {
		// 친구 리스트 json 객체생성
		JSONResultRecipeContent result = new JSONResultRecipeContent();
		int rNo = Integer.parseInt(recipe_no);
		//int rNo = recipe_no.intValue();
		//System.out.println("받아온 레시피번호는 "+recipe_no); 

		//int recipe_no = 1; // 설정한 사용자 번호

		// 데이타 가져오기
		List<RecipeContent> r_content = rs.getRecipeContent(rNo);
		System.out.println("이거 이대로 보냅니다\n" + r_content.toString());
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("전송시각 : "+sdf.format(dt).toString());
		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(r_content);

		return result;
	}

	@ResponseBody
	@RequestMapping("/search_recipe")
	public JSONResult<List<RecipeVo>> getSearchResult(String word) {
		// 친구 리스트 json 객체생성
		JSONResultSearchresult result = new JSONResultSearchresult();
		// 데이타 가져오기
		System.out.println("검색 시작합니다. 검색어 : " + word);
		List<RecipeVo> f_list;

		f_list = ss.mobileSearch(word);
		// 모바일이라 로그인 사용자인지는 모름, -귀찮으니 안 할거임

		System.out.println("이거 이대로 보냅니다\n" + f_list.toString());
		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(f_list);
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("전송시각 : "+sdf.format(dt).toString());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/mobile_login")
	public JSONResult<SocialUserVo> mobileLogin(String id, String pwd) {
		System.out.println("ID : " + id+"\n"+
							"pwd : " + pwd);
		
		// 친구 리스트 json 객체생성
		JSONResultLoginInfo result = new JSONResultLoginInfo();
		SocialUserVo user = new SocialUserVo();
		
		// 데이타 가져오기
		user.setId(id.trim());
		user.setPassword(pwd.trim());
		user = us.mobilelogin(user);
		
		if(user.getId() ==null || user.getId() =="") {//일치하는 사용자가 아닐 경우
			System.out.println("로그인에 실패했습니다.");
			user.setChef_no(-1);
		} else {
			System.out.println("로그인에 성공.");
		}

		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("이거 이대로 보냅니다\n" + user.toString());
		System.out.println("전송시각 : "+sdf.format(dt).toString());
		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(user);

		return result;
	}

	@ResponseBody
	@RequestMapping("/search_bytag")
	public JSONResult<List<RecipeVo>> getSearchByTag(String word) {
		//String word = "면요리";
		// 친구 리스트 json 객체생성
		JSONResultSearchByTag result = new JSONResultSearchByTag();
		// 데이타 가져오기
		System.out.println("검색 시작합니다. 검색어 : " + word);
		List<RecipeVo> f_list;

		f_list = ss.mobileSearchTag(word);
		// 모바일이라 로그인 사용자인지는 모름, -귀찮으니 안 할거임

		System.out.println("이거 이대로 보냅니다\n" + f_list.toString());
		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(f_list);
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("전송시각 : "+sdf.format(dt).toString());
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/search_toptag", method = { RequestMethod.GET, RequestMethod.POST })
	public JSONResult<List<TagVo>> drawtag() {
		JSONResultTopTag result = new JSONResultTopTag();
		System.out.println("태그 출력을 위해서 들어옴");
		List<TagVo> t_list = ss.getTopTag2();

		System.out.println("이거 이대로 보냅니다\n" + t_list.toString());
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("전송시각 : "+sdf.format(dt).toString());

		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(t_list);
		return result;
	}
	

	@ResponseBody
	@RequestMapping(value = "/search_toprecipe", method = { RequestMethod.GET, RequestMethod.POST })
	public JSONResult<List<RecipeVo>> drawrecommend_recipe() {
		JSONResultTopRecipe result = new JSONResultTopRecipe();
		System.out.println("추천레시피 출력을 위해서 들어옴");
		List<RecipeVo> t_list = ss.getTopRecipe();

		System.out.println("이거 이대로 보냅니다\n" + t_list.toString());
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
		System.out.println("전송시각 : "+sdf.format(dt).toString());

		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(t_list);
		return result;
	}
	
	

	// 추상클래스 상속(자료형만 지정)
	private class JSONResultRecipeMainInfo extends JSONResult<ReadformVo> {
	}
	private class JSONResultRecipeContent extends JSONResult<List<RecipeContent>> {
	}
	private class JSONResultSearchresult extends JSONResult<List<RecipeVo>> {
	}
	private class JSONResultLoginInfo extends JSONResult<SocialUserVo> {
	}
	private class JSONResultTopTag extends JSONResult<List<TagVo>> {
	}
	private class JSONResultSearchByTag extends JSONResult<List<RecipeVo>> {
	}
	private class JSONResultTopRecipe extends JSONResult<List<RecipeVo>> {
	}
}
