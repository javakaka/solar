package com.ezcloud.framework.weixin.model;
public abstract class Message {
	private String ToUserName;
	private String FromUserName;
	private String CreateTime;
	private String MsgType;
	public Message() {
		super();
	}

	public Message( String toUserName,
			String fromUserName, String createTime, String msgType) {
		super();
		ToUserName = toUserName;
		FromUserName = fromUserName;
		CreateTime = createTime;
		MsgType = msgType;
	}


	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public String getCreateTime() {
		return CreateTime;
	}


	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}

	public static void main(String[] args) {

	}
	
	protected abstract  Object XmlToObject(Object object);
	
	protected abstract  String ObjectToXml(Object object);
}
