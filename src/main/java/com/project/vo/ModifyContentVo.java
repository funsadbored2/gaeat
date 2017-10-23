package com.project.vo;

public class ModifyContentVo {
	
	private int order_no;
	private String text_content;
	private String img_content;
	private String order_name;
	private String div_name;
	private String content_name;
	private String img_name;
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getText_content() {
		return text_content;
	}
	public void setText_content(String text_content) {
		this.text_content = text_content;
	}
	public String getImg_content() {
		return img_content;
	}
	public void setImg_content(String img_content) {
		this.img_content = img_content;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getDiv_name() {
		return div_name;
	}
	public void setDiv_name(String div_name) {
		this.div_name = div_name;
	}
	public String getContent_name() {
		return content_name;
	}
	public void setContent_name(String content_name) {
		this.content_name = content_name;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	@Override
	public String toString() {
		return "ModifyContentVo [order_no=" + order_no + ", text_content=" + text_content + ", img_content="
				+ img_content + ", order_name=" + order_name + ", div_name=" + div_name + ", content_name="
				+ content_name + ", img_name=" + img_name + "]";
	}
	
	

}
