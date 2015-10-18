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
import com.ezcloud.framework.service.system.SystemZoneService;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.Row;

@Controller("frameworkSystemZoneCityController")
@RequestMapping("/system/zone/city")
public class SystemZoneCityController extends BaseController {
	
	@Resource(name = "frameworkSystemZoneService")
	private SystemZoneService zoneService;
	
	@RequestMapping(value = "/City")
	public String list(String province_id, String state ,Pageable pageable,ModelMap model)
	{
		Page page = zoneService.queryPageForCity(province_id,state,pageable);
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute("province_id", province_id);
		model.addAttribute("province_list", zoneService.findAllProvince());
		
		return "/system/zone/city/City";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		model.addAttribute("province_list", zoneService.findAllProvince());
		return "/system/zone/city/add";
	}
	
	@RequestMapping(value = "/save")
	public String save(String NAME,String STATE,String PROVINCEID,ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"STATE can not be null");
		Assert.notNull(PROVINCEID,"PROVINCEID can not be null");
		Row proRow =new Row();
		proRow.put("name", NAME);
		proRow.put("state", STATE);
		proRow.put("provinceId", PROVINCEID);
		zoneService.saveCity(proRow);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:City.do";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) {
		Assert.notNull(id,"id can not be null");
		Row row =zoneService.queryCityById(id);
		model.addAttribute("row", row);
		model.addAttribute("province_list", zoneService.findAllProvince());
		return "/system/zone/city/edit";
	}
	
	@RequestMapping(value = "/update")
	public String update(String ID, String NAME, String STATE,String PROVINCEID, Pageable pageable, ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(ID,"ID can not be null");
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"STATE can not be null");
		Assert.notNull(PROVINCEID,"PROVINCEID can not be null");
		Row row =new Row();
		row.put("id", ID);
		row.put("name", NAME);
		row.put("state", STATE);
		row.put("provinceId", PROVINCEID);
		zoneService.editCity(row);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:City.do";
	}
	
	@RequestMapping(value = "/view")
	public String view(String id,Pageable pageable, ModelMap model) {
		Row row =zoneService.queryCityById(id);
		model.addAttribute("row", row);
		return "/system/zone/city/view";
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		zoneService.deleteCity(ids);
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 检查名称是否已存在
	 */
	@RequestMapping(value = "/check_name", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkAdName(String NAME) {
		if (StringUtils.isEmptyOrNull(NAME)) {
			return false;
		}
		if(zoneService.isCityNameExisted(NAME))
		{
			return false;
		}
		return true;
	}
	
	/**
	 * 检查名称是否已存在
	 */
	@RequestMapping(value = "/check_extra_name", method = RequestMethod.GET)
	public @ResponseBody
	boolean check_extra_name(String ID,String NAME) {
		boolean bool=true;
		if (StringUtils.isEmptyOrNull(NAME)) {
			bool= false;
		}
		if(zoneService.isExtraCityNameExisted(ID,NAME))
		{
			bool= false;
		}
		System.out.println("bool------------->>"+bool);
		return bool;
	}
}
