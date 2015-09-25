package com.zambient.beacon.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zambient.beacon.bean.ContentBean;
import com.zambient.beacon.bean.ProfileBean;
import com.zambient.beacon.bean.ZoneBean;
import com.zambient.beacon.converter.BeanToBOConverter;
import com.zambient.beacon.model.ContentBO;
import com.zambient.beacon.model.VendorBO;
import com.zambient.beacon.model.ZoneBO;
import com.zambient.beacon.service.VendorService;


@Controller
public class VendorController {
	final static Logger logger = Logger.getLogger(VendorController.class);
	@Autowired 
	HttpSession vendorSession;
	@Autowired
	VendorService vendorService;
	@Value("${images.root.path}")
    private String imageRootPath;
	
	@RequestMapping(value="/showDashboard", method= { RequestMethod.GET, RequestMethod.POST })
	public String showDashboard(Model model) {
		//model.addAttribute("zone", new ZoneBean());
		return "Dashboard";
	}
	
	@RequestMapping(value="/getVendor", method=RequestMethod.POST)
	public VendorBO getVendor(@RequestBody String values,HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		VendorBO vendor = new VendorBO();
		logger.info("Browser::::::"+request.getHeader("User-Agent"));
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		Long vendorId = null;
		try {
			JSONObject jsonObject = new JSONObject(values);
			JSONObject vendorJsonObject = jsonObject.getJSONObject("vendor");
			vendorId = vendorJsonObject.getLong("vendorId");
			vendor = vendorService.getVendor(vendorId);
			response.setHeader("value", "valid");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		mav.addObject("json",vendor);
		
		return vendor;
	}
	
	@RequestMapping(value="/showZones", method= { RequestMethod.GET, RequestMethod.POST })
	public String showZones(Model model) {
		model.addAttribute("zone", new ZoneBean());
		return "Zone";
	}
	
	@RequestMapping(value = "/createZone", method = RequestMethod.POST)
    public String createZone(@Valid @ModelAttribute("zone") ZoneBean zoneBean,
            BindingResult result, Map<String, Object> model) {
		System.out.println("");
        if (result.hasErrors()) {
            return "Zone";
        }
        ZoneBO zoneBo = new ZoneBO();
        zoneBo.setMajor(zoneBean.getMajor());
        zoneBo.setMinor(zoneBean.getMinor());
        zoneBo.setUuid(zoneBean.getUuid());
        zoneBo.setColor(zoneBean.getColor());
        zoneBo.setDescription(zoneBean.getDescription());
        zoneBo.setVendorId(new Long(vendorSession.getAttribute("vendorId").toString()));
        System.out.println("vendorId===>"+zoneBo.getVendorId());
        //zoneBo.setVendorId(new Long(1));
        //zoneBo.setId(new Long(1));
        vendorService.saveOrUpdateZone(zoneBo);
       // String p = CommonUtil.getPathOfFile();
		//System.out.println("New File Path-->"+p);
        return "redirect:/showZones";
        //return "Zone";
    }
	
	@RequestMapping(value="/createContent", method = { RequestMethod.GET, RequestMethod.POST })
	public String createContent(Model model){
		List<ZoneBO> zonesList = vendorService.getZones(new Long(vendorSession.getAttribute("vendorId").toString()));
		Map<Long,String> zones = new LinkedHashMap<Long,String>();
		zones.put(-1L, "Select any ZONE...");
		for(ZoneBO zone :zonesList){
			zones.put(zone.getId(), zone.getDescription());
		}
		ContentBean content = new ContentBean();
		content.setZones(zones);
		model.addAttribute("content", content);
		return "CreateContent";
	}
	
	@RequestMapping(value="/showContent", method = { RequestMethod.GET, RequestMethod.POST })
	public String showContent(Model model){
		List<ZoneBO> zonesList = vendorService.getZones(new Long(vendorSession.getAttribute("vendorId").toString()));
		Map<Long,String> zones = new LinkedHashMap<Long,String>();
		zones.put(-1L, "Select any ZONE...");
		for(ZoneBO zone :zonesList){
			zones.put(zone.getId(), zone.getDescription());
		}
		ContentBean content = new ContentBean();
		content.setZones(zones);
		model.addAttribute("content", content);
		return "Content";
	}
	
	@RequestMapping(value={"/saveCoupon", "/saveProduct","/saveWebProduct"}, method = { RequestMethod.GET, RequestMethod.POST })
	public String saveCoupon(@ModelAttribute("content") ContentBean contentBean,BindingResult bindingResult, @RequestParam(value = "myImage", required = false) MultipartFile myImage,HttpServletRequest request){
		//String fileName = new SimpleDateFormat("yyyyMMddhhmmss'.txt'").format(new Date());
		//String fileName = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		//System.out.println("File Name------"+fileName);
		System.out.println("Coupon title==>"+contentBean.getTitle());
		System.out.println("Content Id---->>"+contentBean.getId());
		System.out.println("zoneid==>"+contentBean.getZoneId());
		System.out.println("Type==>"+contentBean.getType());
		if(!contentBean.getType().equals("Webproduct")){
			if (myImage != null && !myImage.isEmpty()) {
				try {
					validateImage(myImage);
				} catch (RuntimeException re) {
					System.out.println("in 1st catch re");
					re.printStackTrace();
					bindingResult.reject(re.getMessage());
					return "redirect:/showContent";
				}
				try {
					String fileName = new SimpleDateFormat("yyyyMMddhhmmss'.jpg'").format(new Date());
					saveImage(fileName, myImage, request);
					String folderName = vendorSession.getAttribute("vendorId").toString();
					contentBean.setMyImage(folderName + File.separator + fileName);
				} catch (IOException e) {
					System.out.println("in 2nd catch re");
					e.printStackTrace();
					bindingResult.reject(e.getMessage());
					return "redirect:/showContent";
				}
			}
		}
		String vendorId = vendorSession.getAttribute("vendorId").toString();
		ContentBO contentBO = BeanToBOConverter.convertContentBeanToContentBO(contentBean,vendorId);
		vendorService.saveOrUpdateContent(contentBO);
		return "forward:/showContent";
	}
		
	private void validateImage(MultipartFile image) {
		if (!image.getContentType().equals("image/jpeg")) {
		throw new RuntimeException("Only JPG images are accepted");
		}
	}
	
	private void saveImage(String filename, MultipartFile image,HttpServletRequest request) throws RuntimeException, IOException {
		try {
			String folderName = vendorSession.getAttribute("vendorId").toString();
			File file = new File(imageRootPath + File.separator + folderName + File.separator + filename);
			FileUtils.writeByteArrayToFile(file, image.getBytes());
			System.out.println("Go to the location:  " + file.toString()+" on your computer and verify that the image has been stored.");
		} catch (IOException e) {
			throw e;
		}
	}

	@RequestMapping(value="/showAnalytics")
	public String showAnalytics(Model model){
		return "Analytics";
	}
	
	@RequestMapping(value="/showProfile")
	public String showProfile(Model model){
		model.addAttribute("profile", new ProfileBean());
		return "Profile";
	} 
	
	@RequestMapping(value="/updateProfile")
	public String updateProfile(@ModelAttribute("profile") ProfileBean profileBean,BindingResult bindingResult, @RequestParam(value = "shopLogo", required = false) MultipartFile shopLogo,HttpServletRequest request){
		System.out.println("ProfileBean==========>>>>"+profileBean.getEmail());
		
		String email= profileBean.getEmail();
		String password = profileBean.getInitialPassword();
		VendorBO vendorBO = vendorService.authenticateUser(email, password);
		System.out.println("after DB call===>"+vendorBO.getEmail());
		if(new Long(vendorSession.getAttribute("vendorId").toString()).equals(vendorBO.getId())){
			if(vendorBO != null && password.equals(vendorBO.getPassword())){
				if((profileBean.getNewPassword()).equals(profileBean.getRepeatNewPassword())){
					//VendorBO vendorBO = new VendorBO();
					vendorBO.setEmail(profileBean.getEmail());
					vendorBO.setName(profileBean.getShopName());
					vendorBO.setPassword(profileBean.getNewPassword());
					vendorBO.setTimeZone(profileBean.getTimeZone());
					try {
						validateImage(shopLogo);
						saveImage(profileBean.getShopName()+".jpg", shopLogo, request);
					} catch (IOException e) {
						bindingResult.reject(e.getMessage());
						return "redirect:/showProfile";
					}
					String folderName = vendorSession.getAttribute("vendorId").toString();
					vendorBO.setShopLogo(imageRootPath + File.separator + folderName + File.separator + profileBean.getShopName()+".jpg");
					vendorService.saveOrUpdateVendor(vendorBO);
					return "redirect:/showLogin";
				}
				return "redirect:/showProfile";
			}else{
				//bindingResult.addError(new FieldError("login","password","Password doesn't match"));
				return "redirect:/showProfile";
			}
			
		}else{
			//bindingResult.addError(new FieldError("login","password","Password doesn't match"));
			return "redirect:/showProfile";
		}
		
		//return "redirect:/showLogin";
	}
	
	@RequestMapping(value="/showSupport")
	public String showSupport(Model model){
		return "Support";
	} 
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request){
		vendorSession = request.getSession(false);
		vendorSession.invalidate();
		//vendorSession.setAttribute("vendorId", vendor.getId());
		vendorSession.removeAttribute("vendorId");
		return "forward:/showLogin";
	} 
	
