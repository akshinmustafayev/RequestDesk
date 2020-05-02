package org.RequestDesk.misc;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class HashUtil 
{
	public static String GetSHA256() 
	{
		String text = "";
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime today = LocalDateTime.now();
		text = formatter.format(today);
		text = text + GenerateRandomString(25);
		
		try 
        {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			BigInteger number = new BigInteger(1, md.digest(text.getBytes(StandardCharsets.UTF_8)));
			StringBuilder hexString = new StringBuilder(number.toString(16));  
			  
	        // Pad with leading zeros 
	        while (hexString.length() < 32)  
	        {  
	            hexString.insert(0, '0');  
	        }  
	  
	        return hexString.toString();
        }
		catch (NoSuchAlgorithmException e) 
		{
			return GenerateRandomString(256);
		}
	}
	
	public static String GetSHA256String(String text) 
	{
		try 
        {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			BigInteger number = new BigInteger(1, md.digest(text.getBytes(StandardCharsets.UTF_8)));
			StringBuilder hexString = new StringBuilder(number.toString(16));  
			  
	        // Pad with leading zeros 
	        while (hexString.length() < 32)  
	        {  
	            hexString.insert(0, '0');  
	        }  
	  
	        return hexString.toString();
        }
		catch (NoSuchAlgorithmException e) 
		{
			return "0";
		} 
	}
	
	private static String GenerateRandomString(int length) {
	    int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = length;
	    Random random = new Random();
	 
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	 
	    return generatedString;
	}
}
