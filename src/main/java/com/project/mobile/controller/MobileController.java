/*package com.project.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.ReadformService;
import com.project.service.SearchService;
import com.project.vo.JSONResult;
import com.project.vo.ReadformVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeVo;;

@Controller
public class MobileController {

	@Autowired
	private ReadformService rs;

	@Autowired
	private SearchService ss;

	@ResponseBody
	@RequestMapping("/read_rmain")
	public JSONResult<ReadformVo> getListRMain() {

		// 친구 리스트 json 객체생성
		JSONResultRecipeMainInfo result = new JSONResultRecipeMainInfo();

		int recipe_no = 1; // 설정한 사용자 번호

		// 데이타 가져오기
		ReadformVo r_main = rs.getRecipeInfo(recipe_no);
		String r_material = rs.getRecipeMaterial(recipe_no); // 특정 레시피의 재료를 다 들고 온다.
		r_main.setMaterial_name(r_material);

		// 결과 객체에 값 세팅
		result.setResult("succeess");
		result.setData(r_main);

		return result;
	}

	@ResponseBody
	@RequestMapping("/read_rcontent")
	public JSONResult<List<RecipeContent>> getListRContent() {
		// 친구 리스트 json 객체생성
		JSONResultRecipeContent result = new JSONResultRecipeContent();

		int recipe_no = 1; // 설정한 사용자 번호

		// 데이타 가져오기
		List<RecipeContent> r_content = rs.getRecipeContent(recipe_no);
		System.out.println(r_content.toString());
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

		return result;
	}

	// 추상클래스 상속(자료형만 지정)
	private class JSONResultRecipeMainInfo extends JSONResult<ReadformVo> {
	}

	private class JSONResultRecipeContent extends JSONResult<List<RecipeContent>> {
	}

	private class JSONResultSearchresult extends JSONResult<List<RecipeVo>> {
	}

}
*/