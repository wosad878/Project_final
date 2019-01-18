package com.kim.Project_final.ImgTemp;

import org.springframework.stereotype.Component;

@Component
public class ImageTempDTO {

	private int num;
	private String imgname;
	private String userId;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
