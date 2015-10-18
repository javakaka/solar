package com.ezcloud.framework.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.SystemSqlLog;
import com.ezcloud.framework.util.Message;

/**
 * SQL执行日志业务处理类
 * @author JianBoTong
 */

@Controller("frameworkSystemSqlLogController")
@RequestMapping("/system/log/sql")
public class SystemSqlLogController extends BaseController {

	@Resource(name = "frameworkSystemSqlLogService")
	private SystemSqlLog systemSqlLogService;

	@RequestMapping(value = "/SqlLog")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemSqlLogService.getRow().put("pageable", pageable);
		Page page = systemSqlLogService.queryPage();
		model.addAttribute("page", page);
		return "/system/log/sql/SqlLog";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemSqlLogService.getRow().put("id", id);
		model.addAttribute("row", systemSqlLogService.find());
		return "/system/log/sql/edit";
	}


	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemSqlLogService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	
}
