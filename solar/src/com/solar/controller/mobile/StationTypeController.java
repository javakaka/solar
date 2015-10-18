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
import com.solar.service.StationTypeService;
import com.solar.service.UserService;
/**
 * @author TongJianbo
 *
 */
@Controller("solarMobileStationTypeController")
@RequestMapping("/api/station-type")
public class StationTypeController extends BaseController {
	
	private static Logger logger = Logger.getLogger(StationTypeController.class); 
	
	@Resource(name = "solarUserService")
	private UserService userService;
	
	@Resource(name = "solarStationTypeService")
	private StationTypeService stationTypeService;
	
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/list")
	public @ResponseBody
	String  list(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		String page ="1";
		String page_size ="1000";
		DataSet list =stationTypeService.list(page, page_size);
		ovo =new OVO(0,"查询成功","查询成功");
		ovo.set("list", list);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
}
