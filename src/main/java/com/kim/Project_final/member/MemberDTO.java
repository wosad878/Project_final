package com.kim.Project_final.member;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

	private int num;
	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	private String phone;
	private String email;
	private String birth;
	private String smscheck;
	private String emailcheck;
	private String membertype;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSmscheck() {
		return smscheck;
	}

	public void setSmscheck(String smscheck) {
		this.smscheck = smscheck;
	}

	public String getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}

	public String getMembertype() {
		return membertype;
	}

	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}

}
