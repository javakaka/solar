/**     
* @Title: CustomBaseMessage.java   
* @Package com.ezcloud.framework.weixin.model   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:36:06   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: CustomBaseMessage   
 * @Description: 客服消息基类
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:36:06   
 *      
 */
public class CustomBaseMessage {

	//普通用户的OpenId
	private String touser;
	//消息类型
	private String msgtype;
	public String getTouser() {
		return touser;
	}
	public void setTouser(String touser) {
		this.touser = touser;
	}
	public String getMsgtype() {
		return msgtype;
	}
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	public CustomBaseMessage(String touser, String msgtype) {
		super();
		this.touser = touser;
		this.msgtype = msgtype;
	}
	
}
