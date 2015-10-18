<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	session =request.getSession();
	String third_login =(String)session.getAttribute("third_login");
	String redirect_url =basePath+"login/Login.jsp";
	if(third_login != null && third_login.equals("cxhl_shop_admin"))
	{
		redirect_url =basePath+"login/ShopLogin.do";
	}
	request.getSession().removeAttribute("third_login");
	request.getSession().invalidate();
	response.sendRedirect(redirect_url);
%>