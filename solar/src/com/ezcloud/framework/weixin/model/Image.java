/**     
* @Title: Image.java   
* @Package com.ezcloud.weixin.model   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午04:53:32   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model;
/**   
 * @ClassName: Image   
 * @Description: 图片消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午04:53:32   
 */
public class Image {

	private String MediaId;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public Image(String mediaId) {
		super();
		MediaId = mediaId;
	}
	
}
