package com.kim.Project_final.address;

import org.springframework.stereotype.Component;

@Component
public class AddressDTO {

	private int num;
	private String id;
	private String adrname;
	private String receiver;
	private String tel;
	private String phone;
	private String address;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdrname() {
		return adrname;
	}
	public void setAdrname(String adrname) {
		this.adrname = adrname;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
