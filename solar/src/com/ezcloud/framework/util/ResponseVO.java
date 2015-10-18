package com.ezcloud.framework.util;

import com.ezcloud.framework.vo.Row;

public class ResponseVO {

	//响应状态码
	public int code;
	//提示信息
	public String msg;
	//异常信息提示
	public String exp;
	//响应数据
	public Row oForm;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public Row getoForm() {
		return oForm;
	}
	public void setoForm(Row oForm) {
		this.oForm = oForm;
	}
	
	public void put(String key,Object obj)
	{
		this.oForm.put(key, obj);
	}
	public ResponseVO(int code, String msg, String exp, Row oForm) {
		super();
		this.code = code;
		this.msg = msg;
		this.exp = exp;
		this.oForm = oForm;
	}
	public ResponseVO(int code, String msg, String exp) {
		super();
		this.code = code;
		this.msg = msg;
		this.exp = exp;
		oForm=new Row();
	}
	public ResponseVO(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
		exp="";
		oForm=new Row();
	}
	public ResponseVO(int code) {
		super();
		this.code = code;
		msg="";
		exp="";
		oForm=new Row();
	}
	public ResponseVO() {
		super();
		code=0;
		msg="";
		exp="";
		oForm=new Row();
	}
	
	
}
