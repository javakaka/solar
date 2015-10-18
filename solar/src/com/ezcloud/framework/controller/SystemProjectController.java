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
import com.ezcloud.framework.service.system.SystemProject;
import com.ezcloud.framework.util.Message;

/**
 * 系统项目业务处理类
 * @author JianBoTong
 *
 */

@Controller("frameworkSystemProjectController")
@RequestMapping("/system/project")
public class SystemProjectController extends BaseController {

	@Resource(name = "frameworkProjectService")
	private SystemProject systemProject;

	@RequestMapping(value = "/ProjectList")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemProject.getRow().put("pageable", pageable);
		Page page = systemProject.queryPage();
		model.addAttribute("page", page);
		return "/system/project/ProjectList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/project/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String PROJECT_NAME, String PROJECT_ENAME, String PROJECT_DESC,String BEGIN_DATE,String DAYS ,String COMPANY ,String CUSTOMER,String ABOUT_US,String CONTACT ,String SERVICES, RedirectAttributes redirectAttributes) {
		systemProject.getRow().put("PROJECT_NAME",PROJECT_NAME );
		systemProject.getRow().put("PROJECT_ENAME",PROJECT_ENAME );
		systemProject.getRow().put("PROJECT_DESC", PROJECT_DESC);
		systemProject.getRow().put("BEGIN_DATE", BEGIN_DATE);
		systemProject.getRow().put("DAYS",DAYS );
		systemProject.getRow().put("COMPANY",COMPANY );
		systemProject.getRow().put("CUSTOMER", CUSTOMER);
		systemProject.getRow().put("ABOUT_US", ABOUT_US);
		systemProject.getRow().put("CONTACT", CONTACT);
		systemProject.getRow().put("SERVICES",SERVICES );

		systemProject.save();
		return "redirect:ProjectList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemProject.getRow().put("id", id);
		model.addAttribute("row", systemProject.find());
		return "/system/project/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String PROJECT_ID, String PROJECT_NAME, String PROJECT_ENAME, String PROJECT_DESC,String BEGIN_DATE,String DAYS ,String COMPANY ,String CUSTOMER,String ABOUT_US,String CONTACT ,String SERVICES, ModelMap model) {
		systemProject.getRow().clear();
		systemProject.getRow().put("PROJECT_ID", PROJECT_ID);
		systemProject.getRow().put("PROJECT_NAME",PROJECT_NAME );
		systemProject.getRow().put("PROJECT_ENAME",PROJECT_ENAME );
		systemProject.getRow().put("PROJECT_DESC", PROJECT_DESC);
		systemProject.getRow().put("BEGIN_DATE", BEGIN_DATE);
		systemProject.getRow().put("DAYS",DAYS );
		systemProject.getRow().put("COMPANY",COMPANY );
		systemProject.getRow().put("CUSTOMER", CUSTOMER);
		systemProject.getRow().put("ABOUT_US", ABOUT_US);
		systemProject.getRow().put("CONTACT", CONTACT);
		systemProject.getRow().put("SERVICES",SERVICES );
		systemProject.update();
		return "redirect:ProjectList.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemProject.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	
}
