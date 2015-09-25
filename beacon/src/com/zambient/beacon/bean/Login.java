package com.zambient.beacon.bean;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@NotEmpty(message = "Please enter email.")
	@Email(message = "Enter Valid email.")
	private String email;
	@NotEmpty(message = "Please enter your password.")
	@Size(min = 6, max = 15, message = "password must between 6 and 15 characters")
	private String password;
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
	
	
}
