/**     
* @Title: Voice.java   
* @Package com.ezcloud.weixin.model   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:55:35   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model;
/**   
 * @ClassName: Voice   
 * @Description: 语音消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:55:35   
 *      
 */
public class Voice {

	//通过上传多媒体文件，得到的id
	private String MediaId;

	public Voice(String mediaId) {
		super();
		MediaId = mediaId;
	}

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	
}
