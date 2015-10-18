/**
 * 
 */
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**微信发来的图片消息
 * @author Administrator
 *
 */
public class InPictureMessage extends Message {

	//图片链接
	private String PicUrl;
	
	//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
	private String MediaId;
	
	//消息id，64位整型
	private String MsgId;
	
	public InPictureMessage() {
	}

	/**
	 * @param outPutXmlTemplate
	 * @param toUserName
	 * @param fromUserName
	 * @param createTime
	 * @param msgType
	 */
	public InPictureMessage(String toUserName,
			String fromUserName, String createTime, String msgType, String picUrl,String mediaId, String msgId) {
		super( toUserName, fromUserName, createTime, msgType);
		PicUrl =picUrl;
		MediaId =mediaId;
		MsgId =msgId;
	}
	

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
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
