package com.zambient.beacon.bean;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

public class CustomerUserBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String name;
	@NotEmpty(message = "Please enter email.")
	//@Email(message = "Enter Valid email.")
	private String email;
	@NotEmpty(message = "Please enter your password.")
	//@Size(min = 6, max = 15, message = "password must between 6 and 15 characters")
	private String password;
	
	private String phoneno;
	
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
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	
	
	
}
