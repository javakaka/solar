package com.ezcloud.framework.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.service.system.SystemFun;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.vo.Row;

@Controller("frameworkSystemFunController")
@RequestMapping("/system/fun")
public class SystemFunController {

	@Resource(name = "frameworkSystemFunService")
	private SystemFun systemFunService;

	@RequestMapping("/Fun")
	public String getSysFunXTree(ModelMap model) {
		model.addAttribute("treeData", systemFunService.getFunXTree());
		return "/system/fun/Fun";
	}

	@RequestMapping("/FunInclude")
	public String getSysFunInclude(String fun_id, ModelMap model) {
		systemFunService.getRow().clear();
		if (fun_id != null) {
			systemFunService.getRow().put("fun_id", fun_id);
		}
		model.addAttribute("ovo", systemFunService.getFunInclude());
		return "/system/fun/FunInclude";
	}

	@RequestMapping("/FunEdit")
	public @ResponseBody
	Row editSysFun(String fun_id) {
		Row row = new Row();
//		System.out.println("fun_id========>>" + fun_id);
		systemFunService.getRow().clear();
		if (fun_id != null) {
			systemFunService.getRow().put("fun_id", fun_id);
			row = systemFunService.edit();
		}
//		System.out.println("row==========>>" + row);
		return row;
	}
	
	@RequestMapping(value = "/FunSave")
	public @ResponseBody ResponseVO saveSysFun(String f_id,String f_up_id, String level_index, String f_name, String f_ename, String f_win_id, String f_win_target ,String f_ico_name, String f_desc)
	{
		String response="";
		Row fun =new Row();
		if(f_id != null && f_id.replace(" ", "").length()>0)
		{
			fun.put("FUN_ID", f_id);
		}
		if(f_up_id != null && f_up_id.replace(" ", "").length()>0)
		{
			fun.put("UP_FUN_ID", f_up_id);
		}
		if(level_index != null && level_index.replace(" ", "").length()>0)
		{
			fun.put("LEVEL_INDEX",level_index );
		}
		if(f_name != null && f_name.replace(" ", "").length()>0)
		{
			fun.put("FUN_NAME", f_name);
		}
		if(f_ename != null && f_ename.replace(" ", "").length()>0)
		{
			fun.put("FUN_ENAME", f_ename);
		}
		if(f_win_id != null && f_win_id.replace(" ", "").length()>0)
		{
			fun.put("WIN_ID", f_win_id);
		}
		if(f_ico_name != null && f_ico_name.replace(" ", "").length()>0)
		{
			fun.put("ICO_NAME", f_ico_name);
		}
		if(f_desc != null && f_desc.replace(" ", "").length()>0)
		{
			fun.put("FUN_DESC",f_desc );
		}
		response=systemFunService.save(fun);
		ResponseVO ovo =new ResponseVO();
		ovo.put("fun_id", response);
		return ovo;
	}
	
	@RequestMapping(value = "/FunDelete")
	public @ResponseBody int  deleteFun(String fun_id)
	{
		int rowNum =0;
		Assert.notNull(fun_id, "id不能为空!");
		systemFunService.getRow().put("fun_id", fun_id);
		rowNum=systemFunService.delete();
		return rowNum;
	}
}