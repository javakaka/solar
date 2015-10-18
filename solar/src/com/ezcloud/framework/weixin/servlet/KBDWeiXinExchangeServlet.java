package com.ezcloud.framework.weixin.servlet;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ezcloud.framework.weixin.model.OutMessage;
import com.ezcloud.framework.weixin.service.ext.KBDWeiXinProcessService;
import com.ezcloud.framework.weixin.tool.Tools;

/**
* 
* @ClassName: KBDWeiXinExchangeServlet   
* @Description: 处理微信请求的接口
* @author ez-cloud work group   
* @date 2013-11-21 下午08:07:15   
*
*/
public class KBDWeiXinExchangeServlet extends HttpServlet {

	/** */
	private static final long serialVersionUID = 1L;
	/** 微信公众帐号服务号的 token*/
	private String _token;
	
	@Override
	public void destroy() {
		super.destroy();
	}
	
	/**
	* 
	* <p>Title: doGet</p>   
	* <p>Description:验证微信接口  </p>   
	* @param request
	* @param response
	* @throws ServletException
	* @throws IOException   
	* @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	*/
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String signature = request.getParameter("signature");// 微信加密签名 
        String timestamp = request.getParameter("timestamp");// 时间戳 
        String nonce = request.getParameter("nonce");// 随机数 
        String echostr = request.getParameter("echostr");// 
        System.out.println("======来自微信的随机字符串======="+echostr);
        _token ="KBDWeiXinToken";
        //验证 
        if (Tools.specifySignaiture(_token, signature, timestamp, nonce)) { 
//            response.getWriter().write(echostr); 
        	System.out.println("======验证通过=======");
        }
        else
        {
        	System.out.println("======验证不通过=======");
        }
        response.getWriter().write(echostr); 
	}
	
	/**
	 * 
	* <p>Title: doPost</p>   
	* <p>Description: 处理微信post业务请求 </p>   
	* @param req
	* @param resp
	* @throws ServletException
	* @throws IOException   
	* @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("===weixin request come in..................");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/xml");
		Map <String ,String> map =null;
		try {
			map =Tools.parseXml(req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(map == null){
			resp.getWriter().write("error");
		}
		String MsgType =null;
		MsgType =map.get("MsgType");
		KBDWeiXinProcessService handler =new KBDWeiXinProcessService();
		
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
		xmlTemplate =outMsg.getResponseXml();
		System.out.println("数据》》"+xmlTemplate);
		resp.getWriter().write(xmlTemplate);
	}
	
	@Override
	protected void finalize() throws Throwable {
		super.finalize();
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.service(req, resp);
	}
}