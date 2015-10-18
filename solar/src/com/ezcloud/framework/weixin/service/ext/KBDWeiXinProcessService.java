package com.ezcloud.framework.weixin.service.ext;

import java.util.TimeZone;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezcloud.framework.common.Setting;
import com.ezcloud.framework.util.SettingUtils;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.weixin.model.OutMessage;
import com.ezcloud.framework.weixin.model.request.InClickEventMessage;
import com.ezcloud.framework.weixin.model.request.InSubscribeEventMessage;
import com.ezcloud.framework.weixin.model.request.InTextMessage;
import com.ezcloud.framework.weixin.model.response.OutTextMessage;
import com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice;
import com.ezcloud.utility.DateUtil;
import com.solar.service.UserService;

@Component("frameworkWechatHandlerService")
public class KBDWeiXinProcessService  extends BaseWeiXinProcessWervice{

	@Resource(name = "solarUserService")
	private UserService userService;
	
	/**
	* 
	*<p>Title: handleEventMsgRequest</p>   
	*<p>Description: 处理事件请求：</p>   
	* 事件包括：
	* 1.用户关注/取消关注事件
	* 2.扫描二维码事件，1未关注公众号扫描；2已关注公众号扫描
	* 3.上报地理位置
	* 4.自定义菜单点击事件
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleEventMsgRequest(java.lang.Object)
	 */
	
	@Override
	public OutMessage handleEventMsgRequest(Object msg) {
		
		return null;
	}

	public KBDWeiXinProcessService() {
		super();
		TimeZone timeZone =TimeZone.getTimeZone("Asia/Shanghai");
		TimeZone.setDefault(timeZone);
	}

	@Override
	public OutMessage handleImageMsgRequest(Object msg) {
		return null;
	}

	@Override
	public OutMessage handleLinkMsgRequest(Object msg) {
		return null;
	}

	@Override 
	public OutMessage handleLocationMsgRequest(Object msg) {
		return null;
	}

	@Override
	public OutMessage handleTextMsgRequest(Object msg) {
		//接收到内容为“拍卖”的文本消息，返回拍卖入口链接给用户
		InTextMessage inTextMsg =(InTextMessage)msg;
		OutMessage outMessage =null;
		String outType =null;
		
		String fromUserName =inTextMsg.getFromUserName();
		String toUserName =inTextMsg.getToUserName();
		String userContent =inTextMsg.getContent();
		String createTime =DateUtil.getCurrentDateTime();
		String msgType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		Setting setting =SettingUtils.get();
		String site_url =setting.getSiteUrl();
		String page_url =site_url+"/paimaipage/site/index.do?from_user="+fromUserName;
		String content =null;
		if(userContent.equals("拍卖"))
		{
			content ="您好，点击这里试试<a href=\""+page_url+"\">拍卖专场</a>";
		}
		else
		{
			content ="您好，未找到您想要的内容";
		}
		OutTextMessage outTextMessage =new OutTextMessage(fromUserName, toUserName, createTime, msgType, content);
		outType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		outMessage =new OutMessage(outType,outTextMessage);
		return outMessage;
	}

	/**
	* <p>Title: handleVideoMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleVideoMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleVideoMsgRequest(Object msg) {
		return null;
	}

	/**
	* <p>Title: handleVoiceMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleVoiceMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleVoiceMsgRequest(Object msg) {
		return null;
	}

	@Override
	public OutMessage handleVoiceRecognitionMsgRequest(Object msg) {
		return null;
	}

	/**
	* <p>Title: handleClickEventMsgRequest</p>   
	* <p>Description: 处理自定义点击菜单事件</p>   
	* 微信平台图片大小为360×200时，显示效果最佳
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleClickEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleClickEventMsgRequest(Object msg) {
		OutMessage outMessage =null;
		String outType =null;
		
		InClickEventMessage oInClickEventMessage =(InClickEventMessage)msg;
		String fromUserName =oInClickEventMessage.getFromUserName();
		String toUserName =oInClickEventMessage.getToUserName();
		String event =oInClickEventMessage.getEvent();
		String eventKey =oInClickEventMessage.getEventKey();
		
		System.out.println("event........>>"+event+"    eventKey........>>"+eventKey);
		
		/**凡是涉及到报表查询的操作，都需要检验该微信号是否绑定了共总帐号，
		 * 未绑定，提示用户绑定公众号
		 * 已经绑定的，则执行查报表的操作
		 * **/
		//日能耗分析
		if(eventKey.equalsIgnoreCase("report_day"))
		{
		}
		return outMessage;
	}

	/**
	* <p>Title: handleLocationEventMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleLocationEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleLocationEventMsgRequest(Object msg) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	* <p>Title: handleScanSubscribeEventMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleScanSubscribeEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleScanSubscribeEventMsgRequest(Object msg) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	* <p>Title: handleScanUnSubscribeEventMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleScanUnSubscribeEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleScanUnSubscribeEventMsgRequest(Object msg) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	* <p>Title: handleSubscribeEventMsgRequest</p>   
	* <p>Description: 用户关注公众号事件</p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleSubscribeEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleSubscribeEventMsgRequest(Object msg) {
		OutMessage outMessage =null;
		String outType =null;
		InSubscribeEventMessage oInSubscribeEventMessage =(InSubscribeEventMessage)msg;
		/**
		 * 显示欢迎语句
		 */
		String fromUserName =oInSubscribeEventMessage.getFromUserName();
		String toUserName =oInSubscribeEventMessage.getToUserName();
		String createTime =DateUtil.getCurrentDateTime();
		String msgType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		String content =null;
		content ="尊敬的用户您好";
		//保存用户到数据库
		Row userRow =userService.findByOpenid(fromUserName);
		Row row =new Row();
		if(userRow == null)
		{
			row.put("from_user",fromUserName);
			row.put("sub_state","1");
			userService.insert(row);
		}
		else
		{
			row.put("id",userRow.getString("id"));
			row.put("sub_state","1");
			userService.update(row);
		}
		OutTextMessage outTextMessage =new OutTextMessage(fromUserName, toUserName, createTime, msgType, content);
		outType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		outMessage =new OutMessage(outType,outTextMessage);
		return outMessage;
	}

	/**
	* <p>Title: handleUnSubscribeEventMsgRequest</p>   
	* <p>Description: </p>   
	* @param msg
	* @return   
	* @see com.ezcloud.framework.weixin.service.BaseWeiXinProcessWervice#handleUnSubscribeEventMsgRequest(java.lang.Object)   
	*/
	@Override
	public OutMessage handleUnSubscribeEventMsgRequest(Object msg) {
		OutMessage outMessage =null;
		String outType =null;
		InSubscribeEventMessage oInSubscribeEventMessage =(InSubscribeEventMessage)msg;
		/**
		 * 显示欢迎语句
		 */
		String fromUserName =oInSubscribeEventMessage.getFromUserName();
		String toUserName =oInSubscribeEventMessage.getToUserName();
		String createTime =DateUtil.getCurrentDateTime();
		String msgType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		String content =null;
		content ="欢迎再次关注";
		Row userRow =userService.findByOpenid(fromUserName);
		Row row =new Row();
		if(userRow != null)
		{
			row.put("id",userRow.getString("id"));
			row.put("sub_state","2");
			userService.update(row);
		}
		OutTextMessage outTextMessage =new OutTextMessage(fromUserName, toUserName, createTime, msgType, content);
		outType =BaseWeiXinProcessWervice.RESPONSE_MESSAGE_TYPE_TEXT;
		outMessage =new OutMessage(outType,outTextMessage);
		return outMessage;
	}

}
