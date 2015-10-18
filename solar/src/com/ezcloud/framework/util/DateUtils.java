package com.ezcloud.framework.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.DateUtil;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2015-1-9 上午10:10:50  
 * 类说明: 
 */
public class DateUtils {

	/**
	 * 取上一个月的这一天
	 * @param date
	 * @return
	 */
	public static Calendar getDateOfLastMonth(Calendar date) {  
	    Calendar lastDate = (Calendar) date.clone();  
	    lastDate.add(Calendar.MONTH, -1);  
	    return lastDate;  
	} 
	
	/**
	 * 取下一个月的这一天
	 * @param date
	 * @return
	 */
	public static Calendar getDateOfNextMonth(Calendar date) {  
	    Calendar lastDate = (Calendar) date.clone();  
	    lastDate.add(Calendar.MONTH, 1);  
	    return lastDate;  
	}
	  
	/**
	 * 取上一个月的这一天
	 * @param date
	 * @return 返回日历对象
	 */
	public static Calendar getDateOfLastMonth(String dateStr) {  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        Date date = sdf.parse(dateStr);  
	        Calendar c = Calendar.getInstance();  
	        c.setTime(date);  
	        return getDateOfLastMonth(c);  
	    } catch (ParseException e) {  
	        throw new IllegalArgumentException("Invalid date format(yyyy-MM-dd): " + dateStr);  
	    }  
	} 
	
	/**
	 * 取上一个月的这一天
	 * @param date
	 * @return 返回字符串
	 */
	public static String getStrOfLastMonth(String dateStr) {  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        Date date = sdf.parse(dateStr);  
	        Calendar c = Calendar.getInstance();  
	        c.setTime(date);  
	        return sdf.format(getDateOfLastMonth(c).getTime());  
	    } catch (ParseException e) {  
	        throw new IllegalArgumentException("Invalid date format(yyyy-MM-dd): " + dateStr);  
	    }  
	} 
	
	/**
	 * 取下一个月的这一天
	 * @param dateStr
	 * @return 返回日历对象
	 */
	public static Calendar getDateOfNextMonth(String dateStr) {  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        Date date = sdf.parse(dateStr);  
	        Calendar c = Calendar.getInstance();  
	        c.setTime(date);  
	        return getDateOfNextMonth(c);  
	    } catch (ParseException e) {  
	        throw new IllegalArgumentException("Invalid date format(yyyy-MM-dd): " + dateStr);  
	    }  
	}
	
	/**
	 * 取下一个月的这一天
	 * @param dateStr
	 * @return 返回字符串
	 */
	public static String getStrOfNextMonth(String dateStr) {  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    try {  
	        Date date = sdf.parse(dateStr);  
	        Calendar c = Calendar.getInstance();  
	        c.setTime(date);  
	        return sdf.format(getDateOfNextMonth(c).getTime());  
	    } catch (ParseException e) {  
	        throw new IllegalArgumentException("Invalid date format(yyyy-MM-dd): " + dateStr);  
	    }  
	}
	
	@SuppressWarnings("unchecked")
	public static DataSet getEveryMonthPeriod(String start_date,String end_date) throws ParseException
	{
		DataSet ds =new DataSet();
		Row row =null;
		String period_start_date =start_date;
		String period_end_date =start_date;
		boolean boolFind =true;
		long start_com=0;
		long end_com=0;
		start_com =DateUtil.compare(start_date+" 00:00:00", end_date+" 00:00:00");
		if(start_com >= 0)
		{
			return ds;
		}
		do
		{
			period_start_date =period_end_date;
			period_end_date =DateUtils.getStrOfNextMonth(period_start_date);
			start_com =DateUtil.compare(period_start_date+" 00:00:00", period_end_date+" 00:00:00");
			if(start_com < 0)
			{
				row =new Row();
				row.put("start_date",period_start_date );
				row.put("end_date", period_end_date);
				end_com =DateUtil.compare(period_end_date+" 00:00:00", end_date+" 00:00:00");
				if(end_com >= 0)
				{
					row.put("end_date", end_date);
					boolFind =false;
				}
				ds.add(row);
			}
		}
		while(boolFind);
		return ds;
	}
	
	public static Row getAppointedMonthPeriod(String start_date, String end_date, String appointed_date) throws ParseException
	{
		Row row =new Row();
		String period_start_date =start_date;
		String period_end_date =start_date;
		boolean boolFind =true;
		long start_com=0;
		long end_com=0;
		start_com =DateUtil.compare(appointed_date+" 00:00:00", start_date+" 00:00:00");
		end_com =DateUtil.compare(appointed_date+" 00:00:00", end_date+" 00:00:00");
		if(start_com < 0 || end_com>0)
		{
			row.put("period_start_date", "-1");
			row.put("period_end_date", "-1");
			return row;
		}
		
		do
		{
			period_start_date =period_end_date;
			period_end_date =DateUtils.getStrOfNextMonth(period_start_date);
			start_com =DateUtil.compare(appointed_date+" 00:00:00", period_start_date+" 00:00:00");
			end_com =DateUtil.compare(appointed_date+" 00:00:00", period_end_date+" 00:00:00");
			if(start_com >= 0 && end_com <=0)
			{
				boolFind =false;
			}
		}
		while(boolFind);
		row.put("period_start_date", period_start_date);
		row.put("period_end_date", period_end_date);
		return row;
	}
	  
	public static void main(String[] args) {
//	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	    System.out.println(sdf.format(getDateOfLastMonth("2014-12-02").getTime()));
//	    System.out.println(sdf.format(getDateOfLastMonth("2000-03-31").getTime()));
//	    System.out.println(getStrOfLastMonth("2015-01-29"));
	    System.out.println(getStrOfNextMonth("2015-01-29"));
	    try {
			DataSet ds =getEveryMonthPeriod("2014-12-02","2015-12-02");
			System.out.print("=============>>"+ds);
			Row monthRow =getAppointedMonthPeriod("2014-12-02","2015-12-02","2015-02-03");
			System.out.print("=============>>"+monthRow);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
