/**
 * @Title: Direction.java
 * @Package com.ezcloud.framework.controller
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-17 上午11:39:13
 * @version V1.0
 */
package com.ezcloud.framework.page.jdbc;


/**
 * @ClassName: Direction
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-17 上午11:39:13
 */
/**
 * 方向
 */
public enum Direction {

	/** 递增 */
	asc,

	/** 递减 */
	desc;

	/**
	 * 从String中获取Direction
	 * 
	 * @param value
	 *            值
	 * @return String对应的Direction
	 */
	public static Direction fromString(String value) {
		return Direction.valueOf(value.toLowerCase());
	}
}
