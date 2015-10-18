/**     
* @Title: OutCustomTextMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:41:10   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;
import com.ezcloud.framework.weixin.model.custom.Text;

/**   
 * @ClassName: OutCustomTextMessage   
 * @Description: 客服文本消息
 * <p>
 * {
 *    "touser":"OPENID",
 *   "msgtype":"text",
 *   "text":
 *   {
 *        "content":"Hello World"
 *   }
 * }
 *参数			是否必须			说明
 *access_token	 是		 调用接口凭证
 *touser	 	 是		 普通用户openid
 *msgtype	 	 是	 	消息类型，text
 *content		 是	 	文本消息内容
 * </p>
 * 
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:41:10   
 *      
 */
public class OutCustomTextMessage extends CustomBaseMessage {

	private Text text;
	
	public OutCustomTextMessage(String touser, String msgtype, Text text) {
		super(touser, msgtype);
		this.text = text;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomTextMessage(String touser, String msgtype) {
		super(touser, msgtype);
		// TODO Auto-generated constructor stub
	}

	public Text getText() {
		return text;
	}

	public void setText(Text text) {
		this.text = text;
	}

	
}
