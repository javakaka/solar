package com.ezcloud.framework.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezcloud.framework.common.DateEditor;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.util.SpringUtils;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.Row;

/**
 * Controller - 基类
 */
public class BaseController {

	/** 错误视图 */
	protected static final String ERROR_VIEW = "/includ/404";

	/** 错误消息 */
	protected static final Message ERROR_MESSAGE = Message.error("framework.message.error");
	/** 瞬时消息*/
	protected void addFlashMessage(RedirectAttributes redirectAttributes, Message message) {
		String type =message.getType().toString();
		String content =message.getContent();
		String flash_message_js  ="$.message(\""+type+"\",\""+content+"\");";
		redirectAttributes.addFlashAttribute("flash_message", flash_message_js);
	}
	/** 成功消息 */
	protected static final Message SUCCESS_MESSAGE = Message.success("framework.message.success");
	/** 封装请求参数 **/
	public Row ivo;
	/** 封装处理请求之后，返回的数据 **/
	public Row ovo;

	public Row getIvo() {
		return ivo;
	}

	public void setIvo(Row ivo) {
		this.ivo = ivo;
	}

	public Row getOvo() {
		return ovo;
	}

	public void setOvo(Row ovo) {
		this.ovo = ovo;
	}

	/**
	 * 数据绑定
	 * 
	 * @param binder
	 *            WebDataBinder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
		binder.registerCustomEditor(Date.class, new DateEditor(true));
	}

	/**
	 * get session
	 * @return
	 */
	protected HttpSession getSession()
	{
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
		return session;
	}
	
	/**
	 * 获取国际化消息
	 * 
	 * @param code
	 *            代码
	 * @param args
	 *            参数
	 * @return 国际化消息
	 */
	protected String message(String code, Object... args) {
		return SpringUtils.getMessage(code, args);
	}
}