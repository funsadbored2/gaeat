package com.project.vo;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author bit
 *
 */
public class RecipeInfo {
	
	private int recipe_no;
	private int userNo;
	//리드폼에 뿌리기 위해서
	private String foodImage;
	
	private String nickname;
	private String recipeTitle;
	private String recipebookName;
	private String foodName;
	private String introduction; 
	private String cookingType;
	private String cookingMethod;
	private String amount;
	private String cookingTime;
	private String cookingLevel;
	private int recipebook_no;
	private String noPhotoChange;
	private MultipartFile mainFile;
	
	public RecipeInfo() {}

	public MultipartFile getMainFile() {
		return mainFile;
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

	public String getNoPhotoChange() {
		return noPhotoChange;
	}

	public void setNoPhotoChange(String noPhotoChange) {
		this.noPhotoChange = noPhotoChange;
	}

	public void setMainFile(MultipartFile mainFile) {
		this.mainFile = mainFile;
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



	public String getCookingTime() {
		return cookingTime;
	}



	public void setCookingTime(String cookingTime) {
		this.cookingTime = cookingTime;
	}



	public String getCookingLevel() {
		return cookingLevel;
	}



	public void setCookingLevel(String cookingLevel) {
		this.cookingLevel = cookingLevel;
	}


	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}


	public String getCookingType() {
		return cookingType;
	}


	public void setCookingType(String cookingType) {
		this.cookingType = cookingType;
	}


	public String getCookingMethod() {
		return cookingMethod;
	}


	public void setCookingMethod(String cookingMethod) {
		this.cookingMethod = cookingMethod;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getRecipebookName() {
		return recipebookName;
	}


	public void setRecipebookName(String recipebookName) {
		this.recipebookName = recipebookName;
	}

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


	public int getRecipebook_no() {
		return recipebook_no;
	}


	public void setRecipebook_no(int recipebook_no) {
		this.recipebook_no = recipebook_no;
	}


	@Override
	public String toString() {
		return "RecipeInfo [recipe_no=" + recipe_no + ", userNo=" + userNo + ", recipeTitle=" + recipeTitle
				+ ", recipebookName=" + recipebookName + ", foodName=" + foodName + ", introduction=" + introduction
				+ ", cookingType=" + cookingType + ", cookingMethod=" + cookingMethod + ", amount=" + amount
				+ ", cookingTime=" + cookingTime + ", cookingLevel=" + cookingLevel + ", recipebook_no=" + recipebook_no
				+ ", mainFile=" + mainFile + "]";
	}
	
}
