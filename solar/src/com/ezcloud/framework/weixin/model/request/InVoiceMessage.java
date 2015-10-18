/**     
* @Title: InVoiceMessage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-21 下午08:41:13   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;


/**   
 * @ClassName: InVoiceMessage   
 * @Description: 微信推送给服务号的语音消息
 * @author ez-cloud work group   
 * @date 2013-11-21 下午08:41:13   
 */
public class InVoiceMessage extends Message {

	//语音消息媒体id，可以调用多媒体文件下载接口拉取数据
	private String MediaId;
	
	//语音格式，如amr，speex等
	private String Format;
	
	//消息id，64位整型
	private String MsgId;
	
	public InVoiceMessage() {
		super();
	}


	public InVoiceMessage(String toUserName, String fromUserName,
			String createTime, String msgType,String mediaId, String format, String msgId) {
		super(toUserName, fromUserName, createTime, msgType);
		MediaId = mediaId;
		Format = format;
		MsgId = msgId;
	}


	public String getMediaId() {
		return MediaId;
	}


	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}


	public String getFormat() {
		return Format;
	}


	public void setFormat(String format) {
		Format = format;
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
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return null;
	}

}