	@RequestMapping(value="/getZones")
	public List<ZoneBO> getZones(@RequestBody String values,HttpServletRequest request,	HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		//String vendorId = request.getParameter("vendorId");
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		List<ZoneBO> zoneList = null;
		try{
			System.out.println("vendorId From Session===>"+vendorSession.getAttribute("vendorId").toString());
			zoneList = vendorService.getZones(new Long(vendorSession.getAttribute("vendorId").toString()));
			mav.addObject("json",zoneList);
			System.out.println("Zones List---->>>>"+zoneList);
			return zoneList;
			//return vendor;
			
		}catch(Exception e){
			System.out.println("in catch block");
			e.printStackTrace();
			System.out.println("in catch block end");
			return zoneList;
		}
		
	}
	
	@RequestMapping(value="/getContents")
	public List<ContentBO> getContents(@RequestBody String values,HttpServletRequest request,	HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		//String vendorId = request.getParameter("vendorId");
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");
		List<ContentBO> contentList = null;
		try{
			System.out.println("vendorId From Session===>"+vendorSession.getAttribute("vendorId").toString());
			contentList = vendorService.getContents(new Long(vendorSession.getAttribute("vendorId").toString()));
			mav.addObject("json",contentList);
			return contentList;
			//return vendor;
			
		}catch(Exception e){
			System.out.println("in catch block");
			e.printStackTrace();
			System.out.println("in catch block end");
			return contentList;
		}
		
	}
	
