/**     
* @Title: OutCustomVideoMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午06:03:40   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;
import com.ezcloud.framework.weixin.model.custom.Video;

/**   
 * @ClassName: OutCustomVideoMessage   
 * @Description: 客服视频消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午06:03:40   
 *      
 */
public class OutCustomVideoMessage extends CustomBaseMessage {

	private Video video;
	
	public OutCustomVideoMessage(String touser, String msgtype, Video video) {
		super(touser, msgtype);
		this.video = video;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomVideoMessage(String touser, String msgtype) {
		super(touser, msgtype);
		// TODO Auto-generated constructor stub
	}

}
