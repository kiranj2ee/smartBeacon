package com.zambient.beacon.converter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.zambient.beacon.bean.ContentBean;
import com.zambient.beacon.model.ContentBO;

public class BeanToBOConverter {
	public static ContentBO convertContentBeanToContentBO(ContentBean contentBean,String vendorId){
		ContentBO contentBO = new ContentBO();
		if(contentBean.getId() != null){
			contentBO.setId(contentBean.getId());
		}
		contentBO.setTitle(contentBean.getTitle());
		if(contentBean.getType().equals("Coupon")){
			contentBO.setTypeId(1);
		}else if(contentBean.getType().equals("Product")){
			contentBO.setTypeId(2);
		}else{
			contentBO.setTypeId(3);
		}
		//contentBO.setTypeId(contentBean.getType());
		contentBO.setText1(contentBean.getText1());
		contentBO.setText2(contentBean.getText2());
		contentBO.setText3(contentBean.getText3());
		contentBO.setText4(contentBean.getText4());
		contentBO.setImage(contentBean.getMyImage());
		contentBO.setUrl(contentBean.getUrl());
		contentBO.setZoneId(contentBean.getZoneId());
		contentBO.setCategory(contentBean.getCategory());
		contentBO.setColor(contentBean.getColor());
		contentBO.setVendorId(new Long(vendorId));
		System.out.println("------------Start Date--------"+contentBean.getStartDate());
		contentBO.setStartDate(convertDateInMillis(contentBean.getStartDate(),contentBean.getStartHours(),contentBean.getStartMinutes(),contentBean.getStartSeconds()));
		contentBO.setEndDate(convertDateInMillis(contentBean.getEndDate(),contentBean.getEndHours(),contentBean.getEndMinutes(),contentBean.getEndSeconds()));
		return contentBO;
	}
	
	/*public static Timestamp convertDateInMillis(String d){
		//Long ld = new Long(d);
		Timestamp timestamp = null;
//		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String dateInString = "22-01-2015 10:20:56";
		Date date;
		try {
			date = sdf.parse(d);
			System.out.println(d);
			System.out.println("Date - Time in milliseconds : " + date.getTime());
			timestamp = new Timestamp(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("Timestamp==============>>>"+timestamp);	
		return timestamp;
	}*/
	
	public static Timestamp convertDateInMillis(String d,String hr,String min,String sec){
		//Long ld = new Long(d);
		Timestamp timestamp = null;
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//String dateInString = "22-01-2015 10:20:56";
		String dt = "";
		if(hr != null){
			dt = d+" "+hr+":"+min+":"+sec;
		}else{
			dt = d+" 00:00:00";
		}
		//String dt = d+" "+hr+":"+min+":"+sec;
		Date date;
		try {
			date = sdf.parse(dt);
			System.out.println("Date=================>"+dt);
			System.out.println("Date - Time in milliseconds : " + date.getTime());
			timestamp = new Timestamp(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("Timestamp==============>>>"+timestamp);	
		return timestamp;
	}
}
