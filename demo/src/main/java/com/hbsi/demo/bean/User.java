package com.hbsi.demo.bean;

import javax.validation.constraints.Pattern;


public class User {
	private Integer id;

	//使用JSR303 验证
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,10}$)",message="姓名要求为2-10位中文, 或6-16位英文和数字的组合, 不能有空格")
	private String name;

	@Pattern(regexp="(^[0-9]{1,3}$)",message="年龄要求为3位以下数字")
	private String age;

	private String sex;

	private String photo;
	
	private String pname;

	private String cname;

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + ", photo=" + photo + ", pname="
				+ pname + ", cname=" + cname + "]";
	}
	
	


	public User(Integer id, String name, String age, String sex, String photo, String pname, String cname) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.photo = photo;
		this.pname = pname;
		this.cname = cname;
	}




	public User() {
		super();
		// TODO Auto-generated constructor stub
	}




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age == null ? null : age.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo == null ? null : photo.trim();
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname == null ? null : pname.trim();
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}
}