package com.ezcloud.framework.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller - 共用
 */
@Controller("systemCommonController")
@RequestMapping("/common")
public class CommonController {


	/**
	 * 网站关闭
	 */
	@RequestMapping("/site_close")
	public String siteClose() {
		return "/common/site_close";
	}


	/**
	 * 错误提示
	 */
	@RequestMapping("/error")
	public String error() {
		return "/common/error";
	}

	/**
	 * 资源不存在
	 */
	@RequestMapping("/resource_not_found")
	public String resourceNotFound() {
		return "/common/resource_not_found";
	}

}