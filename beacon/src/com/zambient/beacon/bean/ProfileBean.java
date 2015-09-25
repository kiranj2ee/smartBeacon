package com.zambient.beacon.bean;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

public class ProfileBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String shopName;
	@Pattern(regexp=".+@.+\\.[a-z]+")
	private String email;
	private String initialPassword;
	private String newPassword;
	private String repeatNewPassword;
	private String timeZone;
	private String shopLogo;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInitialPassword() {
		return initialPassword;
	}
	public void setInitialPassword(String initialPassword) {
		this.initialPassword = initialPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getRepeatNewPassword() {
		return repeatNewPassword;
	}
	public void setRepeatNewPassword(String repeatNewPassword) {
		this.repeatNewPassword = repeatNewPassword;
	}
	public String getTimeZone() {
		return timeZone;
	}
	public void setTimeZone(String timeZone) {
		this.timeZone = timeZone;
	}
	public String getShopLogo() {
		return shopLogo;
	}
	public void setShopLogo(String shopLogo) {
		this.shopLogo = shopLogo;
	}
	
	
}
