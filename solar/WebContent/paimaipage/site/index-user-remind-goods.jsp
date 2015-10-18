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
  <title>我的提醒</title>
  <meta name="description" content="我的提醒" />
  <meta name="keywords" content="我的提醒" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="我的提醒">
  <meta name="apple-mobile-web-app-title" content="我的提醒" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body class="white">
  	<div class="user-remind-top">
	  	<div class="block selected">拍品提醒</div>
	  	<div class="block">专场提醒</div>
  	</div>
  <div id="main" class="wrapper white">
  	<div class="user-remind-goods-item">
	  	<div class="up">
		  	<div class="left">
		  		<img src="<%=basePath%>common/images/goods_icon.jpg" />
		  	</div>
	  		<div class="right">
	  			<div class="title">
	  				飘花手镯飘花手镯飘花手镯飘花手镯飘花手
	  			</div>
	  			<div class="price">
	  				<span id="price_id" class="grays">当前价：</span><span id="price_id" class="red">¥6.61万</span>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="down">
	  		<span id="price_total">7月1日 22:00 </span>结束 <a><span class="delete">删除</span></a>
	  	</div>
  	</div>
  	<div class="user-remind-goods-item">
	  	<div class="up">
		  	<div class="left">
		  		<img src="<%=basePath%>common/images/goods_icon.jpg" />
		  	</div>
	  		<div class="right">
	  			<div class="title">
	  				飘花手镯飘花手镯飘花手镯飘花手镯飘花手
	  			</div>
	  			<div class="price">
	  				<span id="price_id" class="grays">当前价：</span><span id="price_id" class="red">¥6.61万</span>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="down">
	  		<span id="price_total">7月1日 22:00 </span>结束 <a><span class="delete">删除</span></a>
	  	</div>
  	</div>
  	<div class="user-remind-goods-item">
	  	<div class="up">
		  	<div class="left">
		  		<img src="<%=basePath%>common/images/goods_icon.jpg" />
		  	</div>
	  		<div class="right">
	  			<div class="title">
	  				飘花手镯飘花手镯飘花手镯飘花手镯飘花手
	  			</div>
	  			<div class="price">
	  				<span id="price_id" class="grays">当前价：</span><span id="price_id" class="red">¥6.61万</span>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="down">
	  		<span id="price_total">7月1日 22:00 </span>结束 <a><span class="delete">删除</span></a>
	  	</div>
  	</div>
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