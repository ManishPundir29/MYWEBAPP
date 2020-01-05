package com.mywebapp.utils;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

public class RandomSaltGenerator {
	 private static final Random RANDOM = new SecureRandom();
	public static String generateSalt() throws NoSuchAlgorithmException
	{
		char[] CHARSET_AZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
		char[] CHARSET_09 = "0123456789".toCharArray();
		
		 Random random = new SecureRandom();
		    char[] result = new char[12];
		    char[] result1 = new char[12];
		    for (int i = 0; i < result.length; i++) {
		        // picks a random index out of character set > random character
		        int randomCharIndex = random.nextInt(CHARSET_AZ.length);
		        result[i] = CHARSET_AZ[randomCharIndex];
		    }
		    for (int i = 0; i < result1.length; i++) {
		        // picks a random index out of character set > random character
		        int randomCharIndex = random.nextInt(CHARSET_09.length);
		        result1[i] = CHARSET_09[randomCharIndex];
		    }
		    return new String(result)+ new String(result1);
	

    }
	public static String generatesecureRandomSalt() throws NoSuchAlgorithmException
	{
		char[] CHARSET_AZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
		char[] CHARSET_az = "abcdefghijklmnopqrstuvwxyz".toCharArray();
		char[] CHARSET_09 = "0123456789".toCharArray();
		char[] CHARSET_special = "!@#$%^&*".toCharArray();
		
		Random random = new SecureRandom();
		char[] result = new char[12];
		char[] result1 = new char[10];
		char[] result2 = new char[10];
		//char[] result3 = new char[6];
		for (int i = 0; i < result.length; i++) {
			// picks a random index out of character set > random character
			int randomCharIndex = random.nextInt(CHARSET_AZ.length);
			result[i] = CHARSET_AZ[randomCharIndex];
		}
		for (int i = 0; i < result1.length; i++) {
			// picks a random index out of character set > random character
			int randomCharIndex = random.nextInt(CHARSET_az.length);
			result1[i] = CHARSET_az[randomCharIndex];
		}
		for (int i = 0; i < result2.length; i++) {
			// picks a random index out of character set > random character
			int randomCharIndex = random.nextInt(CHARSET_09.length);
			result2[i] = CHARSET_09[randomCharIndex];
		}
		/*for (int i = 0; i < result3.length; i++) {
			// picks a random index out of character set > random character
			int randomCharIndex = random.nextInt(CHARSET_special.length);
			result3[i] = CHARSET_special[randomCharIndex];
		}*/
		//System.out.println("new ::; " +new String(result)+ new String(result1)+ new String(result2));
		return new String(result)+ new String(result1)+ new String(result2);
		
		
	}
	
	public static String generatetoken() throws NoSuchAlgorithmException
	{
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		 byte[] bSalt = new byte[25];
		 random.nextBytes(bSalt);
		 String randSalt=bSalt.toString();
	/*	 String randSalt=new String(bSalt);
		 System.out.println(randSalt+">>>>>>>>>>>salt");*/
		 return randSalt;
	}
	
	public static String generateOtp() throws NoSuchAlgorithmException
	{
		char[] CHARSET_09 = "0123456789".toCharArray();
		
		 Random random = new SecureRandom();
		    char[] result = new char[6];
		    for (int i = 0; i < result.length; i++) {
		        // picks a random index out of character set > random character
		        int randomCharIndex = random.nextInt(CHARSET_09.length);
		        result[i] = CHARSET_09[randomCharIndex];
		    }
		     		    return new String(result);
	}
	
	
}
