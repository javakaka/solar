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
  <title>委托信息</title>
  <meta name="description" content="委托信息" />
  <meta name="keywords" content="委托信息" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="委托信息">
  <meta name="apple-mobile-web-app-title" content="委托信息" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  <input type="hidden" name="goods_id" id="goods_id" value="${goods.ID}" />
  <input type="hidden" name="guarentee_money" id="guarentee_money" value="${goods.GUARENTEE_MONEY}" />
  	<div class="intrust-summary">
  		您将委托竞拍 <span class="red">${goods.GOODS_NAME}</span> 
  	</div>
  	<div class="guarentee-address-title">
  		拍品保证金：<span >${goods.GUARENTEE_MONEY}</span>元
  	</div>
  	<div class="guarentee-address-title">
  		拍品期望金额：<input type="text" name="price" id="price" value="${entrust.DEAL_MONEY}" placeholder="请填写您期望的成交价"/>
  	</div>
  	<div class="intrust-remark">
  		<div class="left">备注：</div>
  		<div class="right">
  			<textarea id="remark" name="remark">${entrust.REMARK}</textarea>
  		</div>
  	</div>
  	<c:if test="${isEntrust == 0}">
  	<div class="guarentee-pay-submit" id="submitBtn">
  		<div class="button">确认支付</div>
  	</div>
  	</c:if>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-goods-intrust.js?v1.00"></script>
 </body>
 <script>
 	
 </script>
</html>