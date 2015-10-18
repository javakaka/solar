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
import com.ezcloud.framework.service.system.SystemParamsItem;
import com.ezcloud.framework.util.Message;

/**
 * 系统静态参数值维护
 * @author JianBoTong
 *
 */
@Controller("frameworkSystemParamsItemController")
@RequestMapping("/system/parameters/item")
public class SystemParamsItemController extends BaseController {

	@Resource(name = "frameworkSystemParamsItemService")
	private SystemParamsItem systemParamsItemService;

	@RequestMapping(value = "/ItemList")
	public String getMoudleList(String id,Pageable pageable, ModelMap model) {
		systemParamsItemService.getRow().put("pageable", pageable);
		if(id != null && id.replace(" ", "").length() > 0)
		{
			systemParamsItemService.getRow().put("pageable", pageable);
		}
		Page page = systemParamsItemService.queryPage();
		model.addAttribute("page", page);
		return "/system/parameters/item/ItemList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/system/parameters/item/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String FIELD_ENAME, String USED_VIEW, String DISP_VIEW,String DISP_ORDER,String NOTES, RedirectAttributes redirectAttributes) {
		Assert.notNull(FIELD_ENAME, "参数名称不能为空");
		Assert.notNull(USED_VIEW, "使用值不能为空");
		Assert.notNull(DISP_VIEW, "显示值不能为空");
//		Assert.notNull(DISP_ORDER, "显示顺序不能为空");
//		Assert.notNull(NOTES, "备注不能为空");
		systemParamsItemService.getRow().put("FIELD_ENAME", FIELD_ENAME);
		systemParamsItemService.getRow().put("USED_VIEW", USED_VIEW);
		systemParamsItemService.getRow().put("DISP_VIEW", DISP_VIEW);
		systemParamsItemService.getRow().put("DISP_ORDER", DISP_ORDER);
		systemParamsItemService.getRow().put("NOTES", NOTES);
		systemParamsItemService.save();
		return "redirect:ItemList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String field_ename,String used_view, ModelMap model) {
		Assert.notNull(field_ename, "field_ename不能为空");
		Assert.notNull(used_view, "used_view不能为空");
		systemParamsItemService.getRow().put("field_ename", field_ename);
		systemParamsItemService.getRow().put("used_view", used_view);
		model.addAttribute("row", systemParamsItemService.find());
		return "/system/parameters/item/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String FIELD_ENAME, String USED_VIEW, String DISP_VIEW,String DISP_ORDER,String NOTES, ModelMap model) {
		systemParamsItemService.getRow().clear();
		Assert.notNull(FIELD_ENAME, "参数名称不能为空");
		Assert.notNull(USED_VIEW, "参数标题不能为空");
		systemParamsItemService.getRow().put("FIELD_ENAME", FIELD_ENAME);
		systemParamsItemService.getRow().put("USED_VIEW", USED_VIEW);
		systemParamsItemService.getRow().put("DISP_VIEW", DISP_VIEW);
		systemParamsItemService.getRow().put("DISP_ORDER", DISP_ORDER);
		systemParamsItemService.getRow().put("NOTES", NOTES);
		systemParamsItemService.update();
		return "redirect:ItemList.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		systemParamsItemService.delete(ids);
		return SUCCESS_MESSAGE;
	}
}