package com.ezcloud.framework.util;

import java.util.Random;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2014-12-29 下午5:18:28  
 * 类说明: 
 */
public class NumberUtils {

	public NumberUtils() {
	}
	
	/**
	 * 验证字符串是数字
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str)
	{
		boolean bool =true;
		if(str == null)
			return false;
		try
		{
			Double.parseDouble(str);
		}
		catch(Exception e)
		{
			bool =false;
		}
		return bool;
	}
	
	/**
	 * 验证字符串是正数
	 * @param str
	 * @return
	 */
	public static boolean isPositiveNumber(String str)
	{
		boolean bool =true;
		double change =0.0;
		if(str == null)
			return false;
		try
		{
			change=Double.parseDouble(str);
			if(change < 0)
			{
				bool =false;
			}
		}
		catch(Exception e)
		{
			bool =false;
		}
		return bool;
	}
	
	/**
	 * 在字符串是数字的前提下，取两位小数
	 * @param str
	 * @return
	 */
	public static String getTwoDecimal(String str)
	{
		int posi =str.indexOf(".");
		if(posi == -1)
		{
			str =str+".00";
		}
		else
		{
			str =str+"00";
			str =str.substring(0, posi+3);
		}
		return str;
	}
	
	/**
	 * 在字符串是数字的前提下，取两位小数
	 * @param str
	 * @return
	 */
	public static String getTwoDecimalByDecimalFormat(double number)
	{
		String decimal="";
		java.text.DecimalFormat df =new java.text.DecimalFormat("#.##");
		decimal =df.format(number);
		return decimal;
	}
	
	/**
	 * 取6位随机整数
	 * @return
	 */
	public static int getSixRandomNumber()
	{
		Random random =new Random();
		int randomNumber =random.nextInt(899999);
		randomNumber =100000+randomNumber;
		return randomNumber;
	}
	
	public static void main(String[] args) {
		String str ="10000.0";
		System.out.println(""+getTwoDecimal(str));
	}
	
}
