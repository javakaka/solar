package com.ezcloud.framework.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.service.system.SystemWebPartService;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * 桌面定义
 * @ClassName: SystemWebPartController
 * @author ez-cloud work group
 * @date 2014-7-16 下午06:42:35
 */
@Controller("frameworkSystemStaffWebPartController")
@RequestMapping("/staff/portlet")
public class SystemStaffWebPartController extends BaseController {

	@Resource(name = "frameworkSystemWebPartService")
	private SystemWebPartService systemWebPartService;

	@RequestMapping(value = "/getStaffPortletJson")
	public @ResponseBody
	ResponseVO queryStaffWebPartJSon() {
		ResponseVO ovo =new ResponseVO(0, "");
		DataSet WebParts =systemWebPartService.findAll();
		HttpSession session =getSession();
		Row staff =(Row)session.getAttribute("staff");
		String staff_no =staff.getString("staff_no");
		String part_serial =systemWebPartService.getStaffWebPartSerial(staff_no);
		ovo.put("part_serial", part_serial);
		ovo.put("WebParts", WebParts);
		return ovo;
	}
	
	@RequestMapping(value = "/getStaffPortlet")
	public @ResponseBody
	ResponseVO queryStaffPortlet() {
		ResponseVO ovo =new ResponseVO(0, "");
		DataSet WebParts =systemWebPartService.findAll();
		HttpSession session =getSession();
		Row staff =(Row)session.getAttribute("staff");
		String staff_no =staff.getString("staff_no");
		String part_serial =systemWebPartService.getStaffWebPartSerial(staff_no);
		ovo.put("part_serial", part_serial);
		ovo.put("WebParts", WebParts);
		return ovo;
	}
	
	@RequestMapping(value = "/setStaffPortlet")
	public @ResponseBody
	ResponseVO setStaffPortlet(String part_serial) {
		ResponseVO ovo =new ResponseVO(0, "");
		HttpSession session =getSession();
		Row staff =(Row)session.getAttribute("staff");
		System.out.println("staff---->>"+staff);
		String staff_no =staff.getString("staff_no");
		systemWebPartService.setStaffWebPartSerial(part_serial,staff_no);
		return ovo;
	}
}