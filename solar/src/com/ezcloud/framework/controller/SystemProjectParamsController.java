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
import com.ezcloud.framework.service.system.ProjectParameter;
import com.ezcloud.framework.service.system.SystemProject;
import com.ezcloud.framework.util.Message;

/**
 * 系统项目业务处理类
 * @author JianBoTong
 *
 */

@Controller("frameworkSystemProjectParamsController")
@RequestMapping("/system/project/params")
public class SystemProjectParamsController extends BaseController {

	@Resource(name = "frameworkProjectParameterService")
	private ProjectParameter projectParameter;
	
	@Resource(name = "frameworkProjectService")
	private SystemProject systemProject;

	@RequestMapping(value = "/ParamsList")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		projectParameter.getRow().put("pageable", pageable);
		Page page = projectParameter.queryPage();
		model.addAttribute("page", page);
		return "/system/project/params/ParamsList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		model.addAttribute("select_options", systemProject.selectAll());
		return "/system/project/params/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String PROJECT_ID, String PARA_NAME,  String PARA_VALUE,String NOTES, RedirectAttributes redirectAttributes) {
		projectParameter.getRow().put("PROJECT_ID", PROJECT_ID);
		projectParameter.getRow().put("PARA_NAME", PARA_NAME);
		projectParameter.getRow().put("PARA_VALUE", PARA_VALUE);
		projectParameter.getRow().put("NOTES", NOTES);
		projectParameter.save();
		return "redirect:ParamsList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		projectParameter.getRow().put("id", id);
		model.addAttribute("row", projectParameter.find());
		model.addAttribute("select_options", systemProject.selectAll());
		return "/system/project/params/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String PARA_ID, String PROJECT_ID, String PARA_NAME,  String PARA_VALUE,String NOTES, ModelMap model) {
		projectParameter.getRow().clear();
		projectParameter.getRow().put("PARA_ID", PARA_ID);
		projectParameter.getRow().put("PROJECT_ID", PROJECT_ID);
		projectParameter.getRow().put("PARA_NAME", PARA_NAME);
		projectParameter.getRow().put("PARA_VALUE", PARA_VALUE);
		projectParameter.getRow().put("NOTES", NOTES);
		projectParameter.update();
		return "redirect:ParamsList.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		projectParameter.delete(ids);
		return SUCCESS_MESSAGE;
	}
}
