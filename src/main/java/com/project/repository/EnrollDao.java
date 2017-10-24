package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.RecipeBookListVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeInfo;
import com.project.vo.RecipeIngredients;
import com.project.vo.RecipeMainPhoto;
import com.project.vo.RecipePhotoVo;
import com.project.vo.RecipeTag;

@Repository
public class EnrollDao {

	@Autowired
	private SqlSession sqlSession;

	public void EnrollRecipeInfoDao(RecipeInfo rInfoVo) {

		System.out.println("dao:" + rInfoVo.toString());

		System.out.println(rInfoVo);

		int recipebook_no = sqlSession.selectOne("enroll.SelectRecipeBookNo", rInfoVo);

		System.out.println("recipebook_no = " + recipebook_no);

		rInfoVo.setRecipebook_no(recipebook_no);

		sqlSession.insert("enroll.EnrollRecipeInfo", rInfoVo);

		System.out.println("insert된 레시피의 no값:" + rInfoVo.getRecipe_no());

	}

	public void UpdateRecipeInfo(RecipeInfo vo) {

		System.out.println("일단 기본 자료 저장하러 왔다 ");
		
		if (vo.getRecipebookName() == null) {
			
			System.out.println("레시피 네임이 없다 ");
			sqlSession.update("enroll.UpdateRecipeInfoNotReiebook", vo);
		} else {
			System.out.println("레시피 네임이 바뀌었다. 있는거다");
			int recipebookNo = sqlSession.selectOne("enroll.SelectRecipeBookNo", vo);
			vo.setRecipebook_no(recipebookNo);
			sqlSession.update("enroll.UpdateRecipeInfo", vo);
		}

	}

	public void updateNewPhoto(String saveMainphotoName, int recipeNo) {

		System.out.println("photo updateNewPhoto 도착");

		RecipeMainPhoto vo = new RecipeMainPhoto();

		vo.setRecipeNo(recipeNo);
		vo.setSaveMainphotoName(saveMainphotoName);

		sqlSession.update("enroll.updateMainPhoto", vo);

		System.out.println("저장 완료");

	}

	public void updatePhoto(int no) {

		RecipeMainPhoto vo = new RecipeMainPhoto();
		vo.setRecipeNo(no);

		String maintPhotoName = sqlSession.selectOne("enroll.seletPhoto", no);
		vo.setSaveMainphotoName(maintPhotoName);

		sqlSession.update("enroll.updateMainPhoto", vo);

	}

	public void EnrollContent(RecipeContent contentVo) {

		System.out.println("dao content 넣기");

		sqlSession.insert("enroll.EnrollContent", contentVo);

	}

	public RecipeIngredients Enrollnewmaterial(RecipeIngredients ingreVo) {

		sqlSession.insert("enroll.Enrollnewmaterial", ingreVo);

		return ingreVo;
	}

	public void EnrollIngre(RecipeIngredients ingreVo) {

		System.out.println("dao");

		System.out.println(ingreVo.toString());

		int no = sqlSession.selectOne("enroll.getMaterialNo", ingreVo);

		System.out.println("들어갈 인그리 번호" + no);

		ingreVo.setMaterialNo(no);

		sqlSession.insert("enroll.EnrollIngre", ingreVo);

		System.out.println("insertingre완료");

	}

	public List<RecipeBookListVo> getRbookList(int chef_no) {

		System.out.println("다오");

		List<RecipeBookListVo> list = sqlSession.selectList("enroll.getRecipebookList", chef_no);

		System.out.println(list.toString());
		System.out.println("레시피북 뽑아옴");
		return list;

	}

	public void saveMainPhoto(String saveMainphotoName, int recipeNo) {

		System.out.println("photo Dao 도착");

		RecipeMainPhoto vo = new RecipeMainPhoto();

		vo.setRecipeNo(recipeNo);
		vo.setSaveMainphotoName(saveMainphotoName);

		sqlSession.update("enroll.updateMainPhoto", vo);

		System.out.println("저장 완료");
	}

	public void saveOrderPhoto(RecipePhotoVo vo) {

		System.out.println("orderPhotoDao");
		System.out.println(vo.toString() + "/////////////////////////////////////////////////////////////");
		sqlSession.update("enroll.updateOrderPhoto", vo);

	}

	public void EnrollTag(List<RecipeTag> listvo) {

		for (int i = 0; i < listvo.size(); i++) {

			RecipeTag vo = new RecipeTag();

			vo = listvo.get(i);

			String date = sqlSession.selectOne("selectDate", vo.getRecipeNo());
			vo.setSysdate(date);
			System.out.println("태그:" + vo.toString());
			sqlSession.insert("enroll.tagInsert", vo.getTag());

			int tagNo = sqlSession.selectOne("enroll.selectTagNo", vo);
			vo.setTagNo(tagNo);
			System.out.println(vo.toString());
			sqlSession.insert("enroll.tagHisInsert", vo);

		}

	}

	public List<String> ingredients() {

		List<String> ingreList = new ArrayList<String>();

		ingreList = sqlSession.selectList("enroll.ingredients");

		return ingreList;
	}

}
