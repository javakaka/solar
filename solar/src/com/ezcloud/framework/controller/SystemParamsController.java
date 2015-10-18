package com.ezcloud.framework.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.SystemParams;
import com.ezcloud.framework.util.Message;

/**
 * 系统静态参数维护
 * @author JianBoTong
 *
 */
@Controller("frameworkSystemParamsController")
@RequestMapping("/system/parameters")
public class SystemParamsController extends BaseController {

	@Resource(name = "frameworkSystemParamsService")
	private SystemParams systemParamsService;

	@RequestMapping(value = "/ParamList")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemParamsService.getRow().put("pageable", pageable);
		Page page = systemParamsService.queryPage();
		model.addAttribute("page", page);
		return "/system/parameters/ParamList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/parameters/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String FIELD_NAME, String ITEM_TITLE, String NOTES,String ONLY_VIEW, RedirectAttributes redirectAttributes) {
		Assert.notNull(FIELD_NAME, "参数名称不能为空");
		Assert.notNull(ITEM_TITLE, "参数标题不能为空");
		Assert.notNull(NOTES, "参数简介不能为空");
		Assert.notNull(ONLY_VIEW, "参数是否只是显示不能为空");
		systemParamsService.getRow().put("FIELD_NAME", FIELD_NAME);
		systemParamsService.getRow().put("ITEM_TITLE", ITEM_TITLE);
		systemParamsService.getRow().put("NOTES", NOTES);
		systemParamsService.getRow().put("ONLY_VIEW", ONLY_VIEW);
		systemParamsService.save();
		return "redirect:ParamList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) {
		systemParamsService.getRow().put("id", id);
		model.addAttribute("row", systemParamsService.find());
		return "/system/parameters/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String FIELD_NAME, String ITEM_TITLE, String NOTES,String ONLY_VIEW,ModelMap model) {
		systemParamsService.getRow().clear();
		Assert.notNull(FIELD_NAME, "参数名称不能为空");
		Assert.notNull(ITEM_TITLE, "参数标题不能为空");
		Assert.notNull(NOTES, "参数简介不能为空");
		Assert.notNull(ONLY_VIEW, "参数是否只是显示不能为空");
		systemParamsService.getRow().put("FIELD_NAME", FIELD_NAME);
		systemParamsService.getRow().put("ITEM_TITLE", ITEM_TITLE);
		systemParamsService.getRow().put("NOTES", NOTES);
		systemParamsService.getRow().put("ONLY_VIEW", ONLY_VIEW);
		systemParamsService.update();
		return "redirect:ParamList.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		systemParamsService.delete(ids);
		return SUCCESS_MESSAGE;
	}
}