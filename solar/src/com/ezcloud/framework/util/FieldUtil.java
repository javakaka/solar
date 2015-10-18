package com.ezcloud.framework.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;

import com.ezcloud.framework.plugin.pay.Unifiedorder;
import com.ezcloud.framework.vo.Row;

public class FieldUtil {

	public static Row getObjectNotEmptyFieldsUrlParamsStr(Object obj,String api_key)
	{
		Row paramRow =new Row();
		ArrayList<String> list = new ArrayList<String>();
		Row row =new Row();
		String str ="";
		Field fields[] =null;
		fields =obj.getClass().getDeclaredFields();
		for(int i=0;i<fields.length;i++)
		{
			fields[i].setAccessible(true);
			String field_type =fields[i].getType().toString();
			try {
				String value =(String)fields[i].get(obj);
				String name =fields[i].getName();
				if(! StringUtils.isEmptyOrNull(value))
				{
					row.put(name, value);
					list.add(name);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		Collections.sort(list);
		String xml ="<xml>";
		for(int i=0;i<list.size();i++)
		{
			String sort_name =(String)list.get(i);
			String value =row.getString(sort_name);
			if(str.length()>0)
			{
				str +="&"+sort_name+"="+value;
			}
			else
			{
				str +=sort_name+"="+value;
			}
			xml +="<"+sort_name+">"+value+"</"+sort_name+">";
		}
		str +="&key="+api_key;
		String sign =Md5Util.get32UppercaseMD5(str);
		xml +="<sign>"+sign+"</sign>";
		xml +="</xml>";
		paramRow.put("url", str);
		paramRow.put("sign", sign);
		paramRow.put("xml", xml);
		return paramRow;
	}
	
	public static String appendFiledToUrlParam(String urlParam,String name,String value)
	{
		if(!StringUtils.isEmptyOrNull(name) && !StringUtils.isEmptyOrNull(value))
		{
			if(!StringUtils.isEmptyOrNull(urlParam))
			{
				urlParam +="&"+name+"="+value;
			}
			else
			{
				urlParam =name+"="+value;
			}
		}
		return urlParam;
	}
	
	public static String getWeixinRequestSign(ArrayList<String> key_list,Row dataRow,String api_key)
	{
		String url_data_str="";
		Collections.sort(key_list);
		for(int i=0;i<key_list.size();i++)
		{
			String sort_name =(String)key_list.get(i);
			String value =dataRow.getString(sort_name);
			if(url_data_str.length()>0)
			{
				url_data_str +="&"+sort_name+"="+value;
			}
			else
			{
				url_data_str +=sort_name+"="+value;
			}
		}
		url_data_str +="&key="+api_key;
		String sign =Md5Util.get32UppercaseMD5(url_data_str);
		return sign;
	}
	
	public static void main(String[] args) {
		String str ="appId=wxa4db6002b27804cb&nonceStr=sQ1VoPLKvoupYLmT&package=prepay_id=wx20150926180254f1f50afc280800694826&signType=MD5&timeStamp=1443261774&key=5a01ba48472b8ac3eb52e74eed35cc12";
		String sign =Md5Util.get32UppercaseMD5(str);
		System.out.println("sign====>>"+sign);
		System.out.println("str====>>"+System.currentTimeMillis()/1000);
	}
}
