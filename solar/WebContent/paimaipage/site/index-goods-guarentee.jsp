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
  <title>报名交保证金</title>
  <meta name="description" content="报名交保证金" />
  <meta name="keywords" content="报名交保证金" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="报名交保证金">
  <meta name="apple-mobile-web-app-title" content="报名交保证金" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<input type="hidden" name="pay_type_value" id="pay_type_value" value="" />
  	<div class="guarentee-summary">
  		您将报名参加 <span class="red">${goods.GOODS_NAME}</span> 的拍卖，需提交<span class="red">¥</span> <span class="red">${goods.GUARENTEE_MONEY}</span>元作为拍卖保证金。
  	</div>
  	<div class="guarentee-address-title">
  		为保证竞拍成功后拍品顺利送达，请确认您的收货地址
  	</div>
  	<div class="guarentee-address">
	  	<div class="left">
	  		<div class="up">${user_row.USERNAME} ${user_row.TELEPHONE}</div>
	  		<div class="down">${user_row.ADDRESS}</div>
	  	</div>
	  	<div class="right"></div>
  	</div>
  	<div class="guarentee-pay-label">支付方式</div>
  	<div class="guarentee-pay-list">
  		<div class="item">
  			<div class="brand">
  				<div class="wechat"></div>
  			</div>
  			<div class="brand-label">微信支付</div>
  			<div class="choose-icon" name="pay_type" data-num="1" ></div>
  		</div>
  		<div class="item">
  			<div class="brand">
  				<div class="ali-fast"></div>
  			</div>
  			<div class="brand-label">支付宝快捷支付</div>
  			<div class="choose-icon" name="pay_type" data-num="2" ></div>
  		</div>
  		<div class="item">
  			<div class="brand">
  				<div class="ali-card"></div>
  			</div>
  			<div class="brand-label">支付宝银行卡支付</div>
  			<div class="choose-icon selected" name="pay_type" data-num="3" ></div>
  		</div>
  	</div>
  	<div class="guarentee-pay-submit">
  		<div class="button">确认支付</div>
  	</div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-goods-guarentee.js"></script>
 </body>
 <script>
 	
 </script>
</html>