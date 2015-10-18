/**
 * @Title: MainController.java
 * @Package com.ezcloud.framework.controller
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-15 下午01:24:07
 * @version V1.0
 */
package com.ezcloud.framework.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.service.system.Permission;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * @ClassName: MainController
 * @Description: TODO
 * @author ez-cloud work group
 * @date 2014-7-15 下午01:24:07
 */
@Controller("frameworkMainController")
@RequestMapping("/main")
public class MainController extends BaseController {
	@Resource(name = "frameworkPermissionService")
	private Permission permissionService;

	@RequestMapping(value = "/menu/main")
	public String getMainMenu(ModelMap model, HttpSession session,RedirectAttributes redirectAttributes) {
		Row staff = (Row) session.getAttribute("staff");
		if (staff == null) {
			model.addAttribute("error", message("framework.not.login"));
			addFlashMessage(redirectAttributes, Message.error("请先登陆"));
			return "redirect:/login/Login.jsp";
		}
		String staff_no = staff.getString("staff_no");
		System.out.println("staff_no:" + staff_no);
		permissionService.getRow().put("staff_no", staff_no);
		permissionService.getStaffPermission();
		ovo = dealPermissionData(permissionService.getDataSet());
		model.addAttribute("ovo", ovo);
		model.addAttribute("staff", staff);
		return "/main/menu/main";
	}

	@SuppressWarnings("unchecked")
	public Row dealPermissionData(DataSet ds) {
		Row ovo = new Row();
		if (ds == null || ds.size() == 0)
			return null;
		/** 第一级模块功能菜单 **/
		DataSet topNavDs = new DataSet();
		/** 左侧第一级功能菜单 **/
		DataSet menubNavDs = new DataSet();
		/** 左侧第一级功能菜单的子菜单 **/
		DataSet funDs = new DataSet();
		String UP_FUN_ID = null;
		String id = null;
		for (int i = 0; i < ds.size(); i++) {
			Row temp = (Row) ds.get(i);
			UP_FUN_ID = temp.getString("UP_FUN_ID", null);
			if (UP_FUN_ID == null || UP_FUN_ID.replace(" ", "").length() == 0) {
				topNavDs.add(temp);
			}
		}
		String FUN_ID = null;

		if (topNavDs.size() > 0) {
			for (int i = 0; i < topNavDs.size(); i++) {
				Row temp = (Row) topNavDs.get(i);
				FUN_ID = temp.getString("FUN_ID");
				for (int j = 0; j < ds.size(); j++) {
					Row row2 = (Row) ds.get(j);
					UP_FUN_ID = row2.getString("UP_FUN_ID", null);
					id = row2.getString("FUN_ID");
					if (UP_FUN_ID != null && !id.equals(FUN_ID) && UP_FUN_ID.equals(FUN_ID)) {
						menubNavDs.add(row2);
					}
				}
			}
		}

		if (menubNavDs.size() > 0) {
			for (int i = 0; i < menubNavDs.size(); i++) {
				Row temp = (Row) menubNavDs.get(i);
				FUN_ID = temp.getString("FUN_ID");
				for (int j = 0; j < ds.size(); j++) {
					Row row2 = (Row) ds.get(j);
					UP_FUN_ID = row2.getString("UP_FUN_ID", null);
					id = row2.getString("FUN_ID");
					if (UP_FUN_ID != null && !id.equals(FUN_ID) && UP_FUN_ID.equals(FUN_ID)) {
						funDs.add(row2);
					}
				}
			}
		}
		ovo.put("top_nav", topNavDs);
		ovo.put("menu_nav", menubNavDs);
		ovo.put("fun_nav", funDs);
//		System.out.print("ovo=====================>>>:" + ovo);
		return ovo;
	}
}