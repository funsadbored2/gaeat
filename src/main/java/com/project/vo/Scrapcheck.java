package com.project.vo;

public class Scrapcheck {
	private int recipe_no;
	private int chef_no;
	private String Crecipe_no;
	
	
	
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
	public String getCrecipe_no() {
		return Crecipe_no;
	}
	public void setCrecipe_no(String crecipe_no) {
		Crecipe_no = crecipe_no;
	}
	@Override
	public String toString() {
		return "scrapcheck [recipe_no=" + recipe_no + ", chef_no=" + chef_no + ", Crecipe_no=" + Crecipe_no + "]";
	}
	
	
	
	
}
