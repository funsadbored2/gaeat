package com.project.vo;

import org.springframework.web.multipart.MultipartFile;

public class RecipeContent {
	
	private int recipeNo;
	private int orderNo;
	private String textContent;
	private MultipartFile imgContent;
	private String path;
	
	
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	
	public MultipartFile getImgContent() {
		return imgContent;
	}
	public void setImgContent(MultipartFile imgContent) {
		this.imgContent = imgContent;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	
	@Override
	public String toString() {
		return "RecipeContent [recipeNo=" + recipeNo + ", orderNo=" + orderNo + ", textContent=" + textContent
				+ ", imgContent=" + imgContent + ", path=" + path + "]";
	}

	
	
}
