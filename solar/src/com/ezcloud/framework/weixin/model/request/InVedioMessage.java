/**     
* @Title: InVedioMessage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-21 下午08:54:29   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InVedioMessage   
 * @Description: 微信推送给公众帐号的视频消息
 * @author ez-cloud work group   
 * @date 2013-11-21 下午08:54:29   
 */
public class InVedioMessage extends Message {

	//视频消息媒体id，可以调用多媒体文件下载接口拉取数据
	private String MediaId ; 
	//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据
	private String ThumbMediaId ; 
	//消息id，64位整型
	private String MsgId ; 
	
	
	public InVedioMessage() {
		super();
	}

	public InVedioMessage(String toUserName, String fromUserName,
			String createTime, String msgType,String mediaId,String thumbMediaId,String msgId) {
		super(toUserName, fromUserName, createTime, msgType);
		MediaId = mediaId;
		ThumbMediaId = thumbMediaId;
		MsgId = msgId;
	}

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getThumbMediaId() {
		return ThumbMediaId;
	}

	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}

	public String getMsgId() {
		return MsgId;
	}

	public void setMsgId(String msgId) {
		MsgId = msgId;
	}

	/**
	 * <p>Title: ObjectToXml</p>   
	 * <p>Description: </p>   
	 * @param object
	 * @return   
	 * @see com.ezcloud.framework.weixin.model.Message#ObjectToXml(java.lang.Object)   
	 */
	@Override
	protected String ObjectToXml(Object object) {
		return null;
	}

	/**
	 * <p>Title: XmlToObject</p>   
	 * <p>Description: </p>   
	 * @param object
	 * @return   
	 * @see com.ezcloud.framework.weixin.model.Message#XmlToObject(java.lang.Object)   
	 */
	@Override
	protected Object XmlToObject(Object object) {
		return null;
	}

}
