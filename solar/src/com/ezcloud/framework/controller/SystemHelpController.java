package com.ezcloud.framework.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.system.SystemFaqService;

@Controller("frameworkSystemHelpController")
@RequestMapping("help")
public class SystemHelpController extends BaseController{
	
	@Resource(name = "frameworkSystemFaqService")
	private SystemFaqService systemFaqService;
	
	
	@RequestMapping("/HelpI")
	public String grantRole( ModelMap model) throws JException, SQLException
	{
		model.addAttribute("treeData", systemFaqService.getFaqTree());
		return "/help/HelpI";
	}
	
	
	@RequestMapping("/Help")
	public String editFaq(String faq_no, ModelMap model) throws JException, SQLException
	{
//		Assert.notNull(faq_no, "主题编号不能为空");
		if(faq_no == null || faq_no.replace(" ", "").length() ==0)
		{
			return "redirect:HelpM.jsp";
		}
		model.addAttribute("row",systemFaqService.find(faq_no));
		return "/help/Help";
	}
}