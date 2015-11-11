package com.solar.controller.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.VOConvert;
import com.solar.service.NewsService;
import com.solar.service.UserService;
/**
 * @author TongJianbo
 *
 */
@Controller("solarMobileCompanyNewsController")
@RequestMapping("/api/news")
public class NewsController extends BaseController {
	
	private static Logger logger = Logger.getLogger(NewsController.class); 
	
	@Resource(name = "solarUserService")
	private UserService userService;
	
	@Resource(name = "solarNewsService")
	private NewsService newsService;
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/list")
	public @ResponseBody
	String  queryContactUs(HttpServletRequest request) throws Exception
	{
		logger.info("list==============>>");
		parseRequest(request);
		String page =ivo.getString("page","1");
		String page_size =ivo.getString("page_size","10");
		String type_id =ivo.getString("type_id","");
		DataSet list =newsService.list(page, page_size);
		ovo =new OVO(0,"查询成功","查询成功");
		ovo.set("list", list);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
}
