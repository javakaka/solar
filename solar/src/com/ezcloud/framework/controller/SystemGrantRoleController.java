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
import com.ezcloud.framework.service.system.StaffRole;
import com.ezcloud.framework.service.system.SystemGrantRole;
import com.ezcloud.framework.service.system.SystemPositionRole;
import com.ezcloud.framework.service.system.SystemRole;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

@Controller("frameworkSystemGrantRoleController")
@RequestMapping("system/grantrole")
public class SystemGrantRoleController extends BaseController{

	@Resource(name = "frameworkGrantRoleService")
	private SystemGrantRole grantRoleService;
	
	@Resource(name = "frameworkSystemRoleService")
	private SystemRole systemRoleService;
	
	@Resource(name = "frameworkPositionRoleService")
	private SystemPositionRole systemPositionRoleService;
	
	@Resource(name = "frameworkStaffRoleService")
	private StaffRole systemStaffRoleService;
	
	
	@RequestMapping("/GrantRole")
	public String grantRole( ModelMap model) throws JException, SQLException
	{
		model.addAttribute("treeData", grantRoleService.getDeptPostionStaffTree());
		return "/system/grantrole/GrantRole";
	}
	
	/**
	 * 显示当前选中的部门或者人员的角色列表
	 * 1 全部的角色列表
	 * 2 角色或者人员拥有的角色
	 * @param model
	 * @return
	 * @throws JException
	 * @throws SQLException
	 */
	@RequestMapping("/RoleAuth")
	public String roleAuth(HttpServletRequest request, ModelMap model) throws JException, SQLException
	{
		String type ="0";//默认不查询岗位或者人员的角色
		// all roles
		model.addAttribute("roles", systemRoleService.findAll());
		// position or staff 's roles 
		String posi_no =(String)request.getParameter("posi_no");
		// position
		DataSet posiRoleDataSet =null;
		if( posi_no != null  && posi_no.replace(" ", "").length() > 0)
		{
			String posi_name  = (String)request.getParameter("posi_name");
			if(posi_name == null ){
				posi_name = "";
			}
			type ="1";
			System.out.println("posi_no =====>>"+posi_no);
			systemPositionRoleService.getRow().put("posi_no", posi_no);
			posiRoleDataSet = systemPositionRoleService.queryPositionRole();
			model.addAttribute("role_dataset", posiRoleDataSet);
			model.addAttribute("posi_name", posi_name);
			model.addAttribute("posi_no", posi_no);
		}
		String staff_no =(String)request.getParameter("staff_no");
		// staff
		DataSet staffRoleDataSet =null;
		if( staff_no != null  && staff_no.replace(" ", "").length() > 0)
		{
			String staff_name  = (String)request.getParameter("staff_name");
			if(staff_name == null )
			{
				staff_name = "";
			}
			type ="4";
			systemStaffRoleService.getRow().put("staff_no", staff_no);
			staffRoleDataSet = systemStaffRoleService.queryStaffRole();
			model.addAttribute("role_dataset", staffRoleDataSet);
			System.out.println("type ===============>>"+type);
			model.addAttribute("staff_name", staff_name);
			model.addAttribute("staff_no", staff_no);
		}
		model.addAttribute("type", type);
		return "/system/grantrole/RoleAuth";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/saveRoleAuth")
	public @ResponseBody ResponseVO saveRoleAuth(String type,String id, String items)
	{
		ResponseVO  ovo =new ResponseVO();
		Assert.notNull(type,"type not null");
		Assert.notNull(id,"id not null");
//		Assert.notNull(items,"items not null");
//		String use_state = null;
//		String assign_state = null;
		String arr [] =null;
		String item[] =null;
		DataSet roleDataSet =new DataSet();
		Row roleRow =null;
		//posi
		if(type.equals("1"))
		{
			if(items == null || items.replace(" ", "").length() == 0)
			{
				roleDataSet =null;
			}
			else
			{
				arr  =items.split(",");
				for(int i=0; i< arr.length; i++)
				{
					item =arr[i].split("@");
					roleRow =new Row();
					roleRow.put("posi_no", id);
					roleRow.put("role_id", item[0]);
					roleRow.put("use_state", item[1]);
					roleRow.put("assign_state", item[2]);
					roleDataSet.add(roleRow);
				}
			}
			systemPositionRoleService.savePositionRoleAuth(id,roleDataSet);
		}
		else if(type.equals("4"))
		{
			if(items == null || items.replace(" ", "").length() == 0)
			{
				roleDataSet =null;
			}
			else
			{
				arr  =items.split(",");
				for(int i=0; i< arr.length; i++)
				{
					item =arr[i].split("@");
					roleRow =new Row();
					roleRow.put("staff_no", id);
					roleRow.put("role_id", item[0]);
					roleRow.put("use_state", item[1]);
					roleRow.put("assign_state", item[2]);
					roleDataSet.add(roleRow);
				}
			}
			systemStaffRoleService.saveStaffRoleAuth(id, roleDataSet);
		}
		ovo.put("status", "1");
		return ovo;
	}
}