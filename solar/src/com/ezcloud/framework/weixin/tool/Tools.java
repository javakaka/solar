package com.ezcloud.framework.weixin.tool;

import java.io.InputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import com.ezcloud.framework.weixin.model.Articles;
import com.ezcloud.framework.weixin.model.Message;
import com.ezcloud.framework.weixin.model.request.InClickEventMessage;
import com.ezcloud.framework.weixin.model.request.InEventMessage;
import com.ezcloud.framework.weixin.model.request.InLinkMessage;
import com.ezcloud.framework.weixin.model.request.InLocationEventMesage;
import com.ezcloud.framework.weixin.model.request.InLocationMessage;
import com.ezcloud.framework.weixin.model.request.InPictureMessage;
import com.ezcloud.framework.weixin.model.request.InScanEventMessage;
import com.ezcloud.framework.weixin.model.request.InSubscribeEventMessage;
import com.ezcloud.framework.weixin.model.request.InTextMessage;
import com.ezcloud.framework.weixin.model.request.InVedioMessage;
import com.ezcloud.framework.weixin.model.request.InVoiceMessage;
import com.ezcloud.framework.weixin.model.request.InVoiceRecognitionMesssage;
import com.ezcloud.framework.weixin.model.response.OutMusicMessage;
import com.ezcloud.framework.weixin.model.response.OutNewsMessage;
import com.ezcloud.framework.weixin.model.response.OutPictureMessage;
import com.ezcloud.framework.weixin.model.response.OutTextMessage;
import com.ezcloud.framework.weixin.model.response.OutVedioMessage;
import com.ezcloud.framework.weixin.model.response.OutVoiceMessage;
import com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice;
import com.ezcloud.framework.weixin.service.WeiXinProcessService;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class Tools {

	public static String DicSort(String arr[])
	{
		String sortedStr ="";
		String[] ary = {"test", "abc", "apple", "PEar", "AB"};
		if(arr == null){
			return null;
		}
		ary =arr;
		System.out.println("Before sorted, the array is: " + Arrays.toString(ary));
		Arrays.sort(ary, new Comparator<String>(){
			public int compare(String o1, String o2) {
				String[] temp = {o1.toLowerCase(), o2.toLowerCase()};
				Arrays.sort(temp);
				if(o1.equalsIgnoreCase(temp[0])){
					return -1;
				}else if(temp[0].equalsIgnoreCase(temp[1])){
					return 0;
				}else{
					return 1;
				}
			}
		});
		sortedStr =Arrays.toString(ary);
		sortedStr =ary[0]+ary[1]+ary[2];
		System.out.println("After sorted, the new array is: " + Arrays.toString(ary));
		return sortedStr;
	}
	
	/**
	 * 
	 * @param _token 
	 * @param signature 签名
	 * @param timestamp 时间戳
	 * @param nonce 随机数
	 * @return
	 */
	public static boolean specifySignaiture(String _token,String signature,String timestamp,String nonce)
	{
		 boolean b =false;
		 String arr[] =new String[3];
		 arr[0] =_token;
		 arr[1] =timestamp;
		 arr[2] =nonce;
		 String dicStr =DicSort(arr);
		 SHA1 sha1 = new SHA1();
		 String sha1Str =sha1.Digest(dicStr);
		 if(signature.equalsIgnoreCase(sha1Str)){
			 b =true;
		 }
		 return b;
	}
	
	public static String  replace(String textTpl, String fromUsername, String toUsername, String time, String msgType, String contentStr)
	{
		String replacedStr ="";
		Pattern p = Pattern.compile("%s");
        Matcher m = p.matcher(textTpl);
        StringBuffer sb = new StringBuffer();
        int i=1;
        while (m.find()) {
        	if(i ==1 ){
        		m.appendReplacement(sb, fromUsername);
        	}
        	else if(i ==2 ){
        		m.appendReplacement(sb, toUsername);
        	}
        	else if(i ==3 ){
        		m.appendReplacement(sb, time);
        	}
        	else if(i ==4 ){
        		m.appendReplacement(sb, msgType);
        	}
        	else if(i ==5 ){
        		m.appendReplacement(sb, contentStr);
        	}
//        	m.appendReplacement(sb, "efg");
//            if(m.group().equals("abc")) 
//            	m.appendReplacement(sb, "efg");
//            else if(m.group().equals("efg")) 
//            	m.appendReplacement(sb, "xyz");
            i++;
        }
        m.appendTail(sb);
        System.out.println(sb.toString());
        replacedStr =sb.toString();
        return replacedStr;
	}
	
	/**
	 * 解析微信发来的请求（XML）
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> parseXml(HttpServletRequest request) throws Exception {
		// 将解析结果存储在HashMap中
		Map<String, String> map = new HashMap<String, String>();

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
	
	/**
	* 
	* @Title: parseMessageObject   
	* @Description: 从http请求中取出微信发送的数据 ，存储到Map
	* @param @param request
	* @param @return
	* @param @throws Exception    
	* @return Object    
	* @throws
	*/
	@SuppressWarnings("unchecked")
	public static Object parseMessageObject(HttpServletRequest request) throws Exception {
		// 将解析结果存储在HashMap中
		Map<String, String> map = new HashMap<String, String>();

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
		String MsgType=map.get("MsgType");
		String ToUserName =map.get("ToUserName");
		String FromUserName =map.get("FromUserName");
		String CreateTime =map.get("CreateTime");

		/**
		 * 文本消息
		 */
		if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_TEXT))
		{
			String Content =map.get("Content");
			String MsgId =map.get("MsgId");
			InTextMessage obj =new InTextMessage(ToUserName,FromUserName,CreateTime,MsgType,Content,MsgId);
			return obj;
		}
		/**
		 * 地理位置消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_LOCATION))
		{
			//地理位置纬度
			String Location_X =map.get("Location_X");
			//地理位置经度
			String Location_Y =map.get("Location_Y");
			//地图缩放大小
			String Scale =map.get("Scale");
			//地理位置信息
			String Label =map.get("Label");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			
			InLocationMessage obj =new InLocationMessage(ToUserName,FromUserName,CreateTime,MsgType,Location_X,Location_Y,Scale,Label,MsgId );
			return obj;
		}
		/**
		 * 链接消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_LINK))
		{
			//消息标题
			String Title =map.get("Title");
			//消息描述
			String Description =map.get("Description");
			//消息链接
			String Url =map.get("Url");
			//消息id
			String MsgId =map.get("MsgId");
			InLinkMessage obj =new InLinkMessage(ToUserName,FromUserName,CreateTime,MsgType, Title, Description, Url, MsgId);
			return obj;
		}
		/**
		 * 图片消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_IMAGE))
		{
			//图片链接
			String PicUrl =map.get("PicUrl");
			//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
			String MediaId =map.get("MediaId");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			InPictureMessage obj =new InPictureMessage(ToUserName,FromUserName,CreateTime,MsgType, PicUrl,MediaId, MsgId);
			return obj;
		}
		/**
		 * 语音消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_VOICE))
		{
			//语音消息媒体id，可以调用多媒体文件下载接口拉取数据
			String MediaId =map.get("MediaId");
			////语音格式，如amr，speex等
			String Format =map.get("Format");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			InVoiceMessage obj =new InVoiceMessage(ToUserName,FromUserName,CreateTime,MsgType, MediaId,Format, MsgId);
			return obj;
		}
		/**
		 * 视频消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_VEDIO))
		{
			//视频消息媒体id，可以调用多媒体文件下载接口拉取数据
			String MediaId =map.get("MediaId");
			//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据
			String ThumbMediaId =map.get("ThumbMediaId");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			InVedioMessage obj =new InVedioMessage(ToUserName,FromUserName,CreateTime,MsgType,MediaId,ThumbMediaId, MsgId);
			return obj;
		}
		/**
		 * 事件消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_EVENT))
		{
			//事件类型，subscribe(订阅)、unsubscribe(取消订阅)、CLICK(自定义菜单点击事件)
			String Event =map.get("Event");
			//事件KEY值，与自定义菜单接口中KEY值对应
			String EventKey =map.get("EventKey");
			InEventMessage obj =new InEventMessage(ToUserName, FromUserName, CreateTime, MsgType, Event, EventKey);
			return obj;
		}
		else
		{
			return null;
		}
	}
	
	/**
	* 
	* @Title: parseMessageObject   
	* @Description: 从Map中取数据，根据消息类型，返回不同的请求消息对象 
	* @param @param map
	* @param @return    
	* @return Object    
	* @throws
	 */
	public static Object parseMessageObject(Map<String,String> map) {

		String MsgType=map.get("MsgType");
		String ToUserName =map.get("ToUserName");
		String FromUserName =map.get("FromUserName");
		String CreateTime =map.get("CreateTime");

		/***
		 * 文本消息
		 */
		if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_TEXT))
		{
			String Content =map.get("Content");
			String MsgId =map.get("MsgId");
			InTextMessage obj =new InTextMessage(ToUserName,FromUserName,CreateTime,MsgType,Content,MsgId);
			return obj;
		}
		/**
		 * 地理位置消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_LOCATION))
		{
			//地理位置纬度
			String Location_X =map.get("Location_X");
			//地理位置经度
			String Location_Y =map.get("Location_Y");
			//地图缩放大小
			String Scale =map.get("Scale");
			//地理位置信息
			String Label =map.get("Label");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			
			InLocationMessage obj =new InLocationMessage(ToUserName,FromUserName,CreateTime,MsgType,Location_X,Location_Y,Scale,Label,MsgId );
			return obj;
		}
		/**
		 * 链接消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_LINK))
		{
			//消息标题
			String Title =map.get("Title");
			//消息描述
			String Description =map.get("Description");
			//消息链接
			String Url =map.get("Url");
			//消息id
			String MsgId =map.get("MsgId");
			InLinkMessage obj =new InLinkMessage(ToUserName,FromUserName,CreateTime,MsgType, Title, Description, Url, MsgId);
			return obj;
		}
		/**
		 * 图片消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_IMAGE))
		{
			//图片链接
			String PicUrl =map.get("PicUrl");
			//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
			String MediaId =map.get("MediaId");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			InPictureMessage obj =new InPictureMessage(ToUserName,FromUserName,CreateTime,MsgType, PicUrl,MediaId, MsgId);
			return obj;
		}
		/**
		 * 语音消息
		 * 1.普通语音
		 * 2.语音识别结果
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_VOICE))
		{
			//语音消息媒体id，可以调用多媒体文件下载接口拉取数据
			String MediaId =map.get("MediaId");
			////语音格式，如amr，speex等
			String Format =map.get("Format");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			String Recognition =null;
			boolean bIsRecognition =false; 
			bIsRecognition =map.containsKey("Recognition");
			InVoiceRecognitionMesssage obj2 =null;
			if(bIsRecognition)
			{
				 Recognition =map.get("Recognition");
				 map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_VOICE_RECOGNITION);
				 obj2 =new InVoiceRecognitionMesssage(ToUserName, FromUserName, CreateTime, MsgType, MediaId, Format, Recognition, MsgId);
				 return obj2;
			}
			InVoiceMessage obj =new InVoiceMessage(ToUserName,FromUserName,CreateTime,MsgType, MediaId,Format, MsgId);
			return obj;
		}
		/**
		 * 视频消息
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_VEDIO))
		{
			//视频消息媒体id，可以调用多媒体文件下载接口拉取数据
			String MediaId =map.get("MediaId");
			//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据
			String ThumbMediaId =map.get("ThumbMediaId");
			//消息id，64位整型
			String MsgId =map.get("MsgId");
			InVedioMessage obj =new InVedioMessage(ToUserName,FromUserName,CreateTime,MsgType,MediaId,ThumbMediaId, MsgId);
			return obj;
		}
		/**
		 * 事件消息
		 * 事件消息分为：
		 * 1.关注
		 * 2.取消关注
		 * 3.未关注公众号时扫描
		 * 4.已关注公众号时扫描
		 * 5.上报地理位置
		 * 6.自定义菜单点击
		 */
		else if(MsgType.equals(WeiXinProcessService.REQUEST_MSG_TYPE_EVENT))
		{
			//事件类型，subscribe(订阅)、unsubscribe(取消订阅)、CLICK(自定义菜单点击事件)
			String Event =map.get("Event");
			//事件KEY值，与自定义菜单接口中KEY值对应
			String EventKey =null;
			String Ticket =null;
			//地理位置纬度
			String Latitude =null;
			//地理位置经度
			String Longitude =null;	
			//地理位置精度
			String Precision =null;	
			boolean bIsScan =false;
			boolean bIsSubOrUnsub =true;
			boolean bIsLoaction =false;
			boolean bIsClick =false;
			bIsScan =map.containsKey("Ticket");
			if(bIsScan)
			{
				bIsSubOrUnsub =false;
				EventKey =map.get("EventKey");
				Ticket =map.get("Ticket");
				//未关注扫描
				if(Event.trim().equals("subscribe"))
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_SCAN_UNSUBSCRIBE);
				}
				else
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_SCAN_SUBSCRIBE);
				}
				InScanEventMessage oScanEventMessage =new InScanEventMessage(ToUserName, FromUserName, CreateTime, MsgType, Event, EventKey, Ticket);
				return oScanEventMessage;
			}
			bIsLoaction =map.containsKey("Latitude");
			if(bIsLoaction)
			{
				bIsSubOrUnsub =false;
				Latitude =map.get("Latitude");
				Longitude =map.get("Longitude");
				Precision =map.get("Precision");
				if(Event.trim().equalsIgnoreCase("LOCATION"))
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_LOCATION);
				}
				InLocationEventMesage oLocationEventMessage =new InLocationEventMesage(ToUserName, FromUserName, CreateTime, MsgType, Event, Latitude, Longitude, Precision);
				return oLocationEventMessage;
			}
			bIsClick =map.containsKey("EventKey");
			if(bIsClick)
			{
				System.out.println("come in menu click .....");
				bIsSubOrUnsub =true;
				EventKey =map.get("EventKey");
				if(Event.trim().equalsIgnoreCase("CLICK"))
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_CLICK);
					InClickEventMessage oClickEventMessage =new InClickEventMessage(ToUserName, FromUserName, CreateTime, MsgType, Event, EventKey);
					return oClickEventMessage;
				}
			}
			if(bIsSubOrUnsub)
			{
				System.out.println("come in SubOrUnsub .....");
				//订阅
				if(Event.trim().equalsIgnoreCase("subscribe"))
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_SUBSCRIBE);
				}
				//取消订阅
				else if(Event.trim().equalsIgnoreCase("unsubscribe"))
				{
					map.put("MsgType", BaseWeiXinProcessWervice.REQUEST_MSG_TYPE_EVENT_UNSUBSCRIBE);
				}
				InSubscribeEventMessage obj =new InSubscribeEventMessage(ToUserName, FromUserName, CreateTime, MsgType, Event);
				return obj;
			}
			return null;
		}
		else
		{
			return null;
		}
	}
	
	/**
	 * 文本消息转换为xml
	 * @param textMessage
	 * @return
	 */
	public static String textMessageToXml(OutTextMessage textMessage) {  
		xstream.alias("xml", textMessage.getClass());  
		return xstream.toXML(textMessage);  
	}  

	/**
	 * 音乐消息转换为xml
	 * @param musicMessage
	 * @return
	 */
	public static String musicMessageToXml(OutMusicMessage musicMessage) {  
		xstream.alias("xml", musicMessage.getClass());  
		return xstream.toXML(musicMessage);  
	}  

	/**
	 * 新闻消息转换为xml
	 * @param newsMessage
	 * @return
	 */
	public static String newsMessageToXml(OutNewsMessage newsMessage) {
//		xstream.addImplicitCollection(Articles.class, "item");
		xstream.alias("xml", newsMessage.getClass());
		xstream.aliasField("Articles", newsMessage.getClass(), "item");
		xstream.alias("item", Articles.class);
		return xstream.toXML(newsMessage);
	}
	/**
	 * voice
	* @Title: newsMessageToXml   
	* @Description: TODO 
	* @param @param voiceMessage
	* @param @return    
	* @return String    
	* @throws
	 */
	public static String voiceMessageToXml(OutVoiceMessage voiceMessage) {
//		xstream.addImplicitCollection(Articles.class, "list");
		xstream.alias("xml", voiceMessage.getClass());
		return xstream.toXML(voiceMessage);
	}
	
	/**
	 * 
	* @Title: videoMessageToXml   
	* @Description: TODO 
	* @param @param vedioMessage
	* @param @return    
	* @return String    
	* @throws
	 */
	public static String videoMessageToXml(OutVedioMessage vedioMessage) {
		xstream.alias("xml", vedioMessage.getClass());
		return xstream.toXML(vedioMessage);
	}
	
	/**
	 * 
	* @Title: imageMessageToXml   
	* @Description: TODO 
	* @param @param imageMessage
	* @param @return    
	* @return String    
	* @throws
	 */
	public static String imageMessageToXml(OutPictureMessage imageMessage) {
		xstream.alias("xml", imageMessage.getClass());
		return xstream.toXML(imageMessage);
	}
	
	private static XStream xstream = new XStream(new XppDriver() {
		public HierarchicalStreamWriter createWriter(Writer out) {
			return new PrettyPrintWriter(out) {
				// 对所有xml节点的转换都增加CDATA标记
				boolean cdata = true;

				@SuppressWarnings("unchecked")
				public void startNode(String name, Class clazz) {
					super.startNode(name, clazz);
				}

				protected void writeText(QuickWriter writer, String text) {
					if (cdata) {
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					} else {
						writer.write(text);
					}
				}
			};
		}
	});
	

	
	
	public static void main(String args[]){
//		 String arr[] =new String[3];
//		 String _token ="ezcloudtoken";
//		 String timestamp="1381839871";
//		 String nonce="1381728147";
//		 String signature="0a18c5be6706b5874fc1e5601b46350a516f9912";
//		 
//		 boolean b =Tools.specifySignaiture(_token, signature, timestamp, nonce);
//		 System.out.println("ok？==============="+b);
		String ToUserName ="gh_1cfd6d0c3703";
		String FromUserName ="opqmsjgwQ-l7FvhidwsLBlubdT8o";
		String CreateTime ="1381910170";
		String MsgType ="news";
		String Content ="cvbbnmvfdf";
		String MsgId ="5935258986159801339";
		Message msg =null;
		List<Articles> list =new ArrayList<Articles>();
		Articles articles =new Articles("title1", "desc", "http://llofofsodfj", "url");
		list.add(articles);
		articles =new Articles("title2", "desc", "http://llofofsodfj", "url");
		
		list.add(articles);
		OutNewsMessage outNewsMessage =new OutNewsMessage(FromUserName, ToUserName, CreateTime, MsgType, "2", list);
		System.out.print(newsMessageToXml(outNewsMessage));
		
	}
}