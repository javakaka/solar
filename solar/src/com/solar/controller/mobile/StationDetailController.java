package com.solar.controller.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.vo.VOConvert;
import com.solar.service.StationDetailService;
/**
 * @author TongJianbo
 *
 */
@Controller("solarMobileStationDetailController")
@RequestMapping("/api/station-detail")
public class StationDetailController extends BaseController {
	
	private static Logger logger = Logger.getLogger(StationDetailController.class); 
	
	
	@Resource(name = "solarStationDetailService")
	private StationDetailService stationDetailService;
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/list")
	public @ResponseBody
	String  list(HttpServletRequest request) throws Exception
	{
		ovo =new OVO(0,"查询成功","查询成功");
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/profile")
	public @ResponseBody
	String  queryDetailByStationID(HttpServletRequest request) throws Exception
	{
		logger.info("list==============>>");
		parseRequest(request);
		String id =ivo.getString("id","");
		if(StringUtils.isEmpty(id))
		{
			ovo =new OVO(-1,"电站编号不能为空","电站编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		Row row =stationDetailService.findByStationId(id);
		String DayKWH =row.getString("DayKWH","0");
		String TotalKWH =row.getString("TotalKWH","0");
		String WS_AT =row.getString("WS-AT","0");
		String WS_PVT =row.getString("WS-PVT","0");
		String WS_IRR =row.getString("WS-IRR","0");
		String WS_WNDS =row.getString("WS-WNDS","0");
		String WS_WNDD =row.getString("WS-WNDD","0");
		String IRRHour =row.getString("IRRHour","0");
		String TotalOnus =row.getString("TotalOnus","0");
		String ElectricityPrice =row.getString("ElectricityPrice","0");
		String SubsidiesPrice =row.getString("SubsidiesPrice","0");
		String TotalProfit =row.getString("TotalProfit","0");
		String MyProfit =row.getString("MyProfit","0");
		String TotalInvest =row.getString("TotalInvest","0");
		ovo =new OVO(0,"查询成功","查询成功");
		ovo.set("DayKWH", DayKWH);
		ovo.set("TotalKWH", TotalKWH);
		ovo.set("WS_AT", WS_AT);
		ovo.set("WS_PVT", WS_PVT);
		ovo.set("WS_IRR", WS_IRR);
		ovo.set("WS_WNDS", WS_WNDS);
		ovo.set("WS_WNDD", WS_WNDD);
		ovo.set("IRRHour", IRRHour);
		ovo.set("TotalOnus", TotalOnus);
		ovo.set("ElectricityPrice", ElectricityPrice);
		ovo.set("SubsidiesPrice", SubsidiesPrice);
		ovo.set("TotalProfit", TotalProfit);
		ovo.set("MyProfit", MyProfit);
		ovo.set("TotalInvest", TotalInvest);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
}
