package com.ezcloud.framework.weixin.model;

public class Articles {

	private String Title;
	private String Description;
	private String PicUrl;
	private String Url;
	public String getTitle() {
		return Title;
	}
	public void setTitle(String Title) {
		this.Title = Title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String Description) {
		this.Description = Description;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String PicUrl) {
		this.PicUrl = PicUrl;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String Url) {
		this.Url = Url;
	}
	public Articles() {
		super();
	}
	public Articles(String Title, String Description, String PicUrl, String Url) {
		super();
		this.Title = Title;
		this.Description = Description;
		this.PicUrl = PicUrl;
		this.Url = Url;
	}
	
}