package com.ezcloud.framework.weixin.model.response;

import com.ezcloud.framework.weixin.model.Message;
/*
 * <xml>
 <ToUserName><![CDATA[toUser]]></ToUserName>
 <FromUserName><![CDATA[fromUser]]></FromUserName>
 <CreateTime>12345678</CreateTime>
 <MsgType><![CDATA[music]]></MsgType>
 <Music>
 <Title><![CDATA[TITLE]]></Title>
 <Description><![CDATA[DESCRIPTION]]></Description>
 <MusicUrl><![CDATA[MUSIC_Url]]></MusicUrl>
 <HQMusicUrl><![CDATA[HQ_MUSIC_Url]]></HQMusicUrl>
 </Music>
 </xml>
 */
import com.ezcloud.framework.weixin.model.Music;

/**
 * 回复音乐
 * @author Administrator
 */
public class OutMusicMessage extends Message {

	private Music music ;
	
	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

	public OutMusicMessage() {
		super();
	}

	public OutMusicMessage(String toUserName,
			String fromUserName, String createTime, String msgType) {
		super(toUserName, fromUserName, createTime, msgType);
	}
	
	public OutMusicMessage(Music music) {
		super();
		this.music = music;
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