package com.solar.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.controller.BaseController;
import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.util.MapUtils;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.Row;
import com.solar.service.RecruitmentService;

/**
 * 招聘信息
 * @author TongJianbo
 *
 */
@Controller("solarPlatformRecruitmentController")
@RequestMapping("/solarpage/platform/info/employ")
public class RecruitmentContrller  extends BaseController{
	
	@Resource(name = "solarRecruitmentService")
	private RecruitmentService recruitmentService;
	
	/**
	 * 分页查询用户
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(Pageable pageable, ModelMap model) {
		recruitmentService.getRow().put("pageable", pageable);
		Page page = recruitmentService.queryPage();
		model.addAttribute("page", page);
		recruitmentService.getRow().clear();
		return "/solarpage/platform/info/employ/list";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/solarpage/platform/info/employ/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row row =MapUtils.convertMaptoRowWithoutNullField(map);
		recruitmentService.insert(row);
		addFlashMessage(redirectAttributes, Message.success("操作成功"));
		return "redirect:list.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) throws Exception {
		Row row =recruitmentService.find(id);
		model.addAttribute("row", row);
		return "/solarpage/platform/info/employ/edit";
	}

	@RequestMapping(value = "/update")
	public String update(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row row=MapUtils.convertMaptoRowWithoutNullField(map);
		recruitmentService.update(row);
		addFlashMessage(redirectAttributes,Message.success("操作成功"));
		return "redirect:list.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		recruitmentService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
}
