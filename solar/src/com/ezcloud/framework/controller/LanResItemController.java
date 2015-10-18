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
import com.ezcloud.framework.service.system.LanResItem;
import com.ezcloud.framework.util.Message;

@Controller("frameworkLanResItemController")
@RequestMapping("/system/lan_res_item")
public class LanResItemController extends BaseController{
	@Resource(name = "frameworkLanResItemService")
	private LanResItem lanResItem;

	@RequestMapping(value = "/Item")
	public String getMoudleList(Pageable pageable, ModelMap model) {
		lanResItem.getRow().put("pageable", pageable);
		Page page = lanResItem.queryPage();
		model.addAttribute("page", page);
		return "/system/lan_res_item/Item";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/lan_res_item/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String RES_ITEM, String RES_TYPE, RedirectAttributes redirectAttributes) {
		System.out.println("RES_ITEM=======>>" + RES_ITEM + "RES_TYPE=======>>" + RES_TYPE );
		lanResItem.getRow().put("RES_ITEM", RES_ITEM);
		lanResItem.getRow().put("RES_TYPE", RES_TYPE);
		lanResItem.save();
		return "redirect:Item.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String RES_ITEM, ModelMap model) {
		lanResItem.getRow().put("RES_ITEM", RES_ITEM);
		model.addAttribute("ovo", lanResItem.find());
		return "/system/lan_res_item/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String RES_ITEM, String RES_TYPE, ModelMap model) {
		lanResItem.getRow().clear();
		lanResItem.getRow().put("RES_ITEM", RES_ITEM);
		lanResItem.getRow().put("RES_TYPE", RES_TYPE);
		lanResItem.update();
		return "redirect:Item.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		lanResItem.delete(ids);
		return SUCCESS_MESSAGE;
	}
}
