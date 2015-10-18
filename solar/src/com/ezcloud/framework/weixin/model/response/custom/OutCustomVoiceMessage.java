/**     
* @Title: OutCustomVoiceMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午06:01:59   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;
import com.ezcloud.framework.weixin.model.custom.Voice;

/**   
 * @ClassName: OutCustomVoiceMessage   
 * @Description: 客服语音消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午06:01:59   
 *      
 */
public class OutCustomVoiceMessage extends CustomBaseMessage {

	private Voice voice;
	
	public OutCustomVoiceMessage(String touser, String msgtype, Voice voice) {
		super(touser, msgtype);
		this.voice = voice;
	}

	public Voice getVoice() {
		return voice;
	}

	public void setVoice(Voice voice) {
		this.voice = voice;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomVoiceMessage(String touser, String msgtype) {
		super(touser, msgtype);
		// TODO Auto-generated constructor stub
	}

}
