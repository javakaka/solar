/**     
* @Title: Video.java   
* @Package com.ezcloud.weixin.model   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:03:38   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model;
/**   
 * @ClassName: Video   
 * @Description: 视频消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:03:38   
 *      
 */
public class Video {

	//通过上传多媒体文件，得到的id
	private String MediaId;
	//缩略图的媒体id，通过上传多媒体文件，得到的id
	private String ThumbMediaId;
	public Video(String mediaId, String thumbMediaId) {
		super();
		MediaId = mediaId;
		ThumbMediaId = thumbMediaId;
	}
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	
}
