package com.ezcloud.framework.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.ezcloud.framework.util.SpringUtils;

/**
 * springjdbc 自定义国际化标签
 * 
 * @ClassName: Message
 * @author ez-cloud work group
 * @date 2014-7-16 下午03:30:30
 */
public class Message extends TagSupport {

	private static final long serialVersionUID = 3189386344265074227L;
	private String key;
	private String args;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getArgs() {
		return args;
	}

	public void setArgs(String args) {
		this.args = args;
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			if (key == null) {
				out.println("");
				return SKIP_BODY;
			}
			out.println(SpringUtils.getMessage(key, args));
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
	}
}