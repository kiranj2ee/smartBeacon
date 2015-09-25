package com.zambient.beacon.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.thoughtworks.xstream.core.util.Base64Encoder;

public class CommonUtil {
	final static Logger logger = Logger.getLogger(CommonUtil.class);
	
	
	public static String getProperty(String property)
	{
		Properties prop = new Properties();
		InputStream input = null;
		try {
			input = new FileInputStream("C:\\Users\\Home\\git\\common.properties");
//			input = new FileInputStream("/etc/onehive/common.properties");
			prop.load(input);
			String retVal=prop.getProperty(property);
			return retVal;
	
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}


//	public static  String BASEURL = "https://qa.onehive.com/";
//	public static String LINKEDINURL = "https://qa.onehive.com/auth";
	
	public static boolean isValidEmailAddress(String email) {
	   boolean result = true;
	   try {
		      InternetAddress emailAddr = new InternetAddress(email);
		      emailAddr.validate();
		  
	   } catch (AddressException ex) {
	      result = false;
	   }
	   return result;
	}
	
	public static String generateToken() throws Exception{
		byte[] r = new byte[48]; //Means 64 bit
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.nextBytes(r);
		String token = new Base64Encoder().encode(r);
		//fix for character '/' in token for url.
//		token =token.replace("/", "a");
		return token;
	}
	
	//Thu, 26 Sep 2013 22:00:00 GMT
	public static String getDateByTimeStamp(Timestamp timestamp) {
		String date = "";
		
		Date d = new Date(timestamp.getTime());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss 'GMT'");
		date = simpleDateFormat.format(d);
		
		return date;
	}
	
	public static String getDateByString(String jsonDate) {
		if(jsonDate == null)
			return null;
		String date = null;
		try {
		    //2014-09-26T04:00:00.000Z
		  //  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
			//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss 'GMT'");
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		   // DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
		//    df.setTimeZone(TimeZone.getTimeZone("GMT"));  
		 //   Date date = new Date();  
		  //  logger.info(df.format(date));  
			Date formatDate = df.parse(jsonDate);
			
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = simpleDateFormat1.format(formatDate);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
	
	public static List<String> getCommaSeparatedIdsAsList(String ids) {
		List<String> commaSeparatedIds = new ArrayList<String>();
//		ids=ids.replace("[", "").replace("]", "").replace(" ", "");
//		String[] arrayId=ids.split(",");
//		for ( int i = 0; i< arrayId.length; i++){
//				commaSeparatedIds.add(arrayId[i]);
//		}
		return commaSeparatedIds;
	}


	public static String getCommaSeparatedIds(List<Integer> ids) {
		String commaSeparatedIds = "";
		
		for ( int i = 0; i< ids.size(); i++){
			
			if ( i != ids.size()-1){
				commaSeparatedIds = commaSeparatedIds+ids.get(i)+",";
			} else
				commaSeparatedIds = commaSeparatedIds+ids.get(i);
		}
		return commaSeparatedIds;
	}
	
	
	public static long getUserIdFromRequestHeader(HttpServletRequest request) {
		String token = request.getHeader("Authorization");
		long userId = 0;
		
		if(token != null) {
			try {
				logger.info(">>>>>>preHandle>>>>>>>>>>>>>>>>"+token);
//				String[] split = token.split(" ");
//				userId = Integer.parseInt(split[0]);
//				token = split[1];
				
				logger.info(">>>>>>preHandle>>>>>>>>>>>>>>>>"+token +">>>>>>isValid>>>>>>>>");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		return userId;
	}
	
	public static BufferedImage resizeImage(final Image image, int width, int height) {
        final BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        final Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setComposite(AlphaComposite.Src);
        //below three lines are for RenderingHints for better image quality at cost of higher processing time
        graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING,RenderingHints.VALUE_RENDER_QUALITY);
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(image, 0, 0, width, height, null);
        graphics2D.dispose();
        return bufferedImage;
    }
	
	public boolean isArray(JSONObject feedObject, String string) {
		
		try {
			JSONArray jsonArray = feedObject.getJSONArray(string);
			return true;
		} catch (JSONException e) {
			return false;
		}
	
		
	}
	
	
	
	public static String getDateOnlyByString(String jsonDate) {
		if(jsonDate == null)
			return null;
		String date = null;
		try {
		    //2014-09-26T04:00:00.000Z
		  //  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
			//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss 'GMT'");
		    DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		   // DateFormat df = new SimpleDateFormat("MM/dd/yyyy");  
		//    df.setTimeZone(TimeZone.getTimeZone("GMT"));  
		 //   Date date = new Date();  
		  //  logger.info(df.format(date));  
			Date formatDate = df.parse(jsonDate);
			
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			date = simpleDateFormat1.format(formatDate);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
	public static Date getDateTypefromString(String timestamp) {
		SimpleDateFormat formatter = new SimpleDateFormat("");
		Date date = null;
		try {
			date = formatter.parse(timestamp);
//			System.out.println(date);
//			System.out.println(formatter.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String getPathOfFile(){
		 File f = null;
	      String path = "";
	      boolean bool = false;
	      
	      try{
	         // create new files
	         f = new File("test.txt");
	         
	         // returns true if the file exists
	         bool = f.exists();
	         
	         // if file exists
	         if(bool){
	            // get absolute path
	            path = f.getAbsolutePath();
	            
	            // prints
	            System.out.print("Absolute Pathname "+ path);
	         }
	      }catch(Exception e){
	         // if any error occurs
	         e.printStackTrace();
	         //System.out.println("Exception-=======-->>> "+e);
	      }
		
		return path;
	}
}
