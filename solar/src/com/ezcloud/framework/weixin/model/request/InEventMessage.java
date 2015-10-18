package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**
 * 微信事件推送
 * @author Administrator
 */

public class InEventMessage extends Message {
	
	//事件类型，subscribe(订阅)、unsubscribe(取消订阅)、CLICK(自定义菜单点击事件)
	private String Event;
	//事件KEY值，与自定义菜单接口中KEY值对应
	private String EventKey;

	
	public InEventMessage() {
		super();
	}

	public InEventMessage(String event, String eventKey) {
		super();
		Event = event;
		EventKey = eventKey;
	}

	public InEventMessage(String toUserName,
			String fromUserName, String createTime, String msgType ,String event, String eventKey) {
		super(toUserName, fromUserName, createTime, msgType);
		Event = event;
		EventKey = eventKey;
	}

	public String getEvent() {
		return Event;
	}

	public void setEvent(String event) {
		Event = event;
	}

	public String getEventKey() {
		return EventKey;
	}

	public void setEventKey(String eventKey) {
		EventKey = eventKey;
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
