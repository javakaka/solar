/**
 * @Title: SystemWindowController.java
 * @Package com.ezcloud.framework.controller
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-18 下午08:02:34
 * @version V1.0
 */
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
import com.ezcloud.framework.service.system.SystemWindow;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.DataSet;

/**
 * @ClassName: SystemWindowController
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-18 下午08:02:34
 */
@Controller("frameworkSystemWindowController")
@RequestMapping("/system/window")
public class SystemWindowController extends BaseController {

	@Resource(name = "frameworkSystemWindowService")
	private SystemWindow systemWindow;

	@RequestMapping(value = "/SystemWindow")
	public String getWindowList(Pageable pageable, ModelMap model) {
		systemWindow.getRow().put("pageable", pageable);
		Page page = systemWindow.queryPage();
		model.addAttribute("page", page);
		return "/system/window/SystemWindow";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/window/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String WIN_TARGET, String WIN_DESC, RedirectAttributes redirectAttributes) {
		System.out.println("WIN_TARGET=======>>" + WIN_TARGET + "WIN_DESC=======>>" + WIN_DESC);
		systemWindow.getRow().put("WIN_TARGET", WIN_TARGET);
		systemWindow.getRow().put("WIN_DESC", WIN_DESC);
		systemWindow.save();
		systemWindow.getRow().clear();
		return "redirect:SystemWindow.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemWindow.getRow().put("id", id);
		model.addAttribute("ovo", systemWindow.find());
		return "/system/window/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String WIN_ID, String WIN_TARGET, String WIN_DESC, ModelMap model) {
		systemWindow.getRow().clear();
		systemWindow.getRow().put("WIN_ID", WIN_ID);
		systemWindow.getRow().put("WIN_TARGET", WIN_TARGET);
		systemWindow.getRow().put("WIN_DESC", WIN_DESC);
		systemWindow.update();
		return "redirect:SystemWindow.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemWindow.delete(ids);
		return SUCCESS_MESSAGE;
	}

	@RequestMapping(value = "/SelectWindow")
	public String selectWindow(String win_id, ModelMap model) {
		DataSet ds = systemWindow.selectWindow();
		model.addAttribute("windows", ds);
		model.addAttribute("win_id", win_id);
		return "/system/window/SelectWindow";
	}
}
