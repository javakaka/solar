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
import com.ezcloud.framework.util.Md5Util;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.DateUtil;
import com.solar.service.CompanyInfoService;
/**
 * 
 * @author TongJianbo
 *
 */
@Controller("solarPlatformCompanyInfoController")
@RequestMapping("/solarpage/platform/info/contact")
public class CompanyInfoContrller  extends BaseController{

	@Resource(name = "solarCompanyInfoService")
	private CompanyInfoService companyInfoService;
	

	@RequestMapping(value = "/update")
	public String update(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row row=MapUtils.convertMaptoRowWithoutNullField(map);
		String id =row.getString("id","");
		if(StringUtils.isEmptyOrNull(id))
		{
			companyInfoService.insert(row);
			row =companyInfoService.findOneRecord();
		}
		else
		{
			companyInfoService.update(row);	
			row.put("id", id);
		}
		addFlashMessage(redirectAttributes,Message.success("操作成功"));
		return "redirect:detail.do?id="+row.getString("id");
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		companyInfoService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
}
