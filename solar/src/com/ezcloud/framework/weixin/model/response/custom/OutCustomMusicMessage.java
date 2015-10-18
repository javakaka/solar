/**     
* @Title: OutCustomMusicMessage.java   
* @Package com.ezcloud.framework.weixin.model.response.custom   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-26 上午09:33:36   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.response.custom;

import com.ezcloud.framework.weixin.model.custom.CustomBaseMessage;
import com.ezcloud.framework.weixin.model.custom.Music;

/**   
 * @ClassName: OutCustomMusicMessage   
 * @Description: 发送客服音乐消息
 * @author ez-cloud work group   
 * @date 2013-11-26 上午09:33:36   
 *      
 */
public class OutCustomMusicMessage extends CustomBaseMessage {

	private Music music;
	
	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

	public OutCustomMusicMessage(String touser, String msgtype, Music music) {
		super(touser, msgtype);
		this.music = music;
	}

	/**   
	* <p>Title: </p>   
	* <p>Description: </p>   
	* @param touser
	* @param msgtype   
	*/
	public OutCustomMusicMessage(String touser, String msgtype) {
		super(touser, msgtype);
		// TODO Auto-generated constructor stub
	}

}
