package com.ezcloud.framework.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.ezcloud.utility.MD5;

/**
 * md5加密辅助类
 * 
 * @author Administrator
 */

public class Md5Util {

	// md5加密生成字符串
	public static String Md5(String plainText) {

		StringBuffer buf = new StringBuffer("");
			MessageDigest md;
			try {
				md = MessageDigest.getInstance("MD5");
				md.update(plainText.getBytes());
			byte b[] = md.digest();
			int i;
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		return buf.toString().toUpperCase();
	}
	
	/**
	 * MD5 32位加密方法一 小写
	 * 
	 * @param str
	 * @return
	 */
	public final static String get32LowercaseMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9','a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] strTemp = s.getBytes("UTF-8");
			// 使用MD5创建MessageDigest对象
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte b = md[i];
				// 将没个数(int)b进行双字节加密
				str[k++] = hexDigits[b >> 4 & 0xf];
				str[k++] = hexDigits[b & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			return null;
		}
	}
	public final static String get32UppercaseMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9','a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] strTemp = s.getBytes("UTF-8");
			// 使用MD5创建MessageDigest对象
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte b = md[i];
				// 将没个数(int)b进行双字节加密
				str[k++] = hexDigits[b >> 4 & 0xf];
				str[k++] = hexDigits[b & 0xf];
			}
			String result =new String(str);
			result =result.toUpperCase();
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	

	public static String encryptMD5(String data) {
		String result ="";
		MessageDigest md5 =null;
		try {
			md5 = MessageDigest.getInstance("MD5");
			md5.update(data.getBytes());
			result =toHex(md5.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public static String toHex(byte[] buffer) {
		StringBuffer sb = new StringBuffer(buffer.length * 2);
		for (int i = 0; i < buffer.length; i++) {
			sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));
			sb.append(Character.forDigit(buffer[i] & 15, 16));
		}
		return sb.toString();
	}


	public static void main(String[] args) {

//		String ssss = Md5("123456");
////		String s3 = "E10ADC3949BA59ABBE56E057F20F883E";
//		// Md5("ezcloud");
//		System.out.println(ssss);
//		System.out.println(Md5Util.Md5("111111"));
		System.out.println(Md5Util.Md5("000000"));
////		System.out.println(ssss.equals(s3));
////		System.out.println(Md5Util.Md5("000000"));
////		System.out.println(Md5Util.Md5("723096"));
////		示例：序列号SDK-BBX-010-00001 密码 123456
////		参数输入：
////		SN= SDK-BBX-010-00001
////		PWD= 3B5D3C427365F40C1D27682D78BB31E0
//		String sn="SDK-DLS-010-00473";
//		String pwd="259963";
//		String cryptPwd =Md5Util.Md5(sn+pwd);
//		System.out.println("crypt pwd:"+cryptPwd);
//		System.out.println("crypt pwd:C1706B632C61DAB1FC57AA42EBB8D25E");
//		String sign1 ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=4ZWZUCS8LXXBGBQV2PGKN2W1GUFA&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
//		String sign2 ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=4ZWZUCS8LXXBGBQV2PGKN2W1GUFA&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
////		String sign ="appid=wx44e3ee46a26f4e21&body=订单:2015062217343610001支付备注&fee_type=CNY&mch_id=1251662201&nonce_str=HUWQQSHGGQQXFQCMHEB52ZRKZLP5&notify_url=http://localhost:8080/cxhl/notify/weixin/pay/app.do?order_no=3kLVUn/XTRB1bpSLU+EXAKhrD+UkGtrb1FIqwzqTASU=&out_trade_no=2015062217343610001&spbill_create_ip=192.168.11.99&total_fee=8000&trade_type=APP&key=ced7357666afb8b245e68a610a9c50da";
//		System.out.println(sign1.equals(sign2));
//		System.out.println("sign:"+Md5Util.Md5(sign1));
//		System.out.println("sign:"+Md5Util.Md5(sign2));
//		String sign ="appid=wx44e3ee46a26f4e21&body=Ipad mini 16G 白色&fee_type=CNY&mch_id=1251662201&nonce_str=5K8264ILTKCH16CQ2502SI8ZNMTM67VS&notify_url=http://www.baidu.com&out_trade_no=1217752501201407033233368018&spbill_create_ip=8.8.8.8&total_fee=888&trade_type=APP&key=1074cxhlchenhongweinanninggoodok";
//		System.out.println("sign:"+Md5Util.get32LowercaseMD5("123456"));
//		System.out.println("sign:"+Md5Util.get32UppercaseMD5(sign));
//		System.out.println("sign:"+Md5Util.Md5(sign));
//		System.out.println("sign:"+Md5Util.encryptMD5(sign));
	}

}
