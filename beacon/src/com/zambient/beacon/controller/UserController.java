package com.zambient.beacon.controller;

import java.util.ArrayList;
import java.util.List;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zambient.beacon.bean.MessageBean;
import com.zambient.beacon.model.ContentBO;
import com.zambient.beacon.model.CustomerUserBO;
import com.zambient.beacon.model.ZoneBO;
import com.zambient.beacon.service.VendorService;


@Controller
public class UserController {
	final static Logger logger = Logger.getLogger(UserController.class);
	@Autowired 
	HttpSession vendorSession;
	@Autowired
	VendorService vendorService;
	@Value("${images.root.path}")
    private String imageRootPath;
	
	@RequestMapping(value="/userLogin")
	public MessageBean userLogin(@RequestBody String values,HttpServletRequest request,	HttpServletResponse response){
		String email = request.getParameter("userName");
		String password = request.getParameter("password");
		MessageBean messageBean = new MessageBean();
		CustomerUserBO custUser = vendorService.authenticateCustomerUser(email, password);
		System.out.println("after DB call===>"+custUser.getEmail());
		ModelAndView mav = new ModelAndView();
		logger.info("Browser::::::"+request.getHeader("User-Agent"));
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		if(custUser != null && password.equals(custUser.getPassword())){
			try {
				response.setHeader("value", "valid");
			}catch (Exception ex) {
				ex.printStackTrace();
			}
			messageBean.setMessage("success");
			mav.addObject("json",messageBean);
			return messageBean;
		}else{
			messageBean.setMessage("failure");
			mav.addObject("json",messageBean);
			return messageBean;
		}
	}
	
	@RequestMapping(value = "/userSignup", method = RequestMethod.POST)
    public MessageBean userSignup(@RequestBody String values,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MessageBean messageBean = new MessageBean();
		//CustomerUserBean customerUserBean = new CustomerUserBean();
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		try {
			JSONObject userJsonObject = new JSONObject(values);
			//System.out.println("--------------------"+jsonObject);
			//JSONObject userJsonObject = jsonObject.getJSONObject("userSingup");
			CustomerUserBO customerUserBO = new CustomerUserBO();
			customerUserBO.setName(userJsonObject.getString("name"));
			customerUserBO.setEmail(userJsonObject.getString("email"));
			customerUserBO.setPassword(userJsonObject.getString("password"));
			customerUserBO.setPhoneno(userJsonObject.getString("phoneno"));
			vendorService.saveCustomerUser(customerUserBO);
			response.setHeader("value", "valid");
			
			messageBean.setMessage("success");
		} catch (Exception ex) {
			ex.printStackTrace();
			messageBean.setMessage("failure");
		}
		
		mav.addObject("json",messageBean);
		
		return messageBean;
    }
	
	/*@RequestMapping(value = "/adsAroundMe", method = RequestMethod.POST)
    public List<ContentBO> adsAroundMe(@RequestBody String values,HttpServletRequest request, HttpServletResponse response){
		//ModelAndView mav = new ModelAndView();
		List<ContentBO> contentsList = new ArrayList<ContentBO>();
		//ContentBean contentBean = new ContentBean();
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		try {
			System.out.println("---Raw Value------------"+values);
			JSONObject contentJsonObject = new JSONObject(values);
			JSONObject zoneJsonObject = contentJsonObject.getJSONObject("userZone");
			System.out.println("---------------"+zoneJsonObject.getString("uuid"));
			List<ZoneBO> zonesList = vendorService.getZoneFromZBO(zoneJsonObject.getString("uuid"), zoneJsonObject.getLong("minor"),zoneJsonObject.getLong("major"));
			System.out.println("---------------"+zonesList);
			for(ZoneBO zone:zonesList){
				System.out.println("zoneId----------====="+zone.getId());
				contentsList = vendorService.getContentsByZoneId(zone.getId());
			}
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return contentsList;
	}*/
	
	@RequestMapping(value = "/adsAroundMe", method = RequestMethod.POST)
    public List<ContentBO> adsAroundMe(@RequestBody String values,HttpServletRequest request, HttpServletResponse response){
		List<ContentBO> contentsList = new ArrayList<ContentBO>();
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		try {
			JSONObject contentJsonObject = new JSONObject(values);
			JSONArray beaconArray =  contentJsonObject.getJSONArray("beaconsList");
			List<ContentBO> contentsSubList;
			for (int i = 0, size = beaconArray.length(); i < size; i++){
				contentsSubList = new ArrayList<ContentBO>();
				JSONObject zoneJsonObject = beaconArray.getJSONObject(i);
				List<ZoneBO> zonesList = vendorService.getZoneFromZBO(zoneJsonObject.getString("uuid"), zoneJsonObject.getLong("minor"),zoneJsonObject.getLong("major"));
				for(ZoneBO zone:zonesList){
					contentsSubList = vendorService.getContentsByZoneId(zone.getId());
					contentsList.addAll(contentsSubList);
				}
		    }
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return contentsList;
	}
	
	@RequestMapping(value = "/getAllAds", method = { RequestMethod.GET, RequestMethod.POST })
    public List<ContentBO> getAllAds(@RequestBody String values,HttpServletRequest request, HttpServletResponse response){
		List<ContentBO> contentsList = new ArrayList<ContentBO>();
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
			
		contentsList = vendorService.getAllAds();
			
		return contentsList;
	}
}	
