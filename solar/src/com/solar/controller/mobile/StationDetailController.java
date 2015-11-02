package com.solar.controller.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.vo.VOConvert;
import com.solar.service.StationDetailService;
import com.solar.service.StationService;
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
	
	@Resource(name = "solarStationService")
	private StationService stationService;
	
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
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-1,"电站编号不能为空","电站编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String DayKWH ="0";
		String TotalKWH ="0";
		String WS_AT ="0";
		String WS_PVT ="0";
		String WS_IRR ="0";
		String WS_WNDS ="0";
		String WS_WNDD ="0";
		String IRRHour ="0";
		String TotalOnus ="0";
		String ElectricityPrice ="0";
		String SubsidiesPrice ="0";
		String TotalProfit ="0";
		String MyProfit ="0";
		String TotalInvest ="0";
		Row row =stationDetailService.findByStationId(id);
		if(row != null )
		{
			DayKWH =row.getString("DayKWH","0");
			TotalKWH =row.getString("TotalKWH","0");
			WS_AT =row.getString("WS-AT","0");
			WS_PVT =row.getString("WS-PVT","0");
			WS_IRR =row.getString("WS-IRR","0");
			WS_WNDS =row.getString("WS-WNDS","0");
			WS_WNDD =row.getString("WS-WNDD","0");
			IRRHour =row.getString("IRRHour","0");
			TotalOnus =row.getString("TotalOnus","0");
			ElectricityPrice =row.getString("ElectricityPrice","0");
			SubsidiesPrice =row.getString("SubsidiesPrice","0");
			TotalProfit =row.getString("TotalProfit","0");
			MyProfit =row.getString("MyProfit","0");
			TotalInvest =row.getString("TotalInvest","0");
		}
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
		String remark ="";
		Row stationRow =stationService.find(id);
		if(stationRow != null )
		{
			remark =stationRow.getString("remarks","");
			remark =StringUtils.string2Json(remark);
		}
		ovo.set("remark", remark);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
}
