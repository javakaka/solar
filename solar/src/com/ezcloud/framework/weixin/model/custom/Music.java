/**     
* @Title: Music.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:52:11   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Music   
 * @Description: 客服音乐消息
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:52:11   
 */

public class Music {

	private String title;
	private String description;
	private String musicurl;
	private String hqmusicurl;
	private String thumb_media_id;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMusicurl() {
		return musicurl;
	}
	public void setMusicurl(String musicurl) {
		this.musicurl = musicurl;
	}
	public String getHqmusicurl() {
		return hqmusicurl;
	}
	public void setHqmusicurl(String hqmusicurl) {
		this.hqmusicurl = hqmusicurl;
	}
	public String getThumb_media_id() {
		return thumb_media_id;
	}
	public void setThumb_media_id(String thumbMediaId) {
		thumb_media_id = thumbMediaId;
	}
	public Music(String title, String description, String musicurl,
			String hqmusicurl, String thumbMediaId) {
		super();
		this.title = title;
		this.description = description;
		this.musicurl = musicurl;
		this.hqmusicurl = hqmusicurl;
		thumb_media_id = thumbMediaId;
	}
	
}
