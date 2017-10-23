package com.project.vo;

public class ModifyVo {
	
	private String recipe_title;
	private String food_img;
	private String introduction;
	private String food_name;
	private String cooking_level;
	private String cooking_time;
	private String cooking_type;
	private String cooking_method;
	private String amount;
	private int recipebook_no;
	private String recipebook_name;
	public String getRecipe_title() {
		return recipe_title;
	}
	
	
	public String getRecipebook_name() {
		return recipebook_name;
	}


	public void setRecipebook_name(String recipebook_name) {
		this.recipebook_name = recipebook_name;
	}


	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getCooking_level() {
		return cooking_level;
	}
	public void setCooking_level(String cooking_level) {
		this.cooking_level = cooking_level;
	}
	public String getCooking_time() {
		return cooking_time;
	}
	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}
	public String getCooking_type() {
		return cooking_type;
	}
	public void setCooking_type(String cooking_type) {
		this.cooking_type = cooking_type;
	}
	public String getCooking_method() {
		return cooking_method;
	}
	public void setCooking_method(String cooking_method) {
		this.cooking_method = cooking_method;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public int getRecipebook_no() {
		return recipebook_no;
	}
	public void setRecipebook_no(int recipebook_no) {
		this.recipebook_no = recipebook_no;
	}
	
	
	public ModifyVo() {
		
	}
	public ModifyVo(String recipe_title, String food_img, String introduction, String food_name, String cooking_level,
			String cooking_time, String cooking_type, String cooking_method, String amount, int recipebook_no) {
		
		this.recipe_title = recipe_title;
		this.food_img = food_img;
		this.introduction = introduction;
		this.food_name = food_name;
		this.cooking_level = cooking_level;
		this.cooking_time = cooking_time;
		this.cooking_type = cooking_type;
		this.cooking_method = cooking_method;
		this.amount = amount;
		this.recipebook_no = recipebook_no;
	}
	@Override
	public String toString() {
		return "Modify [recipe_title=" + recipe_title + ", food_img=" + food_img + ", introduction=" + introduction
				+ ", food_name=" + food_name + ", cooking_level=" + cooking_level + ", cooking_time=" + cooking_time
				+ ", cooking_type=" + cooking_type + ", cooking_method=" + cooking_method + ", amount=" + amount
				+ ", recipebook_no=" + recipebook_no + "]";
	}
	
	

}
