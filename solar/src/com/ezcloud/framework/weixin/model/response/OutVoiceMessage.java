/**     
* @Title: OutVoiceMessage.java   
* @Package com.ezcloud.framework.weixin.model.response   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:39:12   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response;

import com.ezcloud.framework.weixin.model.Message;
import com.ezcloud.framework.weixin.model.Voice;

/**   
 * @ClassName: OutVoiceMessage   
 * @Description: 回复语音消息
 * <p>
 * <xml>
 *<ToUserName><![CDATA[toUser]]></ToUserName>
 *<FromUserName><![CDATA[fromUser]]></FromUserName>
 *<CreateTime>12345678</CreateTime>
 *<MsgType><![CDATA[voice]]></MsgType>
 *<Voice>
 *<MediaId><![CDATA[media_id]]></MediaId>
 *</Voice>
 *</xml>
 *参数			是否必须		说明
 *ToUserName	 是	 	接收方帐号（收到的OpenID）
 *FromUserName	 是		开发者微信号
 *CreateTime	 是	 	消息创建时间戳 （整型）
 *MsgType	 	 是	 	语音，voice
 *MediaId		 是	 	通过上传多媒体文件，得到的id
 * </p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:39:12   
 *      
 */
public class OutVoiceMessage extends Message {

	private Voice voice;
	
	public OutVoiceMessage(String toUserName, String fromUserName,
			String createTime, String msgType, Voice voice) {
		super(toUserName, fromUserName, createTime, msgType);
		this.voice = voice;
	}

	public OutVoiceMessage(Voice voice) {
		super();
		this.voice = voice;
	}

	public Voice getVoice() {
		return voice;
	}

	public void setVoice(Voice voice) {
		this.voice = voice;
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
