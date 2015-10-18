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
  <title>提醒方式</title>
  <meta name="description" content="提醒方式" />
  <meta name="keywords" content="提醒方式" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="提醒方式">
  <meta name="apple-mobile-web-app-title" content="提醒方式" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  <input type="hidden" name="telephone_setting" id="telephone_setting" value="${set_telephone}" />
  <input type="hidden" name="wechat_setting" id="wechat_setting" value="${set_weixin}" />
  	<div id="scroller"  class="layer-wrapper" style="margin-top:5px;">
	  	  <div class="label-item">
	  	  	<div class="left">
		  	  	<span class="tap">手机短信</span>
	  	  	</div>
	  	  	<div class="right <c:choose> <c:when test="${set_telephone == 1 }">blue-icon</c:when><c:otherwise>gray-icon</c:otherwise></c:choose>" id="telephone_btn"></div>
	  	  </div>
	  	  <div class="label-item">
	  	  	<div class="left">
		  	  	<span class="tap">手机号码：</span>
		  	  	<span id="telephone">${telephone}</span>
	  	  	</div>
	  	  </div>
	  	  <div class="label-item">
	  	  <div class="left">
		  	  	<span class="tap">微信提醒</span>
	  	  	</div>
	  	  	<div class="right <c:choose> <c:when test="${set_weixin == 1 }">blue-icon</c:when><c:otherwise>gray-icon</c:otherwise></c:choose>"  id="wechat_btn"></div>
	  	  </div>
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
  <script type="text/javascript" src="<%=basePath%>common/js/index-clock-setting.js"></script>
 </body>
 <script>
 	var telephone ="${telephone}";
 </script>
</html>