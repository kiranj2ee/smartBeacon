package com.zambient.beacon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zambient.beacon.dao.VendorDao;
import com.zambient.beacon.model.ContentBO;
import com.zambient.beacon.model.CustomerUserBO;
import com.zambient.beacon.model.VendorBO;
import com.zambient.beacon.model.ZoneBO;


@Service ("vendorService")
public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorDao vendorDao;

	@Override
	public VendorBO authenticateUser(String email, String password) {
		return vendorDao.authenticateUser(email, password);
	}
	
	public VendorBO getVendor(Long vendorId) {
		return vendorDao.getVendor(vendorId);
	}
	
	public void saveVendor(VendorBO vendor){
		 vendorDao.saveVendor(vendor);
	}
	
	public void saveOrUpdateVendor(VendorBO vendor){
		vendorDao.saveOrUpdateVendor(vendor);
	}
	
	public void saveOrUpdateZone(ZoneBO zone){
		vendorDao.saveOrUpdateZone(zone);
	}
	
	public List<ZoneBO> getZones(Long vendorId){
		return vendorDao.getZones(vendorId);
	}
	
	public List<ContentBO> getContents(Long vendorId){
		return vendorDao.getContents(vendorId);
	}
	
	public void saveOrUpdateContent(ContentBO content){
		vendorDao.saveOrUpdateContent(content);
	}
	
	public void deleteContent(ContentBO content){
		vendorDao.deleteContent(content);
	}
	
	public CustomerUserBO authenticateCustomerUser(String email, String password){
		return vendorDao.authenticateCustomerUser(email, password);
	}
	
	public void saveCustomerUser(CustomerUserBO custUser){
		 vendorDao.saveCustomerUser(custUser);
	}
	
	public List<ZoneBO> getZoneFromZBO(String uuid, Long minor, Long major){
		return vendorDao.getZoneFromZBO(uuid,minor,major);
	}
	
	public List<ContentBO> getContentsByZoneId(Long zoneId){
		return vendorDao.getContentsByZoneId(zoneId);
	}
	
	public List<ContentBO> getAllAds(){
		return vendorDao.getAllAds();
	}
}
