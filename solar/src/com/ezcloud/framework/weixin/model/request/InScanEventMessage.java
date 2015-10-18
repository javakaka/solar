/**     
* @Title: InScanEventMessage.java   
* @Package com.ezcloud.framework.weixin.model.request   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午03:54:57   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.request;

import com.ezcloud.framework.weixin.model.Message;

/**   
 * @ClassName: InScanEventMessage   
 * @Description: 扫描公众帐号二维码事件.
 * 1.如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
 * 2.如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者
 * @author ez-cloud work group   
 * @date 2013-11-22 下午03:54:57   
 */
public class InScanEventMessage extends Message {

	/**
	 * 事件类型
	 * 用户还未关注公众号时为<code>subscribe</code>
	 * 用户已关注公众号时为<code>scan</code>
	 */
	private String Event ;
	/**
	 * 未关注：事件KEY值，qrscene_为前缀，后面为二维码的参数值
	 * 已关注：事件KEY值，是一个32位无符号整数
	 */
	private String EventKey ;
	//二维码的ticket，可用来换取二维码图片
	private String Ticket ;
	

	public InScanEventMessage(String toUserName, String fromUserName,
			String createTime, String msgType, String event, String eventKey, String ticket) {
		super(toUserName, fromUserName, createTime, msgType);
		Event = event;
		EventKey = eventKey;
		Ticket = ticket;
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

	public String getTicket() {
		return Ticket;
	}

	public void setTicket(String ticket) {
		Ticket = ticket;
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
