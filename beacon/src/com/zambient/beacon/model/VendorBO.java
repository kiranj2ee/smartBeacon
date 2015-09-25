package com.zambient.beacon.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vendor_user")
public class VendorBO implements Serializable {

	  private static final long serialVersionUID = 1L;

	/*public VendorUser() {
	}*/
	@Id
    //@GeneratedValue
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="VENDOR_ID")
	private Long id;
	@Column(name="EMAIL")
	private String email;
	@Column(name="COMPANY")
	private String company;
	@Column(name="PASSWORD")
	private String password;
	@Column(name="PHONE")
	private String phone;
	@Column(name="NAME")
	private String name;
	@Column(name="TIMEZONE")
	private String timeZone;
	@Column(name="LOGO")
	private String shopLogo;
	
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
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
		
}
