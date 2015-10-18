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
import com.ezcloud.framework.service.system.Bureau;
import com.ezcloud.framework.util.Message;
/**
 * 区域维护
 * @author JianBoTong
 *
 */
@Controller("frameworkSystemBureauController")
@RequestMapping("/system/org")
public class SystemBureauController  extends BaseController{
	@Resource(name = "frameworkSystemBureauService")
	private Bureau bureau;

	@RequestMapping(value = "/Bureau")
	public String list(Pageable pageable, ModelMap model) {
		bureau.getRow().put("pageable", pageable);
		Page page = bureau.queryPage();
		model.addAttribute("page", page);
		return "/system/org/Bureau";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/org/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String BUREAU_NAME, String UP_BUREAU_NO, String AREA_CODE, String LINKS,String NOTES ,RedirectAttributes redirectAttributes) {
		bureau.getRow().clear();
		bureau.getRow().put("BUREAU_NAME", BUREAU_NAME);
		bureau.getRow().put("UP_BUREAU_NO", UP_BUREAU_NO);
		bureau.getRow().put("AREA_CODE", AREA_CODE);
		bureau.getRow().put("LINKS", LINKS);
		bureau.getRow().put("NOTES", NOTES);
		try {
			bureau.save();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:Bureau.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		bureau.getRow().put("id", id);
		model.addAttribute("bureau", bureau.find());
		return "/system/org/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String BUREAU_NO,String BUREAU_NAME, String UP_BUREAU_NO, String AREA_CODE, String LINKS,String NOTES , ModelMap model) {
		bureau.getRow().clear();
		bureau.getRow().put("BUREAU_NO", BUREAU_NO);
		bureau.getRow().put("BUREAU_NAME", BUREAU_NAME);
		bureau.getRow().put("UP_BUREAU_NO", UP_BUREAU_NO);
		bureau.getRow().put("AREA_CODE", AREA_CODE);
		bureau.getRow().put("LINKS", LINKS);
		bureau.getRow().put("NOTES", NOTES);
		bureau.update();
		return "redirect:Bureau.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		bureau.delete(ids);
		return SUCCESS_MESSAGE;
	}
}
