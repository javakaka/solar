/**
 * 
 */
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**微信发来的链接消息
 * @author Administrator
 */

public class InLinkMessage extends Message {

	//消息标题
	private String Title;
	//消息描述
	private String Description;
	//消息链接
	private String Url;
	//消息id
	private String MsgId;

	public InLinkMessage() {
	}

	/**
	 * @param toUserName
	 * @param fromUserName
	 * @param createTime
	 * @param msgType
	 */
	public InLinkMessage( String toUserName,
			String fromUserName, String createTime, String msgType,
			String title, String description, String url, String msgId) {
		super( toUserName, fromUserName, createTime, msgType);
		Title =title;
		Description =description;
		Url =url;
		MsgId =msgId;
	}

	
	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
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
