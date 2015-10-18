package com.ezcloud.framework.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.Bureau;
import com.ezcloud.framework.service.system.SystemFun;
import com.ezcloud.framework.service.system.SystemRole;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.vo.DataSet;
/**
 *角色维护
 * @author JianBoTong
 *
 */
@Controller("frameworkSystemRoleController")
@RequestMapping("/system/role")
public class SystemRoleController  extends BaseController{
	
	@Resource(name = "frameworkSystemRoleService")
	private SystemRole systemRoleService;
	
	@Resource(name = "frameworkSystemBureauService")
	private Bureau bureauService;
	
	@Resource(name = "frameworkSystemFunService")
	private SystemFun systemFunService;

	@RequestMapping(value = "/RoleList")
	public String list(Pageable pageable, ModelMap model) {
		systemRoleService.getRow().put("pageable", pageable);
		Page page = systemRoleService.queryPage();
		model.addAttribute("page", page);
		return "/system/role/RoleList";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		DataSet ds=bureauService.queryAllBureau();
		model.addAttribute("bureau", ds);
		return "/system/role/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String BUREAU_NO, String ROLE_NAME, String ROLE_DESC, String ROLE_BEGINTIME,String ROLE_ENDTIME ,String STATE,RedirectAttributes redirectAttributes) {
		systemRoleService.getRow().clear();
		if(BUREAU_NO == null){
			BUREAU_NO ="";
		}
		systemRoleService.getRow().put("BUREAU_NO", BUREAU_NO);
		systemRoleService.getRow().put("ROLE_NAME", ROLE_NAME);
		systemRoleService.getRow().put("ROLE_DESC", ROLE_DESC);
		systemRoleService.getRow().put("ROLE_BEGINTIME", ROLE_BEGINTIME);
		systemRoleService.getRow().put("ROLE_ENDTIME", ROLE_ENDTIME);
		systemRoleService.getRow().put("STATE", STATE);
		systemRoleService.save();
		return "redirect:RoleList.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) {
		systemRoleService.getRow().put("id", id);
		model.addAttribute("role", systemRoleService.find());
		model.addAttribute("bureau", bureauService.queryAllBureau());
		return "/system/role/edit";
	}

	@RequestMapping(value = "/update")
	public String update(String ROLE_ID,String BUREAU_NO, String ROLE_NAME, String ROLE_DESC, String ROLE_BEGINTIME,String ROLE_ENDTIME ,String STATE,ModelMap model) {
		systemRoleService.getRow().clear();
		Assert.notNull(ROLE_ID, "ROLE_ID 不能为空 ");
		Assert.notNull(ROLE_NAME, "ROLE_NAME 不能为空 ");
		systemRoleService.getRow().put("ROLE_ID", ROLE_ID);
		systemRoleService.getRow().put("BUREAU_NO", BUREAU_NO);
		systemRoleService.getRow().put("ROLE_NAME", ROLE_NAME);
		systemRoleService.getRow().put("ROLE_DESC", ROLE_DESC);
		systemRoleService.getRow().put("ROLE_BEGINTIME", ROLE_BEGINTIME);
		systemRoleService.getRow().put("ROLE_ENDTIME", ROLE_ENDTIME);
		systemRoleService.getRow().put("STATE", STATE);
		systemRoleService.update();
		return "redirect:RoleList.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		systemRoleService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	// =================================role fun
	
	@RequestMapping(value="/RoleFun")
	public String roleFun(ModelMap model)
	{
		model.addAttribute("roles", systemRoleService.findAll());
//		model.addAttribute("jsTreeData", systemFunService.getFunJsTree("-1", "权限树", "checkbox", "js_node_permission", systemFunService.findAll()));
		return "/system/role/RoleFun";
	}
	
	@RequestMapping(value = "/FunJsTree")
	public @ResponseBody
	ResponseVO funJsTree(String default_up_id,String tree_name,String show_type,String selector_id) {
		ResponseVO ovo =new ResponseVO();
		String jsTreeData= systemFunService.getFunJsTree("-1", "权限树", "checkbox", "js_node_permission", systemFunService.findAll());
		ovo.put("treeData", jsTreeData);
		return ovo;
	}
	
	@RequestMapping(value="/SelectRoleFun")
	public String selectRoleFun(String role_id,ModelMap model)
	{
		model.addAttribute("funs", systemFunService.getSortedFuns(systemFunService.findAll()));
		if(role_id == null || role_id.replace(" ", "").length() == 0)
		{
			model.addAttribute("role_funs", systemFunService.getSortedFuns(null));
		}
		else
		{
			model.addAttribute("role_funs", systemFunService.getSortedFuns(systemFunService.getFunByRoleId(role_id)));
		}
		return "/system/role/SelectRoleFun";
	}
	
	@RequestMapping(value = "/FunsOfSelectedRole")
	public @ResponseBody
	DataSet  getFunByRoleId(String role_id) {
		Assert.notNull(role_id, "role id can not be null");
		DataSet ds=null;
		ds=systemFunService.getFunByRoleId(role_id);
		return ds;
	}
	
	@RequestMapping(value="/SaveRoleFun")
	public @ResponseBody ResponseVO saveRoleFuns(String role_id,String fun_id)
	{
		ResponseVO ovo =new ResponseVO();
		Assert.notNull(role_id, "角色编号不能为空！");
		Assert.notNull(fun_id, "权限编号不能为空！");
		System.out.println("role_id=============="+role_id);
		System.out.println("fun_id=============="+fun_id);
		int num =systemFunService.saveRoleFuns(role_id,fun_id);
		ovo.put("num", num);
		return ovo;
	}
}
