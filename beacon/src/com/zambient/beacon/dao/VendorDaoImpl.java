package com.zambient.beacon.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zambient.beacon.model.ContentBO;
import com.zambient.beacon.model.CustomerUserBO;
import com.zambient.beacon.model.VendorBO;
import com.zambient.beacon.model.ZoneBO;

@Repository("vendorDao")
public class VendorDaoImpl implements VendorDao {
	 @Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public void save(VendorBO v) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(v);
        tx.commit();
        session.close();
    }

    @Override
    public void saveVendor(VendorBO v) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(v);
        tx.commit();
        session.close();
    }
    
    public void saveOrUpdateVendor(VendorBO vendor){
    	Session session = this.sessionFactory.openSession();
    	Transaction tx = session.beginTransaction();
        session.saveOrUpdate(vendor);
        tx.commit();
        session.close();
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<VendorBO> list() {
        Session session = this.sessionFactory.openSession();
        List<VendorBO> vendorList = session.createQuery("from Vendor").list();
        session.close();
        return vendorList;
    }
    
	@SuppressWarnings("unchecked")
	public VendorBO authenticateUser(String email, String password){
    	 Session session = this.sessionFactory.openSession();
    	 //Vendor vendor = (Vendor) session.createQuery("from Vendor");
    	 //----------
    	 List<VendorBO> vendors = new ArrayList<VendorBO>();

    	 vendors = session.createQuery("from VendorBO where email=?").setParameter(0, email).list();
    	 session.close();
 		if (vendors.size() > 0) {
 			return vendors.get(0);
 		} else {
 			return null;
 		}
    	 //---------
    	//return vendor;
    }
    
    public VendorBO getVendor(Long vendorId){
    	Session session = this.sessionFactory.openSession();
   	 	VendorBO vendor = (VendorBO) session.get(VendorBO.class, new Long(vendorId));
   	    session.close();
    	return vendor;
    }
 
    public void saveOrUpdateZone(ZoneBO zone){
    	Session session = this.sessionFactory.openSession();
    	Transaction tx = session.beginTransaction();
        session.saveOrUpdate(zone);
        tx.commit();
        session.close();
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<ZoneBO> getZones(Long vendorId) {
		Session session = this.sessionFactory.openSession();
		List<ZoneBO> zones = new ArrayList<ZoneBO>();

		zones = session.createQuery("from ZoneBO where vendorId=?").setParameter(0, vendorId).list();
		session.close();
		return zones;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ContentBO> getContents(Long vendorId) {
		Session session = this.sessionFactory.openSession();
		List<ContentBO> contentList = new ArrayList<ContentBO>();

		contentList = session.createQuery("from ContentBO where vendorId=?").setParameter(0, vendorId).list();
		session.close();
		return contentList;
	}
	
	public void saveOrUpdateContent(ContentBO content){
		System.out.println("In DAO IMPL");
    	Session session = this.sessionFactory.openSession();
    	Transaction tx = session.beginTransaction();
        session.saveOrUpdate(content);
        tx.commit();
        session.close();
    }
	
	public void deleteContent(ContentBO content){
	     Session session = this.sessionFactory.openSession();
	     Transaction tx = session.beginTransaction();
	        session.delete(content);
	        tx.commit();
	        session.close();
	 }
	
	@SuppressWarnings("unchecked")
	public CustomerUserBO authenticateCustomerUser(String email, String password){
    	 Session session = this.sessionFactory.openSession();
    	 List<CustomerUserBO> customerUser = new ArrayList<CustomerUserBO>();
    	 customerUser = session.createQuery("from CustomerUserBO where email=?").setParameter(0, email).list();
    	 session.close();
 		if (customerUser.size() > 0) {
 			return customerUser.get(0);
 		} else {
 			return null;
 		}
    }
	
	@Override
    public void saveCustomerUser(CustomerUserBO custUser) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.persist(custUser);
        tx.commit();
        session.close();
    }
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ZoneBO> getZoneFromZBO(String uuid, Long minor, Long major){
		Session session = this.sessionFactory.openSession();
		List<ZoneBO> zones = new ArrayList<ZoneBO>();
		zones = session.createQuery("from ZoneBO where uuid=? and minor=? and major=?").setParameter(0, uuid).setParameter(1, minor).setParameter(2, major).list();
		session.close();
		return zones;
	}
	
	@SuppressWarnings("unchecked")
	public List<ContentBO> getContentsByZoneId(Long zoneId){
		Session session = this.sessionFactory.openSession();
		List<ContentBO> contents = new ArrayList<ContentBO>();
		contents = session.createQuery("from ContentBO where zoneId=?").setParameter(0, zoneId).list();
		session.close();
		return contents;
	}
	
	@SuppressWarnings("unchecked")
	public List<ContentBO> getAllAds(){
		Session session = this.sessionFactory.openSession();
		List<ContentBO> contents = new ArrayList<ContentBO>();
		Date date= new Date();
		//Date date = new Timestamp(new Date().getTime());
		Criteria criteria = session.createCriteria(ContentBO.class);
		criteria.add(Restrictions.le("startDate", date));
        criteria.add(Restrictions.gt("endDate", date));
        contents = criteria.list();
		session.close();
		return contents;
	}

}