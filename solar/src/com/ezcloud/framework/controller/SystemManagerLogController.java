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
import com.ezcloud.framework.service.system.SystemLog;
import com.ezcloud.framework.util.Message;

/**
 * 系统管理日志业务处理类
 * @author JianBoTong
 */

@Controller("frameworkSystemManagerLogController")
@RequestMapping("/system/log/sm")
public class SystemManagerLogController extends BaseController {

	@Resource(name = "frameworkSystemManagerLogService")
	private SystemLog systemLogService;

	@RequestMapping(value = "/LogList")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemLogService.getRow().put("pageable", pageable);
		Page page = systemLogService.queryPage();
		model.addAttribute("page", page);
		return "/system/log/sm/LogList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/log/sm/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String OPERATE_TYPE, String SITE_NO, String POSI_NO,String STAFF_NO,String CONTENT ,String LOG_TIME,RedirectAttributes redirectAttributes) {
		systemLogService.getRow().put("OPERATE_TYPE",OPERATE_TYPE );
		systemLogService.getRow().put("SITE_NO",SITE_NO );
		systemLogService.getRow().put("POSI_NO", POSI_NO);
		systemLogService.getRow().put("STAFF_NO", STAFF_NO);
		systemLogService.getRow().put("CONTENT",CONTENT );
		systemLogService.getRow().put("LOG_TIME",LOG_TIME );
		systemLogService.save();
		return "redirect:LogList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemLogService.getRow().put("id", id);
		model.addAttribute("row", systemLogService.find());
		return "/system/log/sm/edit";
	}


	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemLogService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	
}
