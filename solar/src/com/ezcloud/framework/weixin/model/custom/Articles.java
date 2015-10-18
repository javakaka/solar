/**     
* @Title: Articles.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:56:54   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Articles   
 * @Description: TODO
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:56:54   
 *      
 */
public class Articles {

	//标题
	private String title;
	//描述
	private String description;
	//点击后跳转的链接
	private String url;
	//图文消息的图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80
	private String picurl;
	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public Articles(String title, String description, String url, String picurl) {
		super();
		this.title = title;
		this.description = description;
		this.url = url;
		this.picurl = picurl;
	}
	
}
