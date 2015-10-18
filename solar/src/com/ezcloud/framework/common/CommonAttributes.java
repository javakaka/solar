package com.ezcloud.framework.common;

/**
 * 公共参数
 */
public final class CommonAttributes {

	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss" };

	/** system.xml文件路径 */
	public static final String SYSTEM_XML_PATH = "/system.xml";

	/** system.properties文件路径 */
	public static final String SYSTEM_PROPERTIES_PATH = "/system.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}

}