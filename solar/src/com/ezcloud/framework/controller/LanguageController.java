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
import com.ezcloud.framework.service.system.Language;
import com.ezcloud.framework.util.Message;

@Controller("frameworkLanguageController")
@RequestMapping("/system/language")
public class LanguageController  extends BaseController{

	@Resource(name = "frameworkLanguageService")
	private Language language;

	@RequestMapping(value = "/Language")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		language.getRow().put("pageable", pageable);
		Page page = language.queryPage();
		model.addAttribute("page", page);
		return "/system/language/Language";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/language/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String LAN_NO, String LAN_NAME, String LAN_STATE, RedirectAttributes redirectAttributes) {
		System.out.println("LAN_NO=======>>" + LAN_NO + "LAN_NAME=======>>" + LAN_NAME + "LAN_STATE=======>>" + LAN_STATE);
		language.getRow().put("LAN_NO", LAN_NO);
		language.getRow().put("LAN_NAME", LAN_NAME);
		language.getRow().put("LAN_STATE", LAN_STATE);
		language.save();
		return "redirect:Language.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String LAN_NO, ModelMap model) {
		language.getRow().put("LAN_NO", LAN_NO);
		model.addAttribute("ovo", language.find());
		return "/system/language/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String LAN_NO, String LAN_NAME, String LAN_STATE, ModelMap model) {
		language.getRow().clear();
		language.getRow().put("LAN_NO", LAN_NO);
		language.getRow().put("LAN_NAME", LAN_NAME);
		language.getRow().put("LAN_STATE", LAN_STATE);
		language.update();
		return "redirect:Language.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		language.delete(ids);
		return SUCCESS_MESSAGE;
	}
}