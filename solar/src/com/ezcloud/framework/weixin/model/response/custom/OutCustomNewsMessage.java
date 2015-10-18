/**     
* @Title: OutCustomNewsMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-26 上午09:34:16   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.Articles;
import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;

/**   
 * @ClassName: OutCustomNewsMessage   
 * @Description: 发送客服图文消息
 * @author ez-cloud work group   
 * @date 2013-11-26 上午09:34:16   
 *      
 */
public class OutCustomNewsMessage extends CustomBaseMessage {

	private Articles news ;
	
	public Articles getNews() {
		return news;
	}

	public void setNews(Articles news) {
		this.news = news;
	}

	
	public OutCustomNewsMessage(String touser, String msgtype, Articles news) {
		super(touser, msgtype);
		this.news = news;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomNewsMessage(String touser, String msgtype) {
		super(touser, msgtype);
		// TODO Auto-generated constructor stub
	}

}
