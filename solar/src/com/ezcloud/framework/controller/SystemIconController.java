/**
 * @Title: SystemIconController.java
 * @Package com.ezcloud.framework.controller
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-18 下午08:02:34
 * @version V1.0
 */
package com.ezcloud.framework.controller;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.SystemIcon;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.DataSet;

/**
 * @ClassName: SystemIconController
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-18 下午08:02:34
 */
@Controller("frameworkSystemIconController")
@RequestMapping("/system/icon")
public class SystemIconController extends BaseController {

	@Resource(name = "frameworkSystemIconService")
	private SystemIcon systemIcon;

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/SystemIcon")
	public String getWindowList(Pageable pageable,ServletRequest request, ModelMap model) {
		String rootPath=request.getRealPath("/");
		if(rootPath !=null){
			rootPath +="images/icons/";
		}
		systemIcon.getRow().put("pageable", pageable);
		systemIcon.getRow().put("realPath", rootPath);
		Page page = systemIcon.queryPageByRealPath();
		model.addAttribute("page", page);
		return "/system/icon/SystemIcon";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/icon/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String ICO_NAME, RedirectAttributes redirectAttributes) {
		systemIcon.getRow().put("ICO_NAME", ICO_NAME);
		systemIcon.save();
		systemIcon.getRow().clear();
		return "redirect:SystemIcon.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String ICO_NAME, ModelMap model) {
		systemIcon.getRow().put("ICO_NAME", ICO_NAME);
		model.addAttribute("ovo", systemIcon.find());
		return "/system/icon/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String ICO_NAME, ModelMap model) {
		systemIcon.getRow().clear();
		systemIcon.getRow().put("ICO_NAME", ICO_NAME);
		systemIcon.update();
		return "redirect:SystemIcon.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		systemIcon.delete(ids);
		return SUCCESS_MESSAGE;
	}

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/SelectIcon")
	public String selectIcon(String win_id, ServletRequest request, ModelMap model) {
		String rootPath=request.getRealPath("/");
		if(rootPath !=null){
			rootPath +="images/icons/";
		}
		systemIcon.getRow().put("realPath", rootPath);
		DataSet ds = systemIcon.getSystemSelectIcons();
		model.addAttribute("icons", ds);
		model.addAttribute("win_id", win_id);
		return "/system/icon/SelectIcon";
	}
}
