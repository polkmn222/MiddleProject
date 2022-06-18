package com.tjoeun.vo;

import java.util.Objects;

import org.springframework.stereotype.Component;

@Component // 부품 인식.
public class User {
	private String uid; // 변수명은 폼에 있는거랑 같아야한다. 스프링이 해줌.
	private String pwd;
	private String name;
	private String phone;
	
	@Override
	public int hashCode() {
		return Objects.hash(this.uid);
	}

	@Override
	public boolean equals(Object obj) {
		User u = (User) obj;
		return this.uid.equals(u.getUid());
	}
	
	@Override
	public String toString() {
		
		return String.format("%s|%s|%s|%s", uid,pwd,name,phone);
	}

	public String getLine() {
		return String.format("%s|%s|%s|%s", uid,pwd,name,phone);
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
