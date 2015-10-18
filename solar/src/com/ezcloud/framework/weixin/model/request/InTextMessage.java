package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**
 * 微信发来的文本消息
 * @author Administrator
 *
 */
public class InTextMessage extends Message {
	private String Content;
	private String MsgId;
	
	public InTextMessage() {
		super();
	}
	
	public InTextMessage(String toUserName, String fromUserName,
			String createTime, String msgType,String content, String msgId) {
		super(toUserName, fromUserName, createTime, msgType);
		Content = content;
		MsgId = msgId;
	}


	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getMsgId() {
		return MsgId;
	}
	public void setMsgId(String msgId) {
		MsgId = msgId;
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
