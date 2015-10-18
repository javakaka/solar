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
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**   
 * @author shike001 
 * E-mail:510836102@qq.com   
 * @version 创建时间：2015-4-14 下午4:32:13  
 * 类说明: 
 */
@Controller("frameworkProvinceController")
@RequestMapping("/system/zone/province")
public class SystemZoneProvinceController extends BaseController{
	
	@Resource(name = "frameworkSystemZoneService")
	private SystemZoneService zoneService;
	
	@RequestMapping(value = "/Province")
	public String list(String state ,Pageable pageable,ModelMap model)
	{
		Page page = zoneService.queryPageForProvince(state,pageable);
		model.addAttribute("page", page);
		model.addAttribute("state", state);
		return "/system/zone/province/Province";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/zone/province/add";
	}
	
	@RequestMapping(value = "/save")
	public String save(String NAME,String STATE,ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"state name can not be null");
		Row proRow =new Row();
		proRow.put("name", NAME);
		proRow.put("state", STATE);
		zoneService.saveProvince(proRow);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:Province.do";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) {
		Assert.notNull(id,"id can not be null");
		Row row =zoneService.findProvinceById(id);
		model.addAttribute("row", row);
		return "/system/zone/province/edit";
	}
	
	@RequestMapping(value = "/update")
	public String update(String ID, String NAME, String STATE, Pageable pageable, ModelMap model,RedirectAttributes redirectAttributes) {
		Assert.notNull(ID,"ID can not be null");
		Assert.notNull(NAME,"NAME can not be null");
		Assert.notNull(STATE,"STATE name can not be null");
		Row proRow =new Row();
		proRow.put("id", ID);
		proRow.put("name", NAME);
		proRow.put("state", STATE);
		zoneService.editProvince(proRow);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:Province.do";
	}
	
	@RequestMapping(value = "/view")
	public String view(String id,Pageable pageable, ModelMap model) {
		Row row =zoneService.findProvinceById(id);
		model.addAttribute("row", row);
		return "/system/zone/province/view";
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		zoneService.deleteProvince(ids);
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
		if(zoneService.isProvinceNameExisted(NAME))
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
		if(zoneService.isExtraProvinceNameExisted(ID,NAME))
		{
			bool= false;
		}
		return bool;
	}
	
	/**
	 * 根据省份编号查询所有的下属城市列表
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/queryCitiesByProId")
	public @ResponseBody
	ResponseVO queryCitiesByProId(String id) {
		ResponseVO ovo =new ResponseVO();
		DataSet ds =zoneService.queryCitiesByProId(id);
		ovo.put("city_list", ds);
		return ovo;
	}
}