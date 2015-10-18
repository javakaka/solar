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
  <title>出价记录</title>
  <meta name="description" content="出价记录" />
  <meta name="keywords" content="出价记录" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="出价记录">
  <meta name="apple-mobile-web-app-title" content="出价记录" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style>
  html,body {
  	height: 100%;
  }
  </style>
 </head>
 <body >
  <div id="main" class="wrapper white">
	  <div class="price-thead-tr" id="" name="" >
		<div class="th t1">状态</div>
		<div class="th t2">竞拍号</div>
		<div class="th t3">价格</div>
		<div class="th t4">时间</div>
	  </div>
  <div id="wrapper">
	  <div id="scroller">
		  	<div id="pullDown" class="idle">
				<span class="pullDownIcon"></span>
				<span class="pullDownLabel">下拉更新...</span>
			</div>
			<div  id="item_list" >
			<!--
				  <div class="price-tbody-tr price-record-success" id="" name="" >
					<div class="td t1">成交</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr price-record-ahead" id="" name="" >
					<div class="td t1">领先</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  <div class="price-tbody-tr" id="" name="" >
					<div class="td t1">出局</div>
					<div class="td t2">1**6</div>
					<div class="td t3">¥15000</div>
					<div class="td t4">2015-07-28 15:30:23</div>
				  </div>
				  -->
			  </div>
			<div id="pullUp" class="idle">
				<span class="pullUpIcon"></span>
				<span class="pullUpLabel">上拉更新...</span>
			</div>
		</div>
	</div>
  </div>
   <script>
 var BasePath ="<%=basePath%>";
 </script>
 <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/iscroll.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-price-record.js"></script>
 </body>

</html>