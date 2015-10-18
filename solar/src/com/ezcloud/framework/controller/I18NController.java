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
import com.ezcloud.framework.service.system.I18N;
import com.ezcloud.framework.service.system.LanResItem;
import com.ezcloud.framework.service.system.Language;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.DataSet;

/**
 * 国际化
 * @author JianBoTong
 *
 */
@Controller("frameworkI18NController")
@RequestMapping("/system/i18n")
public class I18NController extends BaseController{

	@Resource(name="frameworkI18NService")
	private I18N i18nService;
	
	@Resource(name = "frameworkLanguageService")
	private Language languageService;
	
	@Resource(name = "frameworkLanResItemService")
	private LanResItem lanResItemService;
	
	@RequestMapping(value = "/International")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		i18nService.getRow().put("pageable", pageable);
		Page page = i18nService.queryPage();
		model.addAttribute("page", page);
		return "/system/i18n/International";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		//language
		DataSet lanDs =languageService.queryAllItems();
		// res_item
		DataSet itemDs =lanResItemService.queryAllResItem();
		model.addAttribute("lan_list", lanDs);
		model.addAttribute("item_list", itemDs);
		return "/system/i18n/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String RES_ITEM, String LAN_NO,String RES, RedirectAttributes redirectAttributes) {
		i18nService.getRow().put("RES_ITEM", RES_ITEM);
		i18nService.getRow().put("LAN_NO", LAN_NO);
		i18nService.getRow().put("RES", RES);
		i18nService.save();
		return "redirect:International.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String RES_ITEM,String LAN_NO,ModelMap model) {
		i18nService.getRow().put("RES_ITEM", RES_ITEM);
		i18nService.getRow().put("LAN_NO", LAN_NO);
		model.addAttribute("ovo", i18nService.find());
		return "/system/i18n/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String RES_ITEM, String LAN_NO,String RES, ModelMap model) {
		i18nService.getRow().clear();
		i18nService.getRow().put("RES_ITEM", RES_ITEM);
		i18nService.getRow().put("LAN_NO", LAN_NO);
		i18nService.getRow().put("RES", RES);
		i18nService.update();
		return "redirect:International.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		i18nService.delete(ids);
		return SUCCESS_MESSAGE;
	}
}