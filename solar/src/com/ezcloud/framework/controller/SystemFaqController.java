package com.ezcloud.framework.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.service.system.SystemFaqService;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.Row;

@Controller("frameworkSystemFaqController")
@RequestMapping("system/help")
public class SystemFaqController extends BaseController{
	
	@Resource(name = "frameworkSystemFaqService")
	private SystemFaqService systemFaqService;
	
	
	@RequestMapping("/Main")
	public String grantRole( ModelMap model) throws JException, SQLException
	{
		model.addAttribute("treeData", systemFaqService.getFaqTree());
		return "/system/help/Main";
	}
	
	/**
	 * 
	 * @param model
	 * @return
	 * @throws JException
	 * @throws SQLException
	 */
	@RequestMapping("/Child")
	public String getFaq(HttpServletRequest request, ModelMap model) throws JException, SQLException
	{
		//详情
//		String faq_no =request.getParameter("faq_no");
		//下属
		String pfaq_no =request.getParameter("pfaq_no");
		//相关
//		String rfaq_no =request.getParameter("rfaq_no");
		if(pfaq_no == null || pfaq_no.replace(" ", "").length() ==0)
		{
			model.addAttribute("data_list", systemFaqService.getFaqTree());
		}
		else
		{
			model.addAttribute("data_list", systemFaqService.getSubFaqList(pfaq_no));
			model.addAttribute("pfaq_no", pfaq_no);
		}
		return "/system/help/Child";
	}
	
	
	/**
	 * @param model
	 * @return
	 * @throws JException
	 * @throws SQLException
	 */
	@RequestMapping("/add")
	public String addFaq(String pfaq_no, ModelMap model) throws JException, SQLException
	{
		if( pfaq_no == null || pfaq_no.replace(" ", "").length() ==0)
		{
			pfaq_no ="";
		}
		model.addAttribute("pfaq_no", pfaq_no);
		return "/system/help/add";
	}
	
	@RequestMapping("/save")
	public String save(String SUBJECT,String PFAQ_NO,String CONTENT, ModelMap model) throws JException, SQLException
	{
		Assert.notNull(SUBJECT, "主题不能为空");
		Assert.notNull(CONTENT, "内容不能为空");
		String redirect_pfaq_no =PFAQ_NO;
		if(PFAQ_NO == null || PFAQ_NO.replace(" ", "").length() == 0)
		{
			PFAQ_NO ="0";
			redirect_pfaq_no ="";
		}
		Row row =new Row();
		row.put("SUBJECT", SUBJECT);
		row.put("PFAQ_NO", PFAQ_NO);
		row.put("CONTENT", CONTENT);
		systemFaqService.save(row);
		return "redirect:Child.do?pfaq_no="+redirect_pfaq_no;
	}
	
	@RequestMapping("/edit")
	public String editFaq(String faq_no, ModelMap model) throws JException, SQLException
	{
		Assert.notNull(faq_no, "主题编号不能为空");
		model.addAttribute("row",systemFaqService.find(faq_no));
		return "/system/help/edit";
	}
	
	@RequestMapping("/update")
	public String updateFaq(String FAQ_NO,String SUBJECT,String PFAQ_NO,String CONTENT, ModelMap model) throws JException, SQLException
	{
		Assert.notNull(FAQ_NO, "主题编号不能为空");
		Assert.notNull(SUBJECT, "主题不能为空");
		Assert.notNull(CONTENT, "内容不能为空");
		String redirect_pfaq_no =PFAQ_NO;
		if( PFAQ_NO == null || PFAQ_NO.replace(" ", "").length() ==0)
		{
			PFAQ_NO ="";
			redirect_pfaq_no ="";
		}
		Row row =new Row();
		row.put("FAQ_NO", FAQ_NO);
		row.put("SUBJECT", SUBJECT);
		row.put("PFAQ_NO", PFAQ_NO);
		row.put("CONTENT", CONTENT);
		systemFaqService.update(row);
		return "redirect:Child.do?pfaq_no="+redirect_pfaq_no;
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(String[] ids) {
		systemFaqService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
}