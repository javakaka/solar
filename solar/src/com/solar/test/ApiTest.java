package com.solar.test;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.vo.IVO;
import com.ezcloud.framework.vo.VOConvert;
import com.ezcloud.utility.Base64Util;
import com.ezcloud.utility.NetUtil;

/**
 * 测试类
 * @author Administrator
 *
 */
public class ApiTest {

	//查询版本
	public static void getVersion()
	{
//		String url ="http://localhost:8080/solar/api/version/lastest.do";
//		String url ="http://120.25.61.89:8080/solar-test/api/version/lastest.do";
		String url ="http://101.200.190.231/api/version/lastest.do";
		IVO ivo =new IVO();
		   try {
			   //1房租宝房东租客版2中介版
//				ivo.set("app", "1");
				//1 ios 2 android 3 wp
				ivo.set("device", "1");
				String json =  VOConvert.ivoToJson(ivo);
				System.out.println("\n 加密前 ivo to json ====>>"+json);
				//加密
				json =AesUtil.encode(json);
				System.out.println("\n ivo to json ====>>"+json);
				String res =NetUtil.getNetResponse(url, json,"UTF-8");
				System.out.println("\n response json ====>> \n");
				System.out.print(res);
				res = AesUtil.decode(res);
				System.out.println("\n decode response json ===========>>\n"+res);
		   } catch (JException e) {
				e.printStackTrace();
			}
		   catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	//发送短信验证码
	public static void sendSms()
	{
//		String url ="http://localhost:8080/solar/api/sms/send.do";
		String url ="http://120.25.61.89:8080/solar-test/api/sms/send.do";
		IVO ivo =new IVO();
		   try {
			   //手机号
				ivo.set("telephone", "13826531136");
//				ivo.set("telephone", "13826531137");
//				ivo.set("telephone", "13590856852");
				//1 发送短信 0不发送短信
//				ivo.set("type", "0");
				ivo.set("type", "1");
				String json =  VOConvert.ivoToJson(ivo);
				System.out.println("\n 加密前 ivo to json ====>>"+json);
				//加密
				json =AesUtil.encode(json);
				System.out.println("\n ivo to json ====>>"+json);
				String res =NetUtil.getNetResponse(url, json,"UTF-8");
				System.out.println("\n response json ====>> \n");
				System.out.print(res);
				res = AesUtil.decode(res);
				System.out.println("\n decode response json ===========>>\n"+res);
		   } catch (JException e) {
				e.printStackTrace();
			}
		   catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	//注册
	public static void register()
	{
//		String url ="http://localhost:8080/solar/api/user/register.do";
		String url ="http://120.25.61.89:8080/solar-test/api/user/register.do";
		IVO ivo =new IVO();
		try {
			//手机号
			ivo.set("telephone", "13826531139");
			ivo.set("username", "kaka3");
			ivo.set("password", "E10ADC3949BA59ABBE56E057F20F883E");
			ivo.set("email", "510836103@qq.com");
			ivo.set("company", "谷歌");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	//登陆
	public static void login()
	{
//		String url ="http://localhost:8080/solar/api/user/login.do";
		String url ="http://120.25.61.89:8080/solar-test/api/user/login.do";
		IVO ivo =new IVO();
		   try {
				ivo.set("username", "13826531139");
			   ivo.set("password", "E10ADC3949BA59ABBE56E057F20F883E");
				String json =  VOConvert.ivoToJson(ivo);
				System.out.println("\n 加密前 ivo to json ====>>"+json);
				//加密
				json =AesUtil.encode(json);
				System.out.println("\n ivo to json ====>>"+json);
				String res =NetUtil.getNetResponse(url, json,"UTF-8");
				System.out.println("\n response json ====>> \n");
				System.out.print(res);
				res = AesUtil.decode(res);
				System.out.println("\n decode response json ===========>>\n"+res);
		   } catch (JException e) {
				e.printStackTrace();
			}
		   catch (Exception e) {
				e.printStackTrace();
			}
	}
	//根据ID查询用户信息
	public static void queryUserProfile()
	{
//		String url ="http://localhost:8080/solar/api/user/profile.do";
		String url ="http://120.25.61.89:8080/solar-test/api/user/profile.do";
		IVO ivo =new IVO();
		try {
			ivo.set("id", "1");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//根据ID查询用户信息
	public static void updateUserProfile()
	{
		String url ="http://localhost:8080/solar/api/user/updateProfile.do";
//		String url ="http://120.25.61.89:8080/solar-test/api/user/updateProfile.do";
		IVO ivo =new IVO();
		try {
			ivo.set("id", "1");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//
	public static void changePwd()
	{
		String url ="http://localhost:8080/solar/api/user/changePassword.do";
//		String url ="http://120.25.61.89:8080/solar-test/api/user/changePassword.do";
		IVO ivo =new IVO();
		try {
			ivo.set("user_id", "1");
			ivo.set("oldPwd", "E10ADC3949BA59ABBE56E057F20F883E");//123456
			ivo.set("newPwd", "670B14728AD9902AECBA32E22FA4F6BD");//000000
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void logout()
	{
		String url ="http://localhost:8080/solar/api/user/logout.do";
//		String url ="http://120.25.61.89:8080/solar-test/api/user/logout.do";
		IVO ivo =new IVO();
		try {
			ivo.set("id", "1");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void upload_avatar()
	{
//		String url ="http://localhost:8080/solar/api/user/upload_avatar.do";
		String url ="http://120.25.61.89:8080/solar-test/api/user/upload_avatar.do";
		IVO ivo =new IVO();
		try {
			ivo.set("id", "1");
//			String pic_path ="/Users/TongJianbo/Desktop/default_user_avatar.png";
			String pic_path ="/Users/TongJianbo/Desktop/default_user_avatar.png";
			String pictrue = Base64Util.GetImageStr(pic_path);
			String picture_base64_str =Base64Util.encode(pictrue.getBytes());
			ivo.set("picture_base64_str", picture_base64_str);
			
			
			ivo.set("picture_base64_str", picture_base64_str);
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
//			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//分页查询
	public static void queryInfoPage()
	{
//		String url ="http://localhost:8080/solar/api/info/list.do";
		String url ="http://120.25.61.89:8080/solar-test/api/info/list.do";
		IVO ivo =new IVO();
		try {
			ivo.set("page", "1");
			ivo.set("page_size", "2");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//查询电站类型
	public static void queryStationType()
	{
//		String url ="http://localhost:8080/solar/api/station-type/list.do";
		String url ="http://120.25.61.89:8080/solar-test/api/station-type/list.do";
		IVO ivo =new IVO();
		try {
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询电站类型
	public static void queryStationPage()
	{
//		String url ="http://localhost:8080/solar/api/station/list.do";
		String url ="http://120.25.61.89:8080/solar-test/api/station/list.do";
		IVO ivo =new IVO();
		try {
			ivo.set("page", "1");
			ivo.set("page_size", "10");
			ivo.set("type_id", "3");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询电站类型
	public static void queryStationDetail()
	{
//		String url ="http://localhost:8080/solar/api/station-detail/profile.do";
		String url ="http://120.25.61.89:8080/solar-test/api/station-detail/profile.do";
		IVO ivo =new IVO();
		try {
			ivo.set("id", "1");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询电站类型
	public static void queryContactUs()
	{
//		String url ="http://localhost:8080/solar/api/company-info/contact-us.do";
		String url ="http://120.25.61.89:8080/solar-test/api/company-info/contact-us.do";
		IVO ivo =new IVO();
		try {
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//查询电站类型
	public static void queryComponyDesc()
	{
//		String url ="http://localhost:8080/solar/api/company-info/desc.do";
		String url ="http://120.25.61.89:8080/solar-test/api/company-info/desc.do";
		IVO ivo =new IVO();
		try {
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询电站类型
	public static void queryInfo()
	{
//		String url ="http://localhost:8080/solar/api/news/list.do";
		String url ="http://120.25.61.89:8080/solar-test/api/news/list.do";
		IVO ivo =new IVO();
		try {
			ivo.set("page", "1");
			ivo.set("page_size", "10");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//查询电站类型
	public static void queryRecruit()
	{
//		String url ="http://localhost:8080/solar/api/recruitment/list.do";
		String url ="http://120.25.61.89:8080/solar-test/api/recruitment/list.do";
		IVO ivo =new IVO();
		try {
			ivo.set("page", "1");
			ivo.set("page_size", "10");
			String json =  VOConvert.ivoToJson(ivo);
			System.out.println("\n 加密前 ivo to json ====>>"+json);
			//加密
			json =AesUtil.encode(json);
			System.out.println("\n ivo to json ====>>"+json);
			String res =NetUtil.getNetResponse(url, json,"UTF-8");
			System.out.println("\n response json ====>> \n");
			System.out.print(res);
			res = AesUtil.decode(res);
			System.out.println("\n decode response json ===========>>\n"+res);
		} catch (JException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[])
	{
		System.out.println("\n==========request start=============");
//获取最新版本		
//		getVersion();
//		发送短信验证码
//		sendSms();
//		注册
//		register();
//		登陆
//		login();
//		根据ID查询用户信息
//		queryUserProfile();
//		根据ID查询用户信息
//		updateUserProfile();
//		changePwd();
//		注销
//		logout();
//		上传头像
//		upload_avatar();
//		queryInfoPage();
//		查询电站类型
//		queryStationType();
//		查询电站列表
		queryStationPage();
//		查询电站详情
//		queryStationDetail();
//		查询联系我们
//		queryContactUs();
//		查询集团介绍
//		queryComponyDesc();
//		查询情报列表
//		queryInfo();
//		查询情报列表
//		queryRecruit();
		System.out.println("\n==========request  end=============");
	}
	
}
