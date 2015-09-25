package com.zambient.beacon.dao;
import java.util.List;

import com.zambient.beacon.model.ContentBO;
import com.zambient.beacon.model.CustomerUserBO;
import com.zambient.beacon.model.VendorBO;
import com.zambient.beacon.model.ZoneBO;

 
public interface VendorDao {
 
    public void save(VendorBO v);
     
    public void saveVendor(VendorBO v);
    
    public void saveOrUpdateVendor(VendorBO vendor);
    
    public List<VendorBO> list();
    
    public VendorBO authenticateUser(String email, String password);
    
    public VendorBO getVendor(Long vendorId);
    
    public void saveOrUpdateZone(ZoneBO zone);
    
    public List<ZoneBO> getZones(Long vendorId);
    
    public List<ContentBO> getContents(Long vendorId);
    
    public void saveOrUpdateContent(ContentBO content);
    
    public void deleteContent(ContentBO content);
    
    public CustomerUserBO authenticateCustomerUser(String email, String password);
    
    public void saveCustomerUser(CustomerUserBO custUser);
    
    public List<ZoneBO> getZoneFromZBO(String uuid, Long minor, Long major);
    
    public List<ContentBO> getContentsByZoneId(Long zoneId);
    
    public List<ContentBO> getAllAds();
}