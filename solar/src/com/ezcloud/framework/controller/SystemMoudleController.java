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
import com.ezcloud.framework.service.system.SystemMoudle;
import com.ezcloud.framework.util.Message;

/**
 * 模块维护
 * 
 * @ClassName: SystemMoudleController
 * @author ez-cloud work group
 * @date 2014-7-16 下午06:42:35
 */
@Controller("frameworkSystemMoudleController")
@RequestMapping("/system/sm_moudle")
public class SystemMoudleController extends BaseController {

	@Resource(name = "frameworkSystemMoudleService")
	private SystemMoudle systemMoudle;

	@RequestMapping(value = "/SystemModel")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		systemMoudle.getRow().put("pageable", pageable);
		Page page = systemMoudle.queryPage();
		model.addAttribute("page", page);
		return "/system/sm_moudle/SystemModel";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/sm_moudle/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String MOUDLE_NAME, String MOUDLE_BEGIN_TAB, String MOUDLE_DESC, RedirectAttributes redirectAttributes) {
		System.out.println("MOUDLE_NAME=======>>" + MOUDLE_NAME + "MOUDLE_BEGIN_TAB=======>>" + MOUDLE_BEGIN_TAB + "MOUDLE_DESC=======>>" + MOUDLE_DESC);
		systemMoudle.getRow().put("MOUDLE_NAME", MOUDLE_NAME);
		systemMoudle.getRow().put("MOUDLE_BEGIN_TAB", MOUDLE_BEGIN_TAB);
		systemMoudle.getRow().put("MOUDLE_DESC", MOUDLE_DESC);
		systemMoudle.save();
		// systemMoudle.getRow().clear();
		return "redirect:SystemModel.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemMoudle.getRow().put("id", id);
		model.addAttribute("moudle", systemMoudle.find());
		return "/system/sm_moudle/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String MOUDLE_ID, String MOUDLE_NAME, String MOUDLE_BEGIN_TAB, String MOUDLE_DESC, ModelMap model) {
		systemMoudle.getRow().clear();
		systemMoudle.getRow().put("MOUDLE_ID", MOUDLE_ID);
		systemMoudle.getRow().put("MOUDLE_NAME", MOUDLE_NAME);
		systemMoudle.getRow().put("MOUDLE_BEGIN_TAB", MOUDLE_BEGIN_TAB);
		systemMoudle.getRow().put("MOUDLE_DESC", MOUDLE_DESC);
		systemMoudle.update();
		return "redirect:SystemModel.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemMoudle.delete(ids);
		return SUCCESS_MESSAGE;
	}
}