package com.kim.Project_final.productBoard;

import org.springframework.stereotype.Component;

@Component
public class ProductBoardDTO {

	private int num;
	private String name;
	private String contents;
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
