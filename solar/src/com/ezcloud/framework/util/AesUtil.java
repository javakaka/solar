
package com.ezcloud.framework.util;

import java.io.IOException;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;


/**
 * description:
 */
public class AesUtil {
	private static final byte[] aesKey="sola@app@app@app".getBytes();
	private static SecretKey secretKey=new SecretKeySpec(aesKey,"AES");
	
	static{
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
	}
	
 
	
	public static byte[] aesEncrypt(byte[] plainDaa) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");
		secretKey=new SecretKeySpec(aesKey,"AES");
		cipher.init(Cipher.ENCRYPT_MODE, secretKey);
		byte encryptedData[] = cipher.doFinal(plainDaa);
		return encryptedData;
	}

	public static byte[] aesDecrypt(byte[] encryptedData) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");
		cipher.init(Cipher.DECRYPT_MODE, secretKey);
		byte decryptedData[] = cipher.doFinal(encryptedData);
		return decryptedData;
	}

	
	public static final String encrypt(String input) throws Exception {

			//Base64加密
			String rBase64Encode=base64Encode(input.getBytes("UTF-8"));
			//AES加密
			byte[] rAESEncode=aesEncrypt(rBase64Encode.getBytes("UTF-8"));
			//Base64加密
			return base64Encode(rAESEncode);
	}

	public static final String decrypt(String input) throws Exception {
		//Base64解密
		byte[] rBase64Bytes = base64Decode(input);
		//AES解密
		String rAESDecode=new String(aesDecrypt(rBase64Bytes),"UTF-8");
		//Base64解密
		return new String(base64Decode(rAESDecode),"UTF-8");
	}

	public static String base64Encode(byte[] s) throws Exception {
		if (s == null)
			return  null;
		return new String(Base64.encodeBase64(s),"UTF-8");
	}

	public static byte[] base64Decode(String s) throws IOException {
		if (s == null)
			return null;
		byte[] b = Base64.decodeBase64(s.getBytes());
		return b;
	}

	/**
	 * encode
	 * @param input
	 * @return
	 * @throws Exception 
	 */
	public static String encode(String input) throws Exception{
		if(input==null || "".equals(input) || "null".equals(input)){
			input = "";
		}
			if(null!=input&&!"".equals(input)){
				return encrypt(input);
			}else{
				return "";
			}

	}
	
	/**
	 * decode
	 * @param input	
	 * @return
	 * @throws Exception 
	 */
	public static String decode(String input) throws Exception{
			if(null!=input&&!"".equals(input)){
				return decrypt(input);
			}else{
				return "";
			}
	}
	
	/**/
	public static void main(String[] args) throws Exception {
		
//		String input = "10004";
//		String input = "{\"SERVICE\":{\"TYPE\":\"0\"},\"HEADER\":{\"COMPANY\":\"易之云科技有限公司\",\"VERSION\":\"4.0\",\"COPYRIGHT\":\"COPYRIGHT2010-2020\"},\"REQUEST\":{\"ROW\":[],\"DEFAULT\":{\"VERSION\":\"1.0\",\"USERNAME\":\"13826531136\",\"PASSWORD\":\"E10ADC3949BA59ABBE56E057F20F883E\"},\"DATASET\":[]}}";
		String input = "123456";
		String encrptStr =  encode(input);
		System.out.println("Encode:" +encrptStr);
		System.out.println("Decode:" + decode(encrptStr));
		String url ="http://ilef.vxg196.10000net.cn/cxhl//api/pay/weixin/app/notify.do?order_no="+encode("201506221734361000100000000000111111")+"&notify_service="+encode("cxhlOrderService");
		System.out.println("Encode:" +url.length());
	}
	
	
}

