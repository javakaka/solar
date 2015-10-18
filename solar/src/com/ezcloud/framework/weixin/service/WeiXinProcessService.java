package com.ezcloud.framework.weixin.service;
import java.util.Date;

import com.ezcloud.framework.weixin.model.*;
import com.ezcloud.framework.weixin.model.request.*;
import com.ezcloud.framework.weixin.model.response.*;
/**
 * 对微信请求进行业务处理
 * @author Administrator
 *
 */
public class WeiXinProcessService {
	//微信请求类型
	public static final String REQUEST_MSG_TYPE_TEXT ="text";
	public static final String REQUEST_MSG_TYPE_IMAGE ="image";
	public static final String REQUEST_MSG_TYPE_LOCATION ="location";
	public static final String REQUEST_MSG_TYPE_LINK ="link";
	public static final String REQUEST_MSG_TYPE_EVENT ="event";
	public static final String REQUEST_MSG_TYPE_VOICE ="voice";
	public static final String REQUEST_MSG_TYPE_VEDIO ="vedio";
	//返回的消息类型
    public static final String RESPONSE_MESSAGE_TYPE_TEXT = "text";
    public static final String RESPONSE_MESSAGE_TYPE_MUSIC = "music";
    public static final String RESPONSE_MESSAGE_TYPE_NEWS = "news";
    
    
	private Message outMsg;
	public OutMessage handleTextMsgRequest(Object msg)
	{
		String responseType =WeiXinProcessService.RESPONSE_MESSAGE_TYPE_TEXT;
		OutMessage outObj =null;
		InTextMessage inMsg =(InTextMessage)msg;
		String content =inMsg.getContent();
		if(content == null)
		{
			return null;
		}
		if(content.trim().equals("0"))
		{
			String responseMsg =
				"深圳市易之云科技有限公司致力于为广大中小企业、初创企业、政企事业单位提供高效的移动生活的软件产品。易之云的轻松生活系列产品包括：轻松考勤、轻松办公、轻松娱乐、轻松购物、轻松CRM、轻松门户等轻松系列产品！"+
				"\n公司介绍请回复0\n业务咨询请回复1\n项目合作请回复2\n";
			OutTextMessage outMsg =new OutTextMessage();
			outMsg.setFromUserName(inMsg.getToUserName());
			outMsg.setToUserName(inMsg.getFromUserName());
			outMsg.setCreateTime(String.valueOf(new Date().getTime()));
			outMsg.setContent(responseMsg);
			outObj =new OutMessage(responseType, outMsg);
			return outObj;
		}
		else if(content.trim().equals("1"))
		{
			String responseMsg =
				"业务介绍:\n"+
				"1移动互联网app开发\n"+
				"2微信公众平台企业门户\n"+
				"3web开发\n"+
				"4系统集成\n"+
				"公司介绍请回复0\n业务咨询请回复1\n项目合作请回复2\n";
			OutTextMessage outMsg =new OutTextMessage();
			outMsg.setFromUserName(inMsg.getToUserName());
			outMsg.setToUserName(inMsg.getFromUserName());
			outMsg.setCreateTime(String.valueOf(new Date().getTime()));
			outMsg.setContent(responseMsg);
			outMsg.setMsgType(WeiXinProcessService.REQUEST_MSG_TYPE_TEXT);
			outObj =new OutMessage(responseType, outMsg);
			return outObj;
		}
		else if(content.trim().equals("2"))
		{

			String responseMsg =
				"项目合作:\n"+
				"联系方式：2658090929(qq)\n"+
				"公司介绍请回复0\n业务咨询请回复1\n项目合作请回复2\n";
			OutTextMessage outMsg =new OutTextMessage();
			outMsg.setFromUserName(inMsg.getToUserName());
			outMsg.setToUserName(inMsg.getFromUserName());
			outMsg.setCreateTime(String.valueOf(new Date().getTime()));
			outMsg.setContent(responseMsg);
			outMsg.setMsgType(WeiXinProcessService.REQUEST_MSG_TYPE_TEXT);
			outObj =new OutMessage(responseType, outMsg);
			return outObj;
		}
		else
		{
			String responseMsg ="您好，这里是深圳市易之云科技有限公司\n(公司网址:www.ez-cloud.cn)\n公司介绍请回复0\n业务咨询请回复1\n项目合作请回复2\n";
			OutTextMessage outMsg =new OutTextMessage();
			outMsg.setFromUserName(inMsg.getToUserName());
			outMsg.setToUserName(inMsg.getFromUserName());
			outMsg.setCreateTime(String.valueOf(new Date().getTime()));
			outMsg.setContent(responseMsg);
			outMsg.setMsgType(WeiXinProcessService.REQUEST_MSG_TYPE_TEXT);
			outObj =new OutMessage(responseType, outMsg);
			return outObj;
		}
	}
	
	public Object handleImageMsgRequest(Object msg)
	{
		outMsg =new OutTextMessage();
		return null;
	}
	
	public Object handleLocationMsgRequest(Object msg)
	{
		outMsg =new OutTextMessage();
		return null;
	}
	
	public Object handleLinkMsgRequest(Object msg)
	{
		outMsg =new OutTextMessage();
		return null;
	}
	
	public Object handleEventMsgRequest(Object msg)
	{
		outMsg =new OutTextMessage();
		return null;
	}

}