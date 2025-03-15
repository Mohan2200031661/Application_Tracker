package com.mb.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "User_table" )
public class User {
	
	@Id
	@Column(name = "id", nullable = false, length = 10)
	private String id;
	@Column(name = "uname", nullable = false, length = 50)
	private String name;	
	@Column(name = "uemail", nullable = false)
	private String email;
	@Column(name = "upwd", nullable = false)
	private String password;
	@Column(name = "utype", nullable = false, length = 10)
	private UserType userType;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public UserType getUserType() {
		return userType;
	}


	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public enum UserType 
	{
		ADMIN,USER;
	}
	

}
