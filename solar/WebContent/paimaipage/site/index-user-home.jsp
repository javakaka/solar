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
  <title>用户主页</title>
  <meta name="description" content="用户主页" />
  <meta name="keywords" content="用户主页" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="用户主页">
  <meta name="apple-mobile-web-app-title" content="用户主页" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<div class="user-home-top">
  		<div class="setting">
  			<a href="index-user-setitem.jsp?from_user=<%=from_user%>"><div class="setting-icon" id="setting_btn"></div></a>
  		</div>
  		<div class="avatar">
	  		<div class="circle">
	  			<img class="circle-inline" src="<%=basePath%>common/images/default_avatar.jpg"></img>
	  		</div>
  		</div>
  		<div class="username">
	  		<div class="label">刘德华</div>
  		</div>
  		<div class="page-tab">
  			<div class="label">
  				<div class="block-txt txt-right">我的参拍</div>
  				<div class="block-line">｜</div>
  				<div class="block-txt txt-left">在线送拍</div>
  			</div>
  		</div>
  	</div>
  	<div class="user-home-col">
  		<div class="up">参拍的</div>
  		<div class="down">
  			<div class="block">开拍<span id="begin_num">0</span></div>
  			<div class="block">快结束<span id="over_soon_num">0</span></div>
  			<div class="block">待出价<span id="_num">0</span></div>
  		</div>
  	</div>
  	<div class="user-home-col">
  		<div class="up">已拍下</div>
  		<div class="down">
  			<div class="block">待付款<span id="prepare_pay_num">0</span></div>
  			<div class="block">待发货<span id="prepare_send_num">0</span></div>
  			<div class="block">待收货<span id="prepare_receive_num">0</span></div>
  		</div>
  	</div>
  	<div class="user-home-col">
  		<div class="single">已结束</div>
  	</div>
  	<div class="user-home-col">
  		<div class="up">我的提醒</div>
  		<div class="down">
  			<div class="block">开始<span id="remind_begin_num">0</span></div>
  			<div class="block">快结束<span id="remind_over_num">0</span></div>
  		</div>
  	</div>
  	<div class="user-home-col">
  		<div class="up">保证金</div>
  		<div class="down">
  			<div class="block">已退还<span id="money_return_num">0</span></div>
  			<div class="block">已扣除<span id="money_minus_num">0</span></div>
  		</div>
  	</div>
  	<div class="user-home-col">
  		<div class="single">已结束</div>
  	</div>
  	<jsp:include page="footer.jsp" />
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-user-home.js"></script>
 </body>
 <script>
 </script>
</html>