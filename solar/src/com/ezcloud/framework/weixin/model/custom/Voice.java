/**     
* @Title: Voice.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:49:04   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Voice   
 * @Description: TODO
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:49:04   
 *      
 */
public class Voice {

	//发送的语音的媒体ID
	private String media_id;

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String mediaId) {
		media_id = mediaId;
	}

	public Voice(String mediaId) {
		super();
		media_id = mediaId;
	}
	
}
