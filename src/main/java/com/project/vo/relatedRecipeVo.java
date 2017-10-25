package com.project.vo;

public class relatedRecipeVo {

	private int recipe_no;
	private int userNo;
	private String foodImage;
	private String nickname;
	private String recipeTitle;
	private String foodName;
	private String introduction; 
	private int like_no;
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getFoodImage() {
		return foodImage;
	}
	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	@Override
	public String toString() {
		return "relatedRecipeVo [recipe_no=" + recipe_no + ", userNo=" + userNo + ", foodImage=" + foodImage
				+ ", nickname=" + nickname + ", recipeTitle=" + recipeTitle + ", foodName=" + foodName
				+ ", introduction=" + introduction + ", like_no=" + like_no + "]";
	}
	
	
	
}
