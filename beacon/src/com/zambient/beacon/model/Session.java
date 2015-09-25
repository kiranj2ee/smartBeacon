package com.zambient.beacon.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

@JsonAutoDetect(getterVisibility = Visibility.NONE)
public class Session {
	
	private String accessToken;
	private Long user;
	private Boolean oauth;

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

	public Boolean getOauth() {
	    return oauth;
	}

	public void setOauth(Boolean oauth) {
	    this.oauth = oauth;
	}
	
	
}
