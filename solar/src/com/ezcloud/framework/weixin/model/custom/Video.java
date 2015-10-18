/**     
* @Title: Video.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:50:03   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Video   
 * @Description: 客服视频消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:50:03   
 *      
 */
public class Video {

	//发送的视频的媒体ID
	private String media_id;
	//视频缩略图的媒体ID
	private String thumb_media_id;

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String mediaId) {
		media_id = mediaId;
	}

	public String getThumb_media_id() {
		return thumb_media_id;
	}

	public void setThumb_media_id(String thumbMediaId) {
		thumb_media_id = thumbMediaId;
	}

	public Video(String mediaId, String thumbMediaId) {
		super();
		media_id = mediaId;
		thumb_media_id = thumbMediaId;
	}
	
	
}
