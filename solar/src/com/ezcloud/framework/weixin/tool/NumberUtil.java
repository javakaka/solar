/**     
* @Title: NumberUtil.java   
* @Package com.ezcloud.framework.weixin.tool   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-28 下午07:32:37   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.tool;

/**   
 * @ClassName: NumberUtil   
 * @Description: TODO
 * @author ez-cloud work group   
 * @date 2013-11-28 下午07:32:37   
 *      
 */
public class NumberUtil {

	public static double getDouble(String s)
	{
		double db =0.0;
		if(s == null || s.trim().length() ==0)
		{
			db =0.0;
		}
		else{
			try
			{
				db =Double.parseDouble(s);
			}catch(Exception e)
			{
				db =0.0;
			}
		}
		return db;
	}
	
	public static String  getTwoDecimal(String val)
	{
		String backStr =null;
		if(val == null || val.trim().length() == 0)
		{
			backStr ="";
		}
		else
		{
			int iPos =val.indexOf(".");
			if(iPos !=-1)
			{
				val =val +"00";
				backStr =val.substring(0,iPos+3);
			}
			else
			{
				backStr =val +".00";
			}
		}
		return backStr;
	}
	
	public static String removeDecimal(String number)
	{
		String result ="";
		int iPos =-1;
		if(number == null || number.trim().length() == 0)
		{
			result ="";
		}
		else
		{
			iPos =number.indexOf(".");
			if(iPos != -1)
			{
				result =number.substring(0,iPos);
			}
			else
			{
				result =number;
			}
		}
		return result;
	}
	
	public static int stringToInt(String str)
	{
		int value =0;
		if(str == null || str.trim().length() ==0 )
		{
			value =0;
		}
		else
		{
			value =Integer.parseInt(str);
		}
		return value;
	}
	public static void main(String args[])
	{
		String testNumber1 ="12.008";
		String testNumber2 ="12.";
		String testNumber3 ="12";
		System.out.println("result1----->>"+NumberUtil.removeDecimal(testNumber1));
		System.out.println("result2----->>"+NumberUtil.removeDecimal(testNumber2));
		System.out.println("result3----->>"+NumberUtil.removeDecimal(testNumber3));
		System.out.println("result3----->>"+NumberUtil.removeDecimal(""));
		System.out.println("result3----->>"+NumberUtil.removeDecimal(null));
		
	}
}
