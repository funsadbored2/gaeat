package com.project.vo;

public class LikeVo {


		
	private int recipe_no;
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getChef_no() {
		return chef_no;
	}
	public void setChef_no(int chef_no) {
		this.chef_no = chef_no;
	}
	public int getRegdate() {
		return regdate;
	}
	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}
	private int chef_no;
	private int regdate;
	@Override
	public String toString() {
		return "LikeVo [recipe_no=" + recipe_no + ", chef_no=" + chef_no + ", regdate=" + regdate + "]";
	}
	
	
	

}
