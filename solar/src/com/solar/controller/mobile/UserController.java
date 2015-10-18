package com.solar.controller.mobile;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.common.Setting;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.SettingUtils;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.vo.VOConvert;
import com.ezcloud.utility.Base64Util;
import com.ezcloud.utility.DateUtil;
import com.ezcloud.utility.FileUtil;
import com.solar.service.UserService;

@Controller("solarMobileUserController")
@RequestMapping("/api/user")
public class UserController extends BaseController {
	
	private static Logger logger = Logger.getLogger(UserController.class); 
	
	@Resource(name = "solarUserService")
	private UserService userService;
	
	
	/**
	 * 登录
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/login")
	public @ResponseBody
	String  login(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		String username =ivo.getString("username",null);
		if(username == null || username.replace(" ","").length() ==0)
		{
			ovo =new OVO(-1001, "请求参数错误", "用户名不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String password =ivo.getString("password",null);
		if(password == null || password.replace(" ","").length() ==0)
		{
			ovo =new OVO(-1001, "请求参数错误", "密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		Row userRow =userService.login(username);
		if(userRow == null )
		{
			ovo =new OVO(-1001, "登录失败", "用户不存在");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String dbPassword =userRow.getString("password","");
		if( dbPassword.length()>0 && dbPassword.equals(password) )
		{
			String id=userRow.getString("id");
			String name=userRow.getString("name","");
			String user_name=userRow.getString("username","");
			String telephone=userRow.getString("telephone","");
			String email=userRow.getString("email","");
			String register_time=userRow.getString("register_time","");
			String avatar =userRow.getString("avatar","");
			ovo =new OVO(0, "登录成功", "");
			ovo.set("id", id);
			ovo.set("username", user_name);
			ovo.set("name", name);
			ovo.set("telephone", telephone);
			ovo.set("email", email);
			ovo.set("register_time", register_time);
			if(! StringUtils.isEmptyOrNull(avatar))
			{
				Setting setting =SettingUtils.get();
				String site_url =setting.getSiteUrl();
				avatar =site_url+"/"+avatar;
			}
			ovo.set("avatar", avatar);
		}
		else
		{
			ovo =new OVO(-1002, "登录失败,密码错误", "登录失败,密码错误");
		}
		logger.info("登录成功");
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/changePassword")
	public @ResponseBody
	String changePassword(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		String user_id =ivo.getString("user_id",null);
		String oldPwd =ivo.getString("oldPwd",null);
		String newPwd =ivo.getString("newPwd",null);
		if(user_id == null || user_id.replace(" ", "").length() ==0){
			ovo =new OVO(-10005,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		if(oldPwd == null || oldPwd.replace(" ", "").length() ==0){
			ovo =new OVO(-10006,"原密码不能为空","原密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		if(newPwd == null || newPwd.replace(" ", "").length() ==0){
			ovo =new OVO(-10007,"新密码不能为空","新密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		if(oldPwd.equals(newPwd))
		{
			ovo =new OVO(-10008,"新密码不能和旧密码相同","新密码不能和旧密码相同");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		int status =userService.changePassword(user_id, oldPwd, newPwd);
		if(status == 1)
		{
			ovo =new OVO(-10002,"用户不存在","用户不存在");
		}
		else if(status == 2)
		{
			ovo =new OVO(-10002,"原密码错误","原密码错误");
		}
		else if(status == 3)
		{
			ovo =new OVO(-10002,"修改密码失败","修改密码失败");
		}
		else
		{
			ovo =new OVO(0,"操作成功","");
		}
		String json =AesUtil.encode(VOConvert.ovoToJson(ovo));
		return json;
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/register")
	public @ResponseBody
	String register(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		Row insertRow =new Row();
		/**手机号码 必填 **/
		String telephone =ivo.getString("telephone",null);
		if(StringUtils.isEmptyOrNull(telephone))
		{
			ovo =new OVO(-10010,"手机号码不能为空","手机号码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		if(! StringUtils.isTelphone(telephone))
		{
			ovo =new OVO(-10010,"手机号码不正确","手机号码不正确");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		Row staff =userService.findByTelephone(telephone);
		if(staff != null)
		{
			ovo =new OVO(-10010,"手机号码已被注册","手机号码已被注册");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		insertRow.put("telephone", telephone);
		/**用户名 必填 **/
		String username =ivo.getString("username",null);
		if(StringUtils.isEmptyOrNull(username))
		{
			ovo =new OVO(-10010,"用户名不能为空","用户名不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		staff =userService.findByUserName(username);
		if(staff != null)
		{
			ovo =new OVO(-10010,"用户名已被注册","用户名已被注册");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		insertRow.put("username", username);
		/**密码 必填 **/
		String password =ivo.getString("password",null);
		if(StringUtils.isEmptyOrNull(password))
		{
			ovo =new OVO(-10010,"密码不能为空","密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		insertRow.put("password", password);
		String email =ivo.getString("email","");
		if(! StringUtils.isEmptyOrNull(email))
		{
			staff =userService.findByEmail(email);
			if(staff != null)
			{
				ovo =new OVO(-10010,"邮箱已被注册","邮箱已被注册");
				return AesUtil.encode(VOConvert.ovoToJson(ovo));
			}
		}
		insertRow.put("email", email);
		String company =ivo.getString("company","");
		insertRow.put("company", company);
		
		/**注册时间 取服务器时间 **/
		String register_time =DateUtil.getCurrentDateTime();
		insertRow.put("CreateTime", register_time);
		insertRow.put("status", "1");
		insertRow.put("ActivateStatus", "1");
		int num =userService.insert(insertRow);
		if(num > 0)
		{
			ovo =new OVO(0,"注册成功","");
			Row userRow =userService.findByTelephone(telephone);
			if(userRow == null )
			{
				ovo =new OVO(-1001, "登录失败", "用户不存在");
				return AesUtil.encode(VOConvert.ovoToJson(ovo));
			}
			String id=userRow.getString("id");
			telephone=userRow.getString("telephone","");
			username=userRow.getString("username","");
			register_time=userRow.getString("register_time","");
			String avatar=userRow.getString("avatar","");
			ovo.set("id", id);
			ovo.set("telephone", telephone);
			ovo.set("username", username);
			ovo.set("email", email);
			ovo.set("name", "");
			ovo.set("register_time", register_time);
			ovo.set("avatar", avatar);
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		else
		{
			ovo =new OVO(-10010,"注册失败","注册失败");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
	}
	
	/**
	 * 根据用户id查询用户信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/profile")
	public @ResponseBody
	String queryProfile(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		Row userRow =null;
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-10010,"用户编号不能为空","");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		userRow =userService.find(id);
		if(userRow == null)
		{
			ovo =new OVO(-10010,"用户不存在","");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		
		String name=userRow.getString("name","");
		String username=userRow.getString("username","");
		String telephone=userRow.getString("telephone","");
		String email=userRow.getString("email","");
		String register_time=userRow.getString("createtime","");
		String avatar=userRow.getString("avatar","");
		if(! StringUtils.isEmptyOrNull(avatar))
		{
			Setting setting =SettingUtils.get();
			String site_url =setting.getSiteUrl();
			avatar =site_url+"/"+avatar;
		}
		else
		{
			avatar ="";
		}
		ovo =new OVO(0, "查询成功", "");
		ovo.set("id", id);
		ovo.set("username", username);
		ovo.set("telephone", telephone);
		ovo.set("name", name);
		ovo.set("email", email);
		ovo.set("register_time", register_time);
		ovo.set("avatar", avatar);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/updateProfile")
	public @ResponseBody
	String updateProfile(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		Row userRow =null;
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-10010,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		userRow =userService.find(id);
		if(userRow == null)
		{
			ovo =new OVO(-10010,"用户不存在","用户不存在");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		userRow =new Row();
		userRow.put("id", id);
		String name =ivo.getString("name",null);
		if(!StringUtils.isEmptyOrNull(name))
		{
			userRow.put("name", name);
		}
		//验证唯一性
		String email =ivo.getString("email",null);
		boolean email_existed=false;
		if(!StringUtils.isEmptyOrNull(email))
		{
			email_existed =userService.isEmailExisted(id,email);
			if(email_existed)
			{
				ovo =new OVO(-10010,"此邮箱已被其他用户绑定，请使用其他邮箱","此邮箱已被其他用户绑定，请使用其他邮箱");
				return AesUtil.encode(VOConvert.ovoToJson(ovo));
			}
			userRow.put("email", email);
		}
		//验证唯一性
		String username =ivo.getString("username",null);
		boolean username_existed=false;
		if(!StringUtils.isEmptyOrNull(username))
		{
			username_existed =userService.isUsernameExisted(id,username);
			if(username_existed)
			{
				ovo =new OVO(-10010,"此用户名已存在，请使用其他用户名","");
				return AesUtil.encode(VOConvert.ovoToJson(ovo));
			}
			userRow.put("username", username);
		}
		int rowNum =userService.update(userRow);
		if(rowNum ==0)
		{
			ovo =new OVO(-10010, "操作失败", "操作失败");
		}
		else
		{
			ovo =new OVO(0, "操作成功", "操作成功");
		}
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 找回密码
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/resetPassword")
	public @ResponseBody
	String resetPasswordBySms(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		String telephone =ivo.getString("telephone",null);
		if(StringUtils.isEmptyOrNull(telephone))
		{
			ovo =new OVO(-10010,"手机号码不能为空","手机号码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String password =ivo.getString("password",null);
		if(StringUtils.isEmptyOrNull(telephone))
		{
			ovo =new OVO(-10010,"密码不能为空","密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		//验证手机号码是否正确
		Row userRow =userService.findByTelephone(telephone);
		if(userRow == null)
		{
			ovo =new OVO(-10010,"用户不存在","非法用户");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String sms_code =ivo.getString("sms_code",null);
		if(StringUtils.isEmptyOrNull(sms_code))
		{
			ovo =new OVO(-10010,"短信验证码不能为空","短信验证码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String id =userRow.getString("id","");
		//更新密码
		Row pwdRow =new Row();
		pwdRow.put("password", password);
		pwdRow.put("id", id);
		int rowNum =userService.update(pwdRow);
		if(rowNum >0)
		{
			ovo =new OVO(0,"操作成功","");
		}
		else
		{
			ovo =new OVO(-10010,"操作失败","操作失败");
		}
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 更改手机号码
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/changeTelephone")
	public @ResponseBody
	String changeTelephone(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		//用户ID
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-1,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String telephone =ivo.getString("telephone",null);
		if(StringUtils.isEmptyOrNull(telephone))
		{
			ovo =new OVO(-1,"手机号码不能为空","手机号码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String sms_code =ivo.getString("sms_code","");
		if(StringUtils.isEmptyOrNull(sms_code))
		{
			ovo =new OVO(-1,"短信验证码不能为空","短信验证码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		Row userRow =new Row();
		userRow.put("id", id);
		userRow.put("telephone", telephone);
		int num =userService.update(userRow);
		if(num <=0)
		{
			ovo =new OVO(-1,"操作失败,请检查相关参数是否正确","操作失败,请检查相关参数是否正确");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		ovo =new OVO(0,"操作成功","操作成功");
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 设置支付密码
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/setPayPassword")
	public @ResponseBody
	String setPayPassword(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		//用户ID
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-1,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		String pay_password =ivo.getString("pay_password",null);
		if(StringUtils.isEmptyOrNull(pay_password))
		{
			ovo =new OVO(-1,"支付密码不能为空","支付密码不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		Row userRow =new Row();
		userRow.put("id", id);
		userRow.put("pay_password", pay_password);
		int num =userService.update(userRow);
		if(num <=0)
		{
			ovo =new OVO(-1,"操作失败,请检查相关参数是否正确","操作失败,请检查相关参数是否正确");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		ovo =new OVO(0,"操作成功","操作成功");
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * logout
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/logout")
	public @ResponseBody
	String logout(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		//用户ID
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-1,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		ovo =new OVO(0,"操作成功","操作成功");
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	/**
	 * 上传头像，统一用base64上传，图片格式为png，且上传之前要压缩图片，使图片小于100K
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/upload_avatar")
	public @ResponseBody
	String upload_avatar(HttpServletRequest request) throws Exception
	{
		parseRequest(request);
		//用户ID
		String id =ivo.getString("id",null);
		if(StringUtils.isEmptyOrNull(id))
		{
			ovo =new OVO(-1,"用户编号不能为空","用户编号不能为空");
			return AesUtil.encode(VOConvert.ovoToJson(ovo));
		}
		//base64 编码图片
		Setting setting =SettingUtils.get();
		String file_path =setting.getPhysicalPath();
		String avatar_uri ="";
		String userPic2 =ivo.getString("picture_base64_str",null);
		String userPic = new String(Base64Util.decode(userPic2));
		String imgPath ="";
		String imgName =id;
		if(userPic != null && !userPic.trim().equals(""))
		{
			String basePath =file_path+"/resources"+"/solar_user_icon/";
			File file =new File(basePath);
			if(! file.isDirectory())
			{
				FileUtil.mkdir(basePath);
			}
			String timestamp =DateUtil.getCurrentDateTime().replace(" ", "").replace(":", "").replace("-", "");
			imgPath=basePath+"/"+imgName+"-"+timestamp+".png";
			avatar_uri ="/resources"+"/solar_user_icon"+"/"+imgName+"-"+timestamp+".png";
			imgPath =imgPath.replace("\\\\","\\");
			imgPath =imgPath.replace("\\","/");
			Base64Util.GenerateImage(userPic, imgPath);
		}
		Row row =new Row();
		row.put("id", id);
		row.put("avatar", avatar_uri);
		userService.update(row);
		ovo =new OVO(0,"上传头像成功","上传头像成功");
		String site_url =setting.getSiteUrl();
		String avatar_url =site_url+avatar_uri;
		ovo.set("avatar_url", avatar_url);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
}