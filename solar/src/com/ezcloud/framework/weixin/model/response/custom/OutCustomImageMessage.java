/**     
* @Title: OutCustomImageMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:59:26   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;
import com.ezcloud.framework.weixin.model.custom.Image;

/**   
 * @ClassName: OutCustomImageMessage   
 * @Description: 客服图片消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:59:26   
 *      
 */
public class OutCustomImageMessage extends CustomBaseMessage {

	private Image image;
	
	public OutCustomImageMessage(String touser, String msgtype, Image image) {
		super(touser, msgtype);
		this.image = image;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomImageMessage(String touser, String msgtype) {
		super(touser, msgtype);
	}

}
