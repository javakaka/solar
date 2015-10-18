package com.ezcloud.framework.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.ezcloud.framework.util.DateEditor;
import com.ezcloud.framework.util.SpringUtils;
import com.ezcloud.framework.vo.IVO;
import com.ezcloud.framework.vo.OVO;

/**
 * 接口Cotroller基类
 * @author Thinkive.TongJianbo
 *
 */
public class ApiBaseController {
	protected IVO ivo ;
	protected OVO ovo;
	
	public IVO getIvo() {
		return ivo;
	}

	public void setIvo(IVO ivo) {
		this.ivo = ivo;
	}

	public OVO getOvo() {
		return ovo;
	}

	public void setOvo(OVO ovo) {
		this.ovo = ovo;
	}

	public ApiBaseController() {
		super();
		ovo =new OVO();
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
	
	public void parseRequest(HttpServletRequest request)
	{
		ivo =(IVO)request.getAttribute("ivo");
		if(ivo == null )
		{
			ivo = new IVO();
		}
	}
}
