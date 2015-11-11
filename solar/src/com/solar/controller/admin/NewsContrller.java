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
import com.solar.service.NewsService;
/**
 * 
 * @author TongJianbo
 *
 */
@Controller("solarPlatformCompanyNewsController")
@RequestMapping("/solarpage/platform/info/news")
public class NewsContrller  extends BaseController{

	
	@Resource(name = "solarNewsService")
	private NewsService newsService;
	
	/**
	 * 分页查询用户
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(Pageable pageable, ModelMap model) {
		newsService.getRow().put("pageable", pageable);
		Page page = newsService.queryPage();
		model.addAttribute("page", page);
		newsService.getRow().clear();
		return "/solarpage/platform/info/news/list";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/solarpage/platform/info/news/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row row =MapUtils.convertMaptoRowWithoutNullField(map);
		newsService.insert(row);
		addFlashMessage(redirectAttributes, Message.success("操作成功"));
		return "redirect:list.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(String id, ModelMap model) throws Exception {
		Row row =newsService.find(id);
		model.addAttribute("row", row);
		return "/solarpage/platform/info/news/edit";
	}

	@RequestMapping(value = "/update")
	public String update(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row row=MapUtils.convertMaptoRowWithoutNullField(map);
		newsService.update(row);
		addFlashMessage(redirectAttributes,Message.success("操作成功"));
		return "redirect:list.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		newsService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
}
