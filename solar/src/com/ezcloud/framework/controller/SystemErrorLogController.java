package com.ezcloud.framework.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.SystemErrorLog;
import com.ezcloud.framework.util.Message;

/**
 * 系统管理日志业务处理类
 * @author JianBoTong
 */

@Controller("frameworkSystemErrorLogController")
@RequestMapping("/system/log/error")
public class SystemErrorLogController extends BaseController {

	@Resource(name = "frameworkSystemErrorLogService")
	private SystemErrorLog systemErrorLogService;

	@RequestMapping(value = "/ErrorLog")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemErrorLogService.getRow().put("pageable", pageable);
		Page page = systemErrorLogService.queryPage();
		model.addAttribute("page", page);
		return "/system/log/error/ErrorLog";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/log/error/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String OPERATE_TYPE, String SITE_NO, String POSI_NO,String STAFF_NO,String CONTENT ,String LOG_TIME,RedirectAttributes redirectAttributes) {
		systemErrorLogService.getRow().put("OPERATE_TYPE",OPERATE_TYPE );
		systemErrorLogService.getRow().put("SITE_NO",SITE_NO );
		systemErrorLogService.getRow().put("POSI_NO", POSI_NO);
		systemErrorLogService.getRow().put("STAFF_NO", STAFF_NO);
		systemErrorLogService.getRow().put("CONTENT",CONTENT );
		systemErrorLogService.getRow().put("LOG_TIME",LOG_TIME );
		systemErrorLogService.save();
		return "redirect:ErrorLog.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemErrorLogService.getRow().put("id", id);
		model.addAttribute("row", systemErrorLogService.find());
		return "/system/log/error/edit";
	}


	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemErrorLogService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	
}
