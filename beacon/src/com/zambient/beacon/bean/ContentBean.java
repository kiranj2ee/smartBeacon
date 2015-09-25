package com.zambient.beacon.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

public class ContentBean implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String title;
	private String text1;
	private String text2;
	private String text3;
	private String text4;
	private String myImage;
	private Long zoneId;
	private String startDate;
	private String endDate;
	private String type;
	private String url;
	private Map<Long,String> zones;
	private String category;
	private String color;
	private String startHours;
	private String startMinutes;
	private String startSeconds;
	private String endHours;
	private String endMinutes;
	private String endSeconds;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
	}
	public String getText3() {
		return text3;
	}
	public void setText3(String text3) {
		this.text3 = text3;
	}
	public String getText4() {
		return text4;
	}
	public void setText4(String text4) {
		this.text4 = text4;
	}
	public String getMyImage() {
		return myImage;
	}
	public void setMyImage(String myImage) {
		this.myImage = myImage;
	}
	public Long getZoneId() {
		return zoneId;
	}
	public void setZoneId(Long zoneId) {
		this.zoneId = zoneId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Map<Long, String> getZones() {
		return zones;
	}
	public void setZones(Map<Long, String> zones) {
		this.zones = zones;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getStartHours() {
		return startHours;
	}
	public void setStartHours(String startHours) {
		this.startHours = startHours;
	}
	public String getStartMinutes() {
		return startMinutes;
	}
	public void setStartMinutes(String startMinutes) {
		this.startMinutes = startMinutes;
	}
	public String getStartSeconds() {
		return startSeconds;
	}
	public void setStartSeconds(String startSeconds) {
		this.startSeconds = startSeconds;
	}
	public String getEndHours() {
		return endHours;
	}
	public void setEndHours(String endHours) {
		this.endHours = endHours;
	}
	public String getEndMinutes() {
		return endMinutes;
	}
	public void setEndMinutes(String endMinutes) {
		this.endMinutes = endMinutes;
	}
	public String getEndSeconds() {
		return endSeconds;
	}
	public void setEndSeconds(String endSeconds) {
		this.endSeconds = endSeconds;
	}
	
}
