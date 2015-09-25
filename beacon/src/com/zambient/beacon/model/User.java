package com.zambient.beacon.model;

import java.util.List;

public class User {

	public User() {
	}
	private boolean invitePrompted;
	private boolean tourPrompted;
	private Long id;
	private String email;
	private String title;
	private String phone;
	private String photoUrl;
	private String password;
	private String referralToken;
	private int loginsNumber;
	private int referralsCount;
	private String firstName;
	private String lastName;
	private String lastActive;
	private Long profile;
	private Boolean hasPassword;
	private List<String> deviceTokens;
	
	public String getPassword() {
		return "";
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getLoginsNumber() {
		return loginsNumber;
	}

	public void setLoginsNumber(int loginsNumber) {
		this.loginsNumber = loginsNumber;
	}


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLastActive() {
		return lastActive;
	}

	public void setLastActive(String lastActive) {
		this.lastActive = lastActive;
	}

	public Long getProfile() {
		return profile;
	}

	public void setProfile(Long profile) {
		this.profile = profile;
	}


	public Boolean getHasPassword() {
	    return hasPassword;
	}

	public void setHasPassword(Boolean hasPassword) {
	    this.hasPassword = hasPassword;
	}

	public boolean isInvitePrompted() {
		return invitePrompted;
	}

	public void setInvitePrompted(boolean invitePrompted) {
		this.invitePrompted = invitePrompted;
	}

	public String getReferralToken() {
		return referralToken;
	}

	public void setReferralToken(String referralToken) {
		this.referralToken = referralToken;
	}

	public int getReferralCount() {
		return referralsCount;
	}

	public void setReferralCount(int referralCount) {
		this.referralsCount = referralCount;
	}

	public List<String> getDeviceTokens() {
		return deviceTokens;
	}

	public void setDeviceTokens(List<String> deviceIds) {
		this.deviceTokens = deviceIds;
	}

	public boolean isTourPrompted() {
		return tourPrompted;
	}

	public void setTourPrompted(boolean tourPrompted) {
		this.tourPrompted = tourPrompted;
	}	
}
