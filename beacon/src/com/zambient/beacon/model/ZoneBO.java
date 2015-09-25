package com.zambient.beacon.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="zone")
public class ZoneBO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="ZONE_ID")
	private Long id;
	@Column(name="DESCRIPTION")
	private String description;
	@Column(name="UUID")
	private String uuid;
	@Column(name="MAJOR")
	private Long major;
	@Column(name="MINOR")
	private Long minor;
	@Column(name="VENDOR_ID")
	private Long vendorId;
	@Column(name="color")
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
	public Long getVendorId() {
		return vendorId;
	}
	public void setVendorId(Long vendorId) {
		this.vendorId = vendorId;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
