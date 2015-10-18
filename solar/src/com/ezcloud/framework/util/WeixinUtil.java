package com.ezcloud.framework.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 *  * 公众平台通用接口工具类  
 */
public class WeixinUtil {
	// 获取access_token的接口地址（GET） 限2000（次/天）  
	public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

	// 菜单创建（POST） 限1000（次/天）
	public static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

	// 菜单删除（GET） 限1000（次/天）
	public static String menu_delete_url = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

//	易之云服务号
	public final static String appId="wxa9955fde8954450c";
	
	public final static String appSecret ="c49a6a9278a15ff39c19d0d950a9b3a1";
	
	
//	//康必达服务号
//	public final static String appId="wx16edad686608edd8";
//	
//	public final static String appSecret ="b5b20a707d02b7c5badec86c3776d428";
	/**
	 ** 发起https请求并获取结果*
	 *@param requestUrl 请求地址
	 *@param requestMethod 请求方式（GET、POST）
	 *@param outputStr 提交的数据 
	 *@return
	 *JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)      
	 */
	public static String httpRequest(String requestUrl, String requestMethod, String outputStr){ 
		String jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
		// 创建SSLContext对象，并使用我们指定的信任管理器初始化 
		TrustManager[] tm = { new MyX509TrustManager() };
		SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
		sslContext.init(null, tm, new java.security.SecureRandom());
		// 从上述SSLContext对象中得到SSLSocketFactory对象
		SSLSocketFactory ssf = sslContext.getSocketFactory();
		
		URL url = new URL(requestUrl);
		HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
		httpUrlConn.setSSLSocketFactory(ssf);
		
		httpUrlConn.setDoOutput(true);
		httpUrlConn.setDoInput(true);
		httpUrlConn.setUseCaches(false);
		// 设置请求方式（GET/POST
		httpUrlConn.setRequestMethod(requestMethod);
		
		if ("GET".equalsIgnoreCase(requestMethod))
		httpUrlConn.connect();
		
		// 当有数据需要提交时 
		if (null != outputStr) {
		OutputStream outputStream = httpUrlConn.getOutputStream();
		// 注意编码格式，防止中文乱码 
		outputStream.write(outputStr.getBytes("UTF-8"));
		outputStream.close();
		}
		
		// 将返回的输入流转换成字符串
		InputStream inputStream = httpUrlConn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		
		String str = null;
		while ((str = bufferedReader.readLine()) != null) {
		buffer.append(str);
		}
		bufferedReader.close();
		inputStreamReader.close();
		// 释放资源
		inputStream.close();
		inputStream = null;
		httpUrlConn.disconnect();
		jsonObject = buffer.toString();
		} catch (ConnectException ce) {
		//log.error("Weixin server connection timed out.");
		} catch (Exception e) {
		//log.error("https request error:{}", e);
		}
		return jsonObject;
		//return null;
		};
		
		public static String  createPreOrder(String xml)
		{
			String resp ="";
			String url ="https://api.mch.weixin.qq.com/pay/unifiedorder";
			resp =httpRequest(url,"POST",xml);
			return resp;
		}
		
		/**
		 * 解析微信发来的请求（XML）
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@SuppressWarnings("unchecked")
		public static HashMap<String, String> parseXml(HttpServletRequest request) throws Exception {
			// 将解析结果存储在HashMap中
			HashMap<String, String> map = new HashMap<String, String>();
			// 从request中取得输入流
			InputStream inputStream = request.getInputStream();
			// 读取输入流
			SAXReader reader = new SAXReader();
			Document document = reader.read(inputStream);
			// 得到xml根元素
			Element root = document.getRootElement();
			// 得到根元素的所有子节点
			List<Element> elementList = root.elements();
			// 遍历所有子节点
			for (Element e : elementList)
			{
				map.put(e.getName(), e.getText());
				System.out.println("String "+e.getName()+" ="+e.getText());
			}
			// 释放资源
			inputStream.close();
			inputStream = null;
			return map;
		}
		
		public static void main(String s[])
		{
			String resp ="";
			String xml="<xml>"
			+"<appid>wx44e3ee46a26f4e21</appid>"
			+"<body>Ipad mini  16G  白色</body>"
			+"<fee_type>CNY</fee_type>"
			+"<mch_id>1251662201</mch_id>"
			+"<nonce_str>5K8264ILTKCH16CQ2502SI8ZNMTM67VS</nonce_str>"
			+"<notify_url>http://www.baidu.com</notify_url>"
			+"<out_trade_no>1217752501201407033233368018</out_trade_no>"
			+"<spbill_create_ip>8.8.8.8</spbill_create_ip>"
			+"<total_fee>888</total_fee>"
			+"<trade_type>APP</trade_type>"
//			+"<sign>CD2FEEE48A008AD699378E55BACDA7AC</sign>"
			+"<sign>A79574535D5B428DD3897AFE5619AE21</sign>"
			+"</xml>";
			resp =createPreOrder(xml);
			System.out.println("resp========>>"+resp);
		}
}
