/**     
* @Title: UserList.java   
* @Package com.ezcloud.framework.weixin.model.user   
* @Description: TODO 
* @author ez-cloud work group    
* @date 2013-11-26 下午03:29:46   
* @version V1.0 
*/
package com.ezcloud.framework.weixin.model.user;

/**   
 * @ClassName: UserList   
 * @Description: 获取关注用户列表
 * @author ez-cloud work group   
 * @date 2013-11-26 下午03:29:46   
 *      
 */
public class UserList {

	//关注该公众账号的总用户数
	private String total;
	//拉取的OPENID个数，最大值为10000
	private String count;
	//列表数据，OPENID的列表
	private String data;
	//拉取列表的后一个用户的OPENID
	private String next_openid;
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getNext_openid() {
		return next_openid;
	}
	public void setNext_openid(String nextOpenid) {
		next_openid = nextOpenid;
	}
	
	public UserList(String total, String count, String data, String nextOpenid) {
		super();
		this.total = total;
		this.count = count;
		this.data = data;
		next_openid = nextOpenid;
	}
	
}
