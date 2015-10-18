/**     
* @Title: InLocationEventMesage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:05:56   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InLocationEventMesage   
 * @Description: 上报地理位置事件消息
 * 用户同意上报地理位置后，每次进入公众号会话时，
 * 都会在进入时上报地理位置，
 * 或在进入会话后每5秒上报一次地理位置，
 * 公众号可以在公众平台网站中修改以上设置。
 * 上报地理位置时，微信会将上报地理位置事件推送到开发者填写的URL
 * 推送XML数据包示例：
 * <p><xml>
 *	<ToUserName><![CDATA[toUser]]></ToUserName>
 *	<FromUserName><![CDATA[fromUser]]></FromUserName>
 *	<CreateTime>123456789</CreateTime>
 *	<MsgType><![CDATA[event]]></MsgType>
 *	<Event><![CDATA[LOCATION]]></Event>
 *	<Latitude>23.137466</Latitude>
 *	<Longitude>113.352425</Longitude>
 *	<Precision>119.385040</Precision>
 *	</xml>
 *	</p>
 *	<p>
 *	参数说明：
 *	参数	描述
 *	ToUserName	开发者微信号
 *	FromUserName	 发送方帐号（一个OpenID）
 *	CreateTime	 消息创建时间 （整型）
 *	MsgType	 消息类型，event
 *	Event	 事件类型，LOCATION
 *	Latitude	 地理位置纬度
 *	Longitude	 地理位置经度
 *	Precision	 地理位置精度
 *	</p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:05:56   
 */
public class InLocationEventMesage extends Message {

	//事件类型，LOCATION
	private String Event;
	//地理位置纬度
	private String Latitude;
	//地理位置经度
	private String Longitude;
	//地理位置精度
	private String Precision;

	public InLocationEventMesage(String toUserName, String fromUserName,
			String createTime, String msgType, String event, String latitude,
			String longitude, String precision) {
		super(toUserName, fromUserName, createTime, msgType);
		Event = event;
		Latitude = latitude;
		Longitude = longitude;
		Precision = precision;
	}

	public String getEvent() {
		return Event;
	}

	public void setEvent(String event) {
		Event = event;
	}

	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLongitude() {
		return Longitude;
	}

	public void setLongitude(String longitude) {
		Longitude = longitude;
	}

	public String getPrecision() {
		return Precision;
	}

	public void setPrecision(String precision) {
		Precision = precision;
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
