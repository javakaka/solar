package com.ezcloud.framework.weixin.model;
import java.util.Date;

import com.ezcloud.framework.weixin.model.response.OutMusicMessage;
import com.ezcloud.framework.weixin.model.response.OutNewsMessage;
import com.ezcloud.framework.weixin.model.response.OutPictureMessage;
import com.ezcloud.framework.weixin.model.response.OutTextMessage;
import com.ezcloud.framework.weixin.model.response.OutVedioMessage;
import com.ezcloud.framework.weixin.model.response.OutVoiceMessage;
import com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice;
import com.ezcloud.framework.weixin.service.WeiXinProcessService;
import com.ezcloud.framework.weixin.tool.Tools;
public class OutMessage {

	private String type;
	private Object obj;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	public OutMessage() {
		
	}
	
	public OutMessage(String type, Object obj) {
		this.type = type;
		this.obj = obj;
	}
	
	public String getResponseXml()
	{
		String xml ="";
		if(type.equals(WeiXinProcessService.RESPONSE_MESSAGE_TYPE_TEXT))
		{
			OutTextMessage textMessage =(OutTextMessage)obj;
			xml =Tools.textMessageToXml(textMessage);
		}
		else if(type.equals(WeiXinProcessService.RESPONSE_MESSAGE_TYPE_NEWS))
		{
			OutNewsMessage newsMessage =(OutNewsMessage)obj;
			xml =Tools.newsMessageToXml(newsMessage);
		}
		else if(type.equals(WeiXinProcessService.RESPONSE_MESSAGE_TYPE_MUSIC))
		{
			OutMusicMessage musicMessage =(OutMusicMessage)obj;
			xml =Tools.musicMessageToXml(musicMessage);
		}
		else if(type.equals(BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_VOICE))
		{
			OutVoiceMessage voiceMessage =(OutVoiceMessage)obj;
			xml =Tools.voiceMessageToXml(voiceMessage);
		}
		else if(type.equals(BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_VIDEO))
		{
			OutVedioMessage videoMessage =(OutVedioMessage)obj;
			xml =Tools.videoMessageToXml(videoMessage);
		}
		else if(type.equals(BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_IMAGE))
		{
			OutPictureMessage pictureMessage =(OutPictureMessage)obj;
			xml =Tools.imageMessageToXml(pictureMessage);
		}
		System.out.print("===out xml ===="+xml);
		return xml;
	}
	
	public  static void main(String args[])
	{
		String type =WeiXinProcessService.RESPONSE_MESSAGE_TYPE_TEXT;
		OutTextMessage msg =new OutTextMessage();
		msg.setContent("hello");
		msg.setFromUserName("ezcloud");
		msg.setToUserName("baidu");
		msg.setCreateTime(String.valueOf((new Date()).getTime()));
		msg.setMsgType(WeiXinProcessService.RESPONSE_MESSAGE_TYPE_TEXT);
		OutMessage out = new OutMessage(type,msg);
		System.out.print(out.getResponseXml());
		
	}
}
