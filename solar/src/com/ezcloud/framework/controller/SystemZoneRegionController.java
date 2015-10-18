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

@Controller("frameworkSystemZoneRegionController")
@RequestMapping("/system/zone/region")
public class SystemZoneRegionController extends BaseController {
	
	
	@Resource(name = "frameworkSystemZoneService")
	private SystemZoneService zoneService;
	
	@RequestMapping(value = "/Region")
	public String list(String province_id,String city_id,String state ,Pageable pageable,ModelMap model)
	{
		Page page = zoneService.queryPageForRegion(province_id,city_id,state,pageable);
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		model.addAttribute("province_id", province_id);
		model.addAttribute("city_id", city_id);
		model.addAttribute("province_list", zoneService.findAllProvince());
		model.addAttribute("city_list", zoneService.findCitiesByProId(province_id));
		return "/system/zone/region/Region";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		model.addAttribute("province_list", zoneService.findAllProvince());
		return "/system/zone/region/add";
	}
	
	@RequestMapping(value = "/save")
	public String save(String CITYID,String NAME,String STATE,ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"state can not be null");
		Assert.notNull(CITYID,"CITYID can not be null");
		Row row =new Row();
		row.put("name", NAME);
		row.put("state", STATE);
		row.put("cityId", CITYID);
		zoneService.saveRegion(row);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:Region.do";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) {
		Assert.notNull(id,"id can not be null");
		Row row =zoneService.queryRegionById(id);
		model.addAttribute("row", row);
		model.addAttribute("city_list", zoneService.findAllCities());
		model.addAttribute("province_list", zoneService.findAllProvince());
		String province_id=zoneService.queryProvinceIdByRegionId(id);
		model.addAttribute("province_id", province_id);
		return "/system/zone/region/edit";
	}
	
	@RequestMapping(value = "/update")
	public String update(String ID,String CITYID,String NAME,String STATE, Pageable pageable, ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(ID,"ID can not be null");
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"STATE can not be null");
		Assert.notNull(CITYID,"CITYID can not be null");
		Row row =new Row();
		row.put("id", ID);
		row.put("name", NAME);
		row.put("state", STATE);
		row.put("cityId", CITYID);
		zoneService.editRegion(row);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:Region.do";
	}
	
	@RequestMapping(value = "/view")
	public String view(String id,Pageable pageable, ModelMap model) {
		Row row =zoneService.queryRegionById(id);
		model.addAttribute("row", row);
		return "/system/zone/region/view";
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		zoneService.deleteRegion(ids);
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
		if(zoneService.isRegionNameExisted(NAME))
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
		if(zoneService.isExtraRegionNameExisted(ID,NAME))
		{
			bool= false;
		}
		return bool;
	}
}
