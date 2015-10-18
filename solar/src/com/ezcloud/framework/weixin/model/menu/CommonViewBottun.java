package com.ezcloud.framework.weixin.model.menu;

/**
 * 展示菜单
 * @author Tong
 *
 */
public class CommonViewBottun extends Button {
	private String type;  
    private String url;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = "view";
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
    
}
