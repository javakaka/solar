package com.ezcloud.framework.service.plugin;

import com.ezcloud.framework.vo.Row;

/**
 * Service - 插件配置
 */
public interface PluginConfigService{

	/**
	 * 判断插件ID是否存在
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件ID是否存在
	 */
	boolean pluginIdExists(String pluginId);

	/**
	 * 根据插件ID查找插件配置
	 * 
	 * @param pluginId
	 *            插件ID
	 * @return 插件配置，若不存在则返回null
	 */
	Row findByPluginId(String pluginId);

	String  getPluginAttribute(String id,String name);
}