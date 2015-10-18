package com.ezcloud.framework.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.SystemWebPartService;
import com.ezcloud.framework.util.MapUtils;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.Row;

/**
 * 桌面定义
 * @ClassName: SystemWebPartController
 * @author ez-cloud work group
 * @date 2014-7-16 下午06:42:35
 */
@Controller("frameworkSystemWebPartController")
@RequestMapping("/system/webpart")
public class SystemWebPartController extends BaseController {
	
	@Resource(name = "frameworkSystemWebPartService")
	private SystemWebPartService systemWebPartService;

	@RequestMapping(value = "/list")
	public String list(Pageable pageable, ModelMap model) {
		Page page = systemWebPartService.queryPage(pageable);
		model.addAttribute("page", page);
		return "/system/webpart/list";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/webpart/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam HashMap<String,String>map, RedirectAttributes redirectAttributes) {
		Row row =MapUtils.convertMaptoRowWithoutNullField(map);
		systemWebPartService.save(row);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) {
		Assert.notNull(id, "编号不能为空!");
		model.addAttribute("row", systemWebPartService.find(id));
		return "/system/webpart/edit";
	}

	@RequestMapping(value = "/update")
	public String update(@RequestParam HashMap<String,String>map, ModelMap model, RedirectAttributes redirectAttributes) {
		Row row =MapUtils.convertMaptoRowWithoutNullField(map);
		systemWebPartService.update(row);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemWebPartService.delete(ids);
		return SUCCESS_MESSAGE;
	}
}