/**     
* @Title: Image.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:47:22   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Image   
 * @Description: 客服图片消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:47:22   
 *      
 */
public class Image {

	private String media_id;

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String mediaId) {
		media_id = mediaId;
	}

	public Image(String mediaId) {
		super();
		media_id = mediaId;
	}
	
}
