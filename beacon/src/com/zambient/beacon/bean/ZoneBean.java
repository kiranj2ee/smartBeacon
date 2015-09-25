package com.zambient.beacon.bean;

import java.io.Serializable;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

public class ZoneBean implements Serializable {

	  private static final long serialVersionUID = 1L;
	
	private Long id;
	@NotEmpty(message = "Please enter Description.")
	private String description;
	@NotEmpty(message = "Please enter UUID.")
	private String uuid;
	@NotNull(message = "Please enter Major.")
	private Long major;
	@NotNull (message = "Please enter Minor.")
	private Long minor;
	private String color;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public Long getMajor() {
		return major;
	}
	public void setMajor(Long major) {
		this.major = major;
	}
	public Long getMinor() {
		return minor;
	}
	public void setMinor(Long minor) {
		this.minor = minor;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
