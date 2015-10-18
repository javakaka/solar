/**     
* @Title: Text.java   
* @Package com.ezcloud.framework.weixin.model.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-22 下午05:42:41   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.custom;

/**   
 * @ClassName: Text   
 * @Description: 客服文本消息内容
 * @author ez-cloud work group   
 * @date 2013-11-22 下午05:42:41   
 *      
 */
public class Text {

	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Text(String content) {
		super();
		this.content = content;
	}
	
}
