package com.ezcloud.framework.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2014-12-29 下午5:18:28  
 * 类说明: 
 */
public class StringUtils {

	public StringUtils() {
	}
	
	/**
	 * 验证字符串是空或者null
	 * @param str
	 * @return
	 */
	public static boolean isEmptyOrNull(String str)
	{
		boolean bool =false;
		if(str == null)
			return true;
		if(str.replace(" ", "").length() == 0)
		bool =true;
		return bool;
	}
	
	/**
	 * 验证字符串是否是手机号码
	 * @param telephone
	 * 移动号码段:139、138、137、136、135、134、150、151、152、157、158、159、182、183、187、188、147、172
     * 联通号码段:130、131、132、136、185、186、145
     * 电信号码段:133、153、180、189
	 * @return
	 */
	public static boolean isTelphone(String telephone)
	{
		boolean bool =true;
		String regex = "^((13[0-9])|(172)|(14[5|7])|(15([0-3]|[5-9]))|(18[0-9]))\\d{8}$"; 
		bool =check(telephone, regex);
		return bool;
	}
	
	/**
	 * 验证字符串是否是邮箱账号
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email)
	{
		boolean bool =false;
//		String regex = "^\\w+[-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
//		String regex = "^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
		String regex = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		bool =check(email, regex);
		return bool;
	}
	
	/**
	 * 验证字符串是否是邮箱账号
	 * @param email
	 * @return
	 */
	public static boolean isNumber(String str)
	{
		boolean bool =false;
		String regex = "[0-9]*";
		bool =check(str, regex);
		return bool;
	}
	
	public static boolean check(String str, String regex) 
	{
		boolean flag =false;
		try {
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(str);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	
	public static String string2Json(String s) {       
	    StringBuffer sb = new StringBuffer ();       
	    for (int i=0; i<s.length(); i++) {       
	        char c = s.charAt(i);       
	        switch (c) {       
	        case '\"':       
	            sb.append("\\\"");       
	            break;       
	        case '\\':       
	            sb.append("\\\\");       
	            break;       
	        case '/':       
	            sb.append("\\/");       
	            break;       
	        case '\b':       
	            sb.append("\\b");       
	            break;       
	        case '\f':       
	            sb.append("\\f");       
	            break;       
	        case '\n':       
	            sb.append("\\n");       
	            break;       
	        case '\r':       
	            sb.append("\\r");       
	            break;       
	        case '\t':       
	            sb.append("\\t");       
	            break;       
	        default:       
	            sb.append(c);       
	        }  
	 }
	    return sb.toString();       
	}
	
	public static String replaceBreak(String s) {       
		StringBuffer sb = new StringBuffer ();       
		for (int i=0; i<s.length(); i++) {       
			char c = s.charAt(i);       
			switch (c) {       
			case '\n':       
				sb.append("\\n");       
				break;       
			case '\r':       
				sb.append("\\r");       
				break;       
			default:       
				sb.append(c);       
			}  
		}
		return sb.toString();       
	}
	
	public static String subStrBeforeDotNotIncludeDot(String str){
		String result =str;
		int iPos =result.indexOf(".");
		if(iPos!= -1)
		{
			result =result.substring(0,iPos);
		}
		return result;
	}
	
	public static void main(String[] args) {
		String email ="510836102@qq.com";
		boolean bool =isEmail(email);
		System.out.println("bool:"+bool);
		System.out.println(subStrBeforeDotNotIncludeDot(email));
		System.out.println(isTelphone("18275887408"));
	}
}
