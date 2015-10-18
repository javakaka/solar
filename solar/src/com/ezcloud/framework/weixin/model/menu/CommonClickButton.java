package com.ezcloud.framework.weixin.model.menu;

/**
 * 点击菜单
 * @author Tong
 *
 */
public class CommonClickButton extends Button {
	private String type;  
    private String key;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = "click";
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
    
}
