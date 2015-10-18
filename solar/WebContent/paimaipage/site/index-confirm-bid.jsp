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
String goods_id =request.getParameter("goods_id");
if(goods_id == null || goods_id.replace(" ", "").length() == 0)
{
	goods_id ="";
}
String price =request.getParameter("price");
if(price == null || price.replace(" ", "").length() == 0)
{
	price ="0";
}
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>确认出价</title>
  <meta name="description" content="确认出价" />
  <meta name="keywords" content="确认出价" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="确认出价">
  <meta name="apple-mobile-web-app-title" content="确认出价" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<div id="scroller"  class="layer-wrapper" style="margin-top:5px;">
	  	  <div class="label-div"><span class="tap">您提交的出价为:</span><span id="current_price"><%=price %></span></div>
		  <div class="button-div">
		  <button  id="closeBtn"  class="button" >取消</button>
		  <button id="submitBtn"  class="button" >确定</button>
		  </div>
	  </div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-confirm-bid.js"></script>
 </body>
 <script>
 	
 </script>
</html>