package com.project.vo;

public class ModifyIngreVo {

	private int material_no;
	private String material_name;
	private String amount;
	//화면에 표시해줄 때 html용
	private String ingre_name;
	private String amount_name;
	private String div_name;

	
	
	public String getDiv_name() {
		return div_name;
	}
	public void setDiv_name(String div_name) {
		this.div_name = div_name;
	}
	public String getIngre_name() {
		return ingre_name;
	}
	public void setIngre_name(String ingre_name) {
		this.ingre_name = ingre_name;
	}
	public String getAmount_name() {
		return amount_name;
	}
	public void setAmount_name(String amount_name) {
		this.amount_name = amount_name;
	}
	public int getMaterial_no() {
		return material_no;
	}
	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "ModifyIngreVo [material_no=" + material_no + ", material_name=" + material_name + ", amount=" + amount
				+ ", ingre_name=" + ingre_name + ", amount_name=" + amount_name + ", div_name=" + div_name + "]";
	}
	
	
	
}
