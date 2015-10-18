<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>提醒设置</title>
  <meta name="description" content="提醒设置" />
  <meta name="keywords" content="提醒设置" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="提醒设置">
  <meta name="apple-mobile-web-app-title" content="提醒设置" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body class="white">
 <input type="hidden" name="tel_selected" id="tel_selected" value="0" />
  <div id="main" class="wrapper white">
  	<div class="user-remind-setting-col">
  		<div class="left">提醒方式</div>
  	</div>
  	<div class="user-remind-setting-col">
  		<div class="left">手机短信</div>
  		<div class="right gray-icon" name="select_icon" id="tel_select_icon" ></div>
  	</div>
  	<div class="user-remind-setting-col">
  		<div class="left-short">手机号:</div>
  		<div class="right-long">
  			<input type="text" name="telephone" id="telephone" value="" />
  		</div>
  	</div>
  	<div class="user-remind-setting-col">
  		<div class="left">微信提醒</div>
  		<div class="right gray-icon" name="select_icon" id="wechat_select_icon"></div>
  	</div>
  	<div class="user-remind-setting-submit" id="submitBtn">提交</div>
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