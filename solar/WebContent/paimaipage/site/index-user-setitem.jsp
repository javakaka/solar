<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String from_user =request.getParameter("from_user");
if(from_user == null || from_user.replace(" ", "").length() == 0)
{
	from_user ="";
}
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>设置</title>
  <meta name="description" content="设置" />
  <meta name="keywords" content="设置" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="设置">
  <meta name="apple-mobile-web-app-title" content="设置" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style type="text/css">body{background:white;}</style>
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<a href="index-user-profile.do?from_user=<%=from_user %>">
  	<div class="user-setitem-col">
  		<div class="left">完善个人信息</div>
  		<div class="right"></div>
  	</div>
  	</a>
  	<a href="index-user-remind-setting.jsp">
  	<div class="user-setitem-col">
  		<div class="left">消息提醒设置</div>
  		<div class="right"></div>
  	</div>
  	</a>
  	<a href="about.jsp">
  	<div class="user-setitem-col">
  		<div class="left">关于拍卖</div>
  		<div class="right"></div>
  	</div>
  	</a>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-user-setitem.js"></script>
 </body>
 <script>
 </script>
</html>