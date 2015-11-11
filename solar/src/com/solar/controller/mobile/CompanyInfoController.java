package com.solar.controller.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.common.Setting;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.HtmlUtils;
import com.ezcloud.framework.util.SettingUtils;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.vo.VOConvert;
import com.solar.service.CompanyInfoService;
import com.solar.service.UserService;
/**
 * @author TongJianbo
 *
 */
@Controller("solarMobileCompanyInfoController")
@RequestMapping("/api/company-info")
public class CompanyInfoController extends BaseController {
	
	private static Logger logger = Logger.getLogger(CompanyInfoController.class); 
	
	@Resource(name = "solarUserService")
	private UserService userService;
	
	@Resource(name = "solarCompanyInfoService")
	private CompanyInfoService companyInfoService;
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/contact-us")
	public @ResponseBody
	String  queryContactUs(HttpServletRequest request) throws Exception
	{
		logger.info("list==============>>");
		parseRequest(request);
		String address ="";
		String tel ="";
		String email ="";
		String site ="";
		String fax ="";
		String zipcode ="";
		Row row =companyInfoService.findOneRecord();
		if(row != null )
		{
			address =row.getString("address","");
			tel =row.getString("tel","");
			email =row.getString("email","");
			site =row.getString("site","");
			fax =row.getString("fax","");
			zipcode =row.getString("zipcode","");
		}
		ovo =new OVO(0,"查询成功","查询成功");
		ovo.set("address", address);
		ovo.set("tel", tel);
		ovo.set("email", email);
		ovo.set("site", site);
		ovo.set("fax", fax);
		ovo.set("zipcode", zipcode);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/desc")
	public @ResponseBody
	String  queryComponyIntroduction(HttpServletRequest request) throws Exception
	{
		logger.info("list==============>>");
		parseRequest(request);
		String introduction ="";
		Row row =companyInfoService.findOneRecord();
		if(row != null )
		{
			introduction =row.getString("introduction","");
			if(! StringUtils.isEmptyOrNull(introduction))
			{
				Setting setting =SettingUtils.get();
				String site_url =setting.getSiteUrl();
				String domain =site_url;
				int iPos =site_url.lastIndexOf("/");
				if(iPos != -1)
				{
					domain =site_url.substring(0,iPos);
				}
				//替换图片标签的url为http全路径
				introduction =HtmlUtils.fillImgSrcWithDomain(domain, introduction);
				// 转义字符串中的换行，不然在转成json对象时会报错
				introduction =StringUtils.string2Json(introduction);
			}
		}
		ovo =new OVO(0,"查询成功","查询成功");
		ovo.set("introduction", introduction);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
}
