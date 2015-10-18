/**     
* @Title: OutPictureMessage.java   
* @Package com.ezcloud.framework.weixin.model.response   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:35:39   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response;

import com.ezcloud.framework.weixin.model.Image;
import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: OutPictureMessage   
 * @Description: 回复图片消息
 * <p>
 * 回复图片消息
 *<xml>
 *<ToUserName><![CDATA[toUser]]></ToUserName>
 *<FromUserName><![CDATA[fromUser]]></FromUserName>
 *<CreateTime>12345678</CreateTime>
 *<MsgType><![CDATA[image]]></MsgType>
 *<Image>
 *<MediaId><![CDATA[media_id]]></MediaId>
 *</Image>
 *</xml>
 *参数	              是否必须	说明
 *ToUserName	 是		接收方帐号（收到的OpenID）
 *FromUserName	 是		开发者微信号
 *CreateTime	 是	 	消息创建时间 （整型）
 *MsgType	            是	 	image
 *MediaId	            是	 	通过上传多媒体文件，得到的id。
 * </p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:35:39   
 *      
 */
public class OutPictureMessage extends Message {
	private  Image image;
	
	public OutPictureMessage(String toUserName, String fromUserName,
			String createTime, String msgType,Image image) {
		super(toUserName, fromUserName, createTime, msgType);
		this.image = image;
	}

	public OutPictureMessage(Image image) {
		super();
		this.image = image;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
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
