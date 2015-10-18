package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**微信发来的地理位置消息
 * @author Administrator
 */

public class InLocationMessage extends Message {
	//地理位置纬度
	private String Location_X;
	//地理位置经度
	private String Location_Y;
	//地图缩放大小
	private String Scale;
	//地理位置信息
	private String Label;
	//消息id，64位整型
	private String MsgId;
	
	public InLocationMessage() {
	}

	/**
	 * @param outPutXmlTemplate
	 * @param toUserName
	 * @param fromUserName
	 * @param createTime
	 * @param msgType
	 */
	public InLocationMessage( String toUserName,
			String fromUserName, String createTime, String msgType, String location_X,
			String location_Y, String scale, String label, String msgId) {
		super( toUserName, fromUserName, createTime, msgType);
		Location_X =location_X;
		Location_Y =location_Y;
		Scale =scale;
		Label =label;
		MsgId =msgId;
	}
	
	

	public String getLocation_X() {
		return Location_X;
	}

	public void setLocation_X(String locationX) {
		Location_X = locationX;
	}

	public String getLocation_Y() {
		return Location_Y;
	}

	public void setLocation_Y(String locationY) {
		Location_Y = locationY;
	}

	public String getScale() {
		return Scale;
	}

	public void setScale(String scale) {
		Scale = scale;
	}

	public String getLabel() {
		return Label;
	}

	public void setLabel(String label) {
		Label = label;
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