	@RequestMapping(value="/editZone", method=RequestMethod.POST)
	public String editZone(@ModelAttribute("zone") ZoneBean zoneBean, HttpServletRequest request,
			HttpServletResponse response){
		ZoneBO zoneBO = new ZoneBO();
		zoneBO.setId(zoneBean.getId());
		System.out.println("Id-->"+zoneBean.getId());
		zoneBO.setDescription(zoneBean.getDescription());
		zoneBO.setMajor(zoneBean.getMajor());
		zoneBO.setMinor(zoneBean.getMinor());
		zoneBO.setUuid(zoneBean.getUuid());
		zoneBO.setVendorId(new Long(vendorSession.getAttribute("vendorId").toString()));
        System.out.println("vendorId===>"+zoneBO.getVendorId());
		vendorService.saveOrUpdateZone(zoneBO);
		System.out.println("in editZone controller===>"+zoneBean.getDescription());
		/*response.setContentType("application/jsp");
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("value", "valid");*/
		ModelAndView mav = new ModelAndView();
		mav.addObject("zone",new ZoneBean());
		return "redirect:/showZones";
		//return "Zone";
	}
	
	@RequestMapping(value="/deleteContent", method=RequestMethod.POST)
	public void deleteContent(HttpServletRequest request){
		ContentBO contentBo = new ContentBO();
		String contentId = request.getParameter("contentId");
		contentBo.setId(new Long(contentId));
		vendorService.deleteContent(contentBo);
	 }
	
}	
