/**     
* @Title: InVoiceRecognitionMesssage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-26 上午11:08:01   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InVoiceRecognitionMesssage   
 * @Description: 语音识别结果
 * @author ez-cloud work group   
 * @date 2013-11-26 上午11:08:01   
 *      
 */
public class InVoiceRecognitionMesssage extends Message{

	private String MediaID;
	private String Format;
	private String Recognition;
	private String MsgID;
	
	
	public String getMediaID() {
		return MediaID;
	}

	public void setMediaID(String mediaID) {
		MediaID = mediaID;
	}

	public String getFormat() {
		return Format;
	}

	public void setFormat(String format) {
		Format = format;
	}

	public String getRecognition() {
		return Recognition;
	}

	public void setRecognition(String recognition) {
		Recognition = recognition;
	}

	public String getMsgID() {
		return MsgID;
	}

	public void setMsgID(String msgID) {
		MsgID = msgID;
	}

	
	public InVoiceRecognitionMesssage(String toUserName, String fromUserName,
			String createTime, String msgType,String mediaID, String format,
			String recognition, String msgID) {
		super(toUserName, fromUserName, createTime, msgType);
		MediaID = mediaID;
		Format = format;
		Recognition = recognition;
		MsgID = msgID;
	}

	
	public InVoiceRecognitionMesssage(String mediaID, String format,
			String recognition, String msgID) {
		super();
		MediaID = mediaID;
		Format = format;
		Recognition = recognition;
		MsgID = msgID;
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
