package com.ezcloud.framework.weixin.model.menu;

/**
 * 
 * @author ez-cloud团队
 *
 */
public class Menu {
	private String id;
	private String button_level;//button;//是	 一级菜单数组，个数应为1~3个;sub_button;//否	 二级菜单数组，个数应为1~5个
	private String up_id;
	//private String button;//是	 一级菜单数组，个数应为1~3个
	//private String sub_button;//否	 二级菜单数组，个数应为1~5个
	private String menu_type;//是	 菜单的响应动作类型，目前有click、view两种类型
	private String menu_name;//是	 菜单标题，不超过16个字节，子菜单不超过40个字节
	private String menu_key;//click类型必须	 菜单KEY值，用于消息接口推送，不超过128字节
	private String menu_url;//view类型必须	 网页链接，用户点击菜单可打开链接，不超过256字节
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getButton_level() {
		return button_level;
	}
	public void setButton_level(String buttonLevel) {
		button_level = buttonLevel;
	}
	public String getUp_id() {
		return up_id;
	}
	public void setUp_id(String upId) {
		up_id = upId;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menuType) {
		menu_type = menuType;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menuName) {
		menu_name = menuName;
	}
	public String getMenu_key() {
		return menu_key;
	}
	public void setMenu_key(String menuKey) {
		menu_key = menuKey;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menuUrl) {
		menu_url = menuUrl;
	}
	
	
}