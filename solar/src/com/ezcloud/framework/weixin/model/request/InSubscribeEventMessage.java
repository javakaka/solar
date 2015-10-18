/**     
* @Title: InSubscribeEventMessage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午03:43:38   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InSubscribeEventMessage   
 * @Description: 关注，取消关注事件消息
 * <p>
 * 用户在关注与取消关注公众号事，微信会把这个事件推送到开发者填写的URL。<br/>方便开发者给用户下发欢迎消息或者做帐号的解绑<br/>
 * </p>
 * 推送XML数据包示例：
 * <p>
 * <xml><br/>
 *	<ToUserName><![CDATA[toUser]]></ToUserName><br/>
 *	<FromUserName><![CDATA[FromUser]]></FromUserName><br/>
 *	<CreateTime>123456789</CreateTime><br/>
 *	<MsgType><![CDATA[event]]></MsgType><br/>
 *	<Event><![CDATA[subscribe]]></Event><br/>
 *	</xml><br/>
 * </p>
 * 
 * <p>
 * 参数说明：<br/>
 *	参数	描述<br/>
 *	ToUserName	开发者微信号<br/>
 *	FromUserName	 发送方帐号（一个OpenID）<br/>
 *	CreateTime	 消息创建时间 （整型）<br/>
 *	MsgType	 消息类型，event<br/>
 *	Event	 事件类型，subscribe(订阅)、unsubscribe(取消订阅)<br/>
 * </p>
 * @author ez-cloud work group   
 * @date 2013-11-22 下午03:43:38   
 *      
 */
public class InSubscribeEventMessage extends Message {

	//事件类型，subscribe(订阅)、unsubscribe(取消订阅)
	private String Event;
	
	public InSubscribeEventMessage() {
		super();
	}

	public InSubscribeEventMessage(String toUserName, String fromUserName,
			String createTime, String msgType, String event) {
		super(toUserName, fromUserName, createTime, msgType);
		Event = event;
	}

	public String getEvent() {
		return Event;
	}

	public void setEvent(String event) {
		Event = event;
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
