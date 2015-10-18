package com.solar.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.controller.BaseController;
import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.util.MapUtils;
import com.ezcloud.framework.util.Md5Util;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.DateUtil;
import com.solar.service.UserService;

@Controller("solarPlatformUserController")
@RequestMapping("/solarpage/platform/member/profile")
public class UserContrller  extends BaseController{

	@Resource(name = "solarUserService")
	private UserService userService;
	
	
	/**
	 * 分页查询用户
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(Pageable pageable, ModelMap model) {
		userService.getRow().put("pageable", pageable);
		Page page = userService.queryPage();
		model.addAttribute("page", page);
		userService.getRow().clear();
		return "/solarpage/platform/member/profile/list";
	}
	
	/**
	 * 查询最近注册的5个用户
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/LatestUserList")
	public String queryLatestUserList(Pageable pageable, ModelMap model) {
		userService.getRow().put("pageable", pageable);
		DataSet data = userService.queryLatestTop5Users();
		model.addAttribute("data", data);
		userService.getRow().clear();
		return "/solarpage/platform/webpart/LatestUserList";
	}
	
	/**
	 * 分页查询
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/SelectUser")
	public String selectUserList(String id,Pageable pageable, ModelMap model) {
		userService.getRow().put("pageable", pageable);
		Page page = userService.queryPage();
		model.addAttribute("page", page);
		if(StringUtils.isEmptyOrNull(id))
		{
			id ="";
		}
		model.addAttribute("id", id);
		userService.getRow().clear();
		return "/solarpage/platform/member/profile/SelectUser";
	}

	@RequestMapping(value = "/add")
	public String add(ModelMap model) {
		return "/solarpage/platform/member/profile/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row userRow =MapUtils.convertMaptoRowWithoutNullField(map);
		String telephone =userRow.getString("telephone","");
		if(StringUtils.isEmptyOrNull(telephone))
		{
			addFlashMessage(redirectAttributes, Message.error("手机号码不能为空"));
			return "redirect:add.do";
		}
		String password =userRow.getString("password","");
		if(StringUtils.isEmptyOrNull(password))
		{
			addFlashMessage(redirectAttributes, Message.error("密码不能为空"));
			return "redirect:add.do";
		}
		userRow.put("password", Md5Util.Md5(password));
		userRow.put("register_time", DateUtil.getCurrentDateTime());
		userService.insert(userRow);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/edit")
	public String edit(Long id, ModelMap model) throws Exception {
		Assert.notNull(id);
		Row userRow =userService.find(String.valueOf(id));
		model.addAttribute("row", userRow);
		return "/solarpage/platform/member/profile/edit";
	}

	@RequestMapping(value = "/update")
	public String update(@RequestParam HashMap<String,String> map,RedirectAttributes redirectAttributes) throws Exception {
		Row userRow=MapUtils.convertMaptoRowWithoutNullField(map);
		userService.update(userRow);
		addFlashMessage(redirectAttributes,SUCCESS_MESSAGE);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/delete")
	public @ResponseBody
	Message delete(Long[] ids) {
		userService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	
	@RequestMapping(value = "/resetPassword")
	public @ResponseBody
	Message resetPassword(String id) {
		userService.resetPassword(id);
		return SUCCESS_MESSAGE;
	}
	
	
	/**
	 * 检查手机号码是否已存在
	 */
	@RequestMapping(value = "/check_telephone", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkTelephone(String TELEPHONE) {
		if(StringUtils.isEmptyOrNull(TELEPHONE))
		{
			return false;
		}
		return (userService.isTelephoneExisted(TELEPHONE));
	}
	
	/**
	 * 检查用户名是否已存在
	 */
	@RequestMapping(value = "/check_user_name", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUserName(String USERNAME) {
		if(StringUtils.isEmptyOrNull(USERNAME))
		{
			return false;
		}
		return (userService.isUserNameExisted(USERNAME));
	}
	
	/**
	 * 检查用户名是否已存在
	 */
	@RequestMapping(value = "/check_extra_user_name")
	public @ResponseBody
	boolean checkExtraUserName(String ID,String USERNAME) {
		if(StringUtils.isEmptyOrNull(USERNAME))
		{
			return false;
		}
		if(StringUtils.isEmptyOrNull(ID))
		{
			return false;
		}
		return false;//(userService.isExtraUserNameExisted(ID,USERNAME));
	}
	/**
	 * 检查邮箱是否已存在
	 */
//	@RequestMapping(value = "/check_email", method = RequestMethod.GET)
//	public @ResponseBody
//	boolean checkEmail(String EMAIL) {
//		if(StringUtils.isEmptyOrNull(EMAIL))
//		{
//			return false;
//		}
//		return (userService.isEmailExisted(EMAIL));
//	}
	/**
	 * 检查邀请码是否存在
	 */
//	@RequestMapping(value = "/check_invite_code", method = RequestMethod.GET)
//	public @ResponseBody
//	boolean checkInviteCode(String INVITE_CODE) {
//		if(StringUtils.isEmptyOrNull(INVITE_CODE))
//		{
//			return false;
//		}
//		return (userService.isInviteCodeExisted(INVITE_CODE));
//	}
	
	/**
	 * 检查邮箱是否已存在
	 */
//	@RequestMapping(value = "/check_extra_email")
//	public @ResponseBody
//	boolean checkExtraEmail(String ID,String EMAIL) {
//		if(StringUtils.isEmptyOrNull(EMAIL))
//		{
//			return false;
//		}
//		if(StringUtils.isEmptyOrNull(ID))
//		{
//			return false;
//		}
//		return (userService.isExtraEmailExisted(ID,EMAIL));
//	}
	
	/**
	 * 检查身份证号码是否已存在
	 */
	@RequestMapping(value = "/check_id_card_no", method = RequestMethod.GET)
	public @ResponseBody
	boolean check_id_card_no(String ID_CARD_NO) {
		if(StringUtils.isEmptyOrNull(ID_CARD_NO))
		{
			return false;
		}
		return false;//(userService.isIdCardNoExisted(ID_CARD_NO));
	}
	
	/**
	 * 检查身份证号码是否已存在
	 */
	@RequestMapping(value = "/check_extra_id_card_no")
	public @ResponseBody
	boolean check_extra_id_card_no(String ID, String ID_CARD_NO) {
	if(StringUtils.isEmptyOrNull(ID_CARD_NO))
	{
		return false;
	}
	if(StringUtils.isEmptyOrNull(ID))
	{
		return false;
	}
	return false;//(userService.isExtraIdCardNoExisted(ID,ID_CARD_NO));
	}
	
}
