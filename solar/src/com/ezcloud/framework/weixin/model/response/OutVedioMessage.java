/**     
* @Title: OutVedioMessage.java   
* @Package com.ezcloud.framework.weixin.model.response   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:41:44   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response;

import com.ezcloud.framework.weixin.model.Message;
import com.ezcloud.framework.weixin.model.Video;

/**   
 * @ClassName: OutVedioMessage   
 * @Description: 回复视频消息
 * <p>
 * <xml>
 *<ToUserName><![CDATA[toUser]]></ToUserName>
 *<FromUserName><![CDATA[fromUser]]></FromUserName>
 *<CreateTime>12345678</CreateTime>
 *<MsgType><![CDATA[video]]></MsgType>
 *<Video>
 *<MediaId><![CDATA[media_id]]></MediaId>
 *<ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
 *</Video> 
 *</xml>
 *参数	是否必须	说明
 *ToUserName	 是	 接收方帐号（收到的OpenID）
 *FromUserName	 是	开发者微信号
 *CreateTime	 是	 消息创建时间 （整型）
 *MsgType	 是	 video
 *MediaId	 是	 通过上传多媒体文件，得到的id
 *ThumbMediaId	 是	 缩略图的媒体id，通过上传多媒体文件，得到的id
 * </p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:41:44   
 *      
 */
public class OutVedioMessage extends Message {
	
	private Video vedio;
	
	
	public OutVedioMessage(String toUserName, String fromUserName,
			String createTime, String msgType, Video vedio) {
		super(toUserName, fromUserName, createTime, msgType);
		this.vedio = vedio;
	}

	public OutVedioMessage(Video vedio) {
		super();
		this.vedio = vedio;
	}

	public Video getVedio() {
		return vedio;
	}

	public void setVedio(Video vedio) {
		this.vedio = vedio;
	}

	/**
	 * <p>Title: ObjectToXml</p>   
	 * <p>Description: </p>   
	 * 
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
