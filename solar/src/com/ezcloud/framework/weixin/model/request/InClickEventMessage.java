/**     
* @Title: InClickEventMessage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:21:57   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InClickEventMessage   
 * @Description: 自定义菜单点击事件
 * <p>用户点击自定义菜单后，如果菜单按钮设置为click类型，<br/>则微信会把此次点击事件推送给开发者，<br/>注意view类型（跳转到URL）的菜单点击不会上报。</p>
 * <p>推送XML数据包示例：
 *	<xml>
 *	<ToUserName><![CDATA[toUser]]></ToUserName><br/>
 *	<FromUserName><![CDATA[FromUser]]></FromUserName><br/>
 *	<CreateTime>123456789</CreateTime><br/>
 *	<MsgType><![CDATA[event]]></MsgType><br/>
 *	<Event><![CDATA[CLICK]]></Event><br/>
 *	<EventKey><![CDATA[EVENTKEY]]></EventKey><br/>
 *	</xml><br/>
 *	</p>
 * <p>
 * 参数说明：<br/>
 *	参数	描述<br/>
 *	ToUserName	开发者微信号<br/>
 *	FromUserName	 发送方帐号（一个OpenID）<br/>
 *	CreateTime	 消息创建时间 （整型）<br/>
 *	MsgType	 消息类型，event<br/>
 *	Event	 事件类型，CLICK<br/>
 *	EventKey	 事件KEY值，与自定义菜单接口中KEY值对应<br/>
 * </p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:21:57   
 *      
 */
public class InClickEventMessage extends Message {

	//事件类型，CLICK
	private String Event;
	
	//事件KEY值，与自定义菜单接口中KEY值对应
	private String EventKey;
	
	public InClickEventMessage(String toUserName, String fromUserName,
			String createTime, String msgType, String event, String eventKey) {
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
