package com.ezcloud.framework.weixin.model.menu;

/**
 * 复杂菜单，代表了一个一级菜单一级他的子菜单
 * @author Tong
 */
public class ComplexButton extends Button {
	private Button[] sub_button;

	public Button[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(Button[] subButton) {
		sub_button = subButton;
	}
	
}
