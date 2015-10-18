package com.ezcloud.framework.weixin.model.response;

import java.util.ArrayList;
import java.util.List;

import com.ezcloud.framework.weixin.model.Message;
import com.ezcloud.framework.weixin.model.Articles;

/**
 * 回复图文
 * @author Administrator
 * 
 * <xml>
 <ToUserName><![CDATA[toUser]]></ToUserName>
 <FromUserName><![CDATA[fromUser]]></FromUserName>
 <CreateTime>12345678</CreateTime>
 <MsgType><![CDATA[news]]></MsgType>
 <ArticleCount>2</ArticleCount>
 <Articles>
 <item>
 <Title><![CDATA[title1]]></Title> 
 <Description><![CDATA[description1]]></Description>
 <PicUrl><![CDATA[picurl]]></PicUrl>
 <Url><![CDATA[url]]></Url>
 </item>
 <item>
 <Title><![CDATA[title]]></Title>
 <Description><![CDATA[description]]></Description>
 <PicUrl><![CDATA[picurl]]></PicUrl>
 <Url><![CDATA[url]]></Url>
 </item>
 </Articles>
 </xml> 
 */

public class OutNewsMessage extends Message {

	private String ArticleCount;
	private List<Articles> item =new ArrayList<Articles>();
	
	
	public OutNewsMessage() {
		super();
	}

	public OutNewsMessage(String toUserName,
			String fromUserName, String createTime, String msgType,String articleCount,  List<Articles> list) {
		super(toUserName, fromUserName, createTime, msgType);
		ArticleCount = articleCount;
		this.item = list;
	}

	public OutNewsMessage(String articleCount, List<Articles> list) {
		super();
		ArticleCount = articleCount;
		this.item = list;
	}

	public String getArticleCount() {
		return ArticleCount;
	}

	public void setArticleCount(String articleCount) {
		ArticleCount = articleCount;
	}

	public List<Articles> getList() {
		return item;
	}

	public void setList(List<Articles> list) {
		this.item = list;
	}

	@Override
	protected String ObjectToXml(Object object) {
		return null;
	}

	@Override
	protected Object XmlToObject(Object object) {
		return null;
	}
}