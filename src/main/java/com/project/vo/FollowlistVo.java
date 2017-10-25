package com.project.vo;

public class FollowlistVo {
	private int authUser_no ;
	private int recipe_no;
	private int follow_no;
	
	
	public int getAuthUser_no() {
		return authUser_no;
	}
	public void setAuthUser_no(int authUser_no) {
		this.authUser_no = authUser_no;
	}
	
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	
	public int getFollow_no() {
		return follow_no;
	}
	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}
	
	@Override
	public String toString() {
		return "FollowlistVo [authUser_no=" + authUser_no + ", recipe_no=" + recipe_no + ", follow_no=" + follow_no
				+ "]";
	}
	
	
}
