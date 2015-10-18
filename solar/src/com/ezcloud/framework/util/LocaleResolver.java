/**
 * @Title: LocaleResolver.java
 * @Package com.ezcloud.framework.util
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-14 下午07:03:15
 * @version V1.0
 */
package com.ezcloud.framework.util;

import com.ezcloud.framework.service.Service;

/**
 * @ClassName: LocaleResolver
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-14 下午07:03:15
 */
public class LocaleResolver extends Service {

	private String locale;

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public LocaleResolver() {
		super();
	}

	// 获取国际化资源
	public String getMessage(String code, Object... args) {
		String message = "";
		if (code == null || code.replace(" ", "").length() == 0) {
			return message;
		}
		sql = "select res from fm_international_res where RES_ITEM='" + code + "' and LAN_NO='" + getLocale() + "' ";
		message = queryField(sql);
		if (message == null) {
			return code;
		}
		if (args != null && args.length > 0) {
			String tagPrefix = "{";
			String tagSufix = "}";
			String tag = null;
			for (int i = 0; i < args.length; i++) {
				tag = tagPrefix + String.valueOf(i) + tagSufix;
				if (message.contains(tag)) {
					message = message.replace(tag, (String) args[i]);
				}
			}
		}
		return message;
	}
}