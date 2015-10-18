package com.ezcloud.framework.weixin.model.response;

import com.ezcloud.framework.weixin.model.Message;

/**
* @ClassName: OutTextMessage   
* @Description:回复文本消息
* <p>
* <xml><br/>
*	<ToUserName><![CDATA[toUser]]></ToUserName><br/>
*	<FromUserName><![CDATA[fromUser]]></FromUserName><br/>
*	<CreateTime>12345678</CreateTime><br/>
*	<MsgType><![CDATA[text]]></MsgType><br/>
*	<Content><![CDATA[你好]]></Content><br/>
*	</xml><br/>
*	参数	是否必须	描述<br/>
*	ToUserName	 是	 接收方帐号（收到的OpenID）<br/>
*	FromUserName	 是	开发者微信号<br/>
*	CreateTime	 是	 消息创建时间 （整型）<br/>
*	MsgType	 是	 text<br/>
*	Content	 是	 回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示）<br/>
* </p>
* @author ez-cloud work group   
* @date 2013-11-22 下午04:32:51   
*
 */
public class OutTextMessage extends Message {
	
	private String Content;
	
	public OutTextMessage() {
		super();
	}

	public OutTextMessage(String toUserName,
			String fromUserName, String createTime, String msgType,String content) {
		super(toUserName, fromUserName, createTime, msgType);
		Content = content;
	}

	public OutTextMessage(String content) {
		super();
		Content = content;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	@Override
	protected String ObjectToXml(Object object) {
		return null;
	}

	@Override
	protected Object XmlToObject(Object object) {
		return null;
	}
}