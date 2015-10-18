package com.ezcloud.framework.controller.weixin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.controller.BaseController;
import com.ezcloud.framework.weixin.model.OutMessage;
import com.ezcloud.framework.weixin.service.ext.KBDWeiXinProcessService;
import com.ezcloud.framework.weixin.tool.Tools;

/**
 * 微信入口
 * @author TongJianbo
 */
@Controller("frameworkWechatApiController")
@RequestMapping("/wechat/bus")
public class WechatApiController extends BaseController {

	@Resource(name = "frameworkWechatHandlerService")
	private KBDWeiXinProcessService handler;
	
	/** 微信公众帐号服务号的 token*/
	private String _token ="paimaiToken";

	@RequestMapping(value = "/api")
	public @ResponseBody 
	String getWindowList(HttpServletRequest request,HttpServletResponse response) {
		String response_str ="";
		String httpMethod =request.getMethod();
		//验证
		if(httpMethod.equalsIgnoreCase("GET"))
		{
			String signature = request.getParameter("signature");// 微信加密签名 
	        String timestamp = request.getParameter("timestamp");// 时间戳 
	        String nonce = request.getParameter("nonce");// 随机数 
	        String echostr = request.getParameter("echostr");// 
	        System.out.println("======来自微信的随机字符串======="+echostr);
	        
	        if (Tools.specifySignaiture(_token, signature, timestamp, nonce)) { 
	        	System.out.println("======验证通过=======");
	           return echostr; 
	        }
	        else
	        {
	        	System.out.println("======验证不通过=======");
	        	return "error";
	        }
		}
		
		Map <String ,String> map =null;
		try {
			map =Tools.parseXml(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(map == null){
			response_str ="error";
			return response_str;
		}
		String MsgType =null;
		MsgType =map.get("MsgType");
//		KBDWeiXinProcessService handler =new KBDWeiXinProcessService();
		Object inObj =Tools.parseMessageObject(map);
		System.out.println("message type after deal....."+map.get("MsgType"));
		MsgType =map.get("MsgType");
		OutMessage outMsg =null;
		/** 处理文本消息*/
		if(MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_TEXT))
		{
			outMsg =handler.handleTextMsgRequest(inObj);
		}
		/** 处理图片消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_IMAGE))
		{
			outMsg =handler.handleImageMsgRequest(inObj);
		}
		/** 处理普通语音消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_VOICE))
		{
			outMsg =handler.handleVoiceMsgRequest(inObj);
		}
		/** 处理语音识别消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_VOICE_RECOGNITION))
		{
			outMsg =handler.handleVoiceRecognitionMsgRequest(inObj);
		}
		/** 处理视频消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_VIDEO))
		{
			outMsg =handler.handleVideoMsgRequest(inObj);
		}
		/** 处理位置消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_LOCATION))
		{
			outMsg =handler.handleLocationMsgRequest(inObj);
		}
		/** 处理链接消息*/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_LINK))
		{
			outMsg =handler.handleLinkMsgRequest(inObj);
		}
		/** 处理事件消息   把事件分类处理*/
//		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT))
//		{
//			outMsg =handler.handleEventMsgRequest(inObj);
//		}
		/**已关注时扫描二维码**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_SCAN_SUBSCRIBE))
		{
			outMsg =handler.handleScanSubscribeEventMsgRequest(inObj);
		}
		/**未关注时扫描二维码**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_SCAN_UNSUBSCRIBE))
		{
			outMsg =handler.handleScanUnSubscribeEventMsgRequest(inObj);
		}
		/***上报地理位置**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_LOCATION))
		{
			outMsg =handler.handleLocationEventMsgRequest(inObj);
		}
		/***自定义菜单点击事件**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_CLICK))
		{
			outMsg =handler.handleClickEventMsgRequest(inObj);
		}
		/**关注**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_SUBSCRIBE))
		{
			outMsg =handler.handleSubscribeEventMsgRequest(inObj);
		}
		/**取消关注**/
		else if (MsgType.equals(KBDWeiXinProcessService.REQUEST_MSG_TYPE_EVENT_UNSUBSCRIBE))
		{
			outMsg =handler.handleUnSubscribeEventMsgRequest(inObj);
		}
	
		/**返回给微信的数据*/
		String xmlTemplate ="";
		System.out.println("开始返回数据");
		System.out.println("outMsg===>>"+outMsg.getType());
		xmlTemplate =outMsg.getResponseXml();
		System.out.println("数据》》"+xmlTemplate);
//		response.getWriter().write(xmlTemplate);
		response_str =xmlTemplate;
		return response_str;
	}
	
}
