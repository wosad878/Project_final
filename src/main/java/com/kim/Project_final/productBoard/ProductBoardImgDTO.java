package com.kim.Project_final.productBoard;

import org.springframework.stereotype.Component;

@Component
public class ProductBoardImgDTO {

	private int num;
	private String name;
	private String imgname;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
}
