<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微信管理平台</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 1px;
	margin-right: 0px;
	margin-bottom: 0px;
	/*background:url(<%=basePath%>res/images/welcome.gif);*/
}
html { overflow-x: ; overflow-y: ; border:0;} 
-->
</style>
</head>
<body background="<%=basePath %>main/desktop/res/bg_01.gif">
	<div style="width:100%;z-index:1;position:absolute;top:0px;bottom:40px;"></div>
	<div style="width:100%;height:40px;position:absolute;margin-top:0px;bottom:0px;z-index:2;position:absolute;background:rgb(239, 247, 255);color:#488bd1;font-size:12px;font-weight:bold;line-height:40px;text-align:center;">系统版本号：1.0  ; 服务器版本号：<%= application.getServerInfo() %></div>
</body>
</html>
