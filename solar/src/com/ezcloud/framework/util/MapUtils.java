package com.ezcloud.framework.util;

import java.util.HashMap;

import com.ezcloud.framework.vo.Row;


/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2015-1-21 下午3:40:25  
 * 类说明: 
 */
public class MapUtils {

	private MapUtils() {
	}

	/**
	 * 将Map对象转换为Row对象
	 * 空字符的字段不转换
	 * 将null值的字段设置为空字符
	 */
	@SuppressWarnings("rawtypes")
	public static Row convertMaptoRowFillNullFieldWithEmptySpace(HashMap map)
	{
		Row row =null;
		if(map == null )
		{
			return null;
		}
		row =new Row();
		Object keyNames[]=map.keySet().toArray();
		String name =null;
		String value =null;
		for(int i=0; i<keyNames.length; i++)
		{
			name =(String)keyNames[i];
			if(name == null || name.replace(" ", "").length() ==0)
			{
				continue;
			}
			value =(String)map.get(name);
			if(value == null || value.replace(" ", "").length() == 0)
			{
				value ="";
			}
			row.put(name, value);
		}
		return row;
	}
	
	/**
	 * 将Map对象转换为Row对象
	 * 空字符的字段不转换
	 * null值的字段排除在外
	 */
	@SuppressWarnings("rawtypes")
	public static Row convertMaptoRowWithoutNullField(HashMap map)
	{
		Row row =null;
		if(map == null )
		{
			return null;
		}
		row =new Row();
		Object keyNames[]=map.keySet().toArray();
		String name =null;
		String value =null;
		for(int i=0; i<keyNames.length; i++)
		{
			name =(String)keyNames[i];
			if(name == null || name.replace(" ", "").length() ==0)
			{
				continue;
			}
			value =(String)map.get(name);
			if(value == null || value.replace(" ", "").length() == 0)
			{
				continue;
			}
			row.put(name, value);
		}
		return row;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args) {
		
		HashMap map =new HashMap<String,String>();
		map.put("name", "tong");
		map.put("age", "23");
		map.put("mm", "9999999");
		map.put("hhhh", null);
		Row row1 =convertMaptoRowFillNullFieldWithEmptySpace(map);
		Row row2 =convertMaptoRowWithoutNullField(map);
		System.out.println("row1 ===========>>"+row1);
		System.out.println("row2 ===========>>"+row2);
	}
}
