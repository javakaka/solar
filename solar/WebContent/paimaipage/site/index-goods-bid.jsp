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
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>拍品详情-出价</title>
  <meta name="description" content="拍品详情-出价" />
  <meta name="keywords" content="拍品详情-出价" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="拍品详情-出价">
  <meta name="apple-mobile-web-app-title" content="拍品详情-出价" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  <input type="hidden" name="selected_type_id" id="selected_type_id" value="" />
  <div id="page_top" class="detail-page-top">
	  	<div class="detail-nav-top-img-div">
	  		<img src="<%=basePath%>common/images/top.png" class="detail-nav-top-img"/>
	  	</div>
	  </div>
  <div class="detail-summary">
  	<div class="detail-summary-left">
  		<div class="detail-summary-left-title">${goods.GOODS_NAME}</div>
  		<div class="detail-summary-left-price">当前价:<span id="goods_price" class="red tap">¥</span><span id="goods_price" class="red">${goods.CURRENT_PRICE}</span><span id="goods_price" class="red">元</span></div>
  		<div class="detail-summary-left-nums">
  			<span id="people_join_num" class="tap">15</span>人报名
  			<span id="people_remind_num" class="tap">115</span>设置提醒
  			<span id="people_look_num" class="tap">900</span>次围观
  		</div> 
  	</div> 
  	<div class="detail-summary-right">
  		<div class="detail-summary-right-clock no-remind" id="clockBtn"></div> 
  		<div class="detail-summary-right-word">结束前提醒</div> 
  		<a href="index-goods-intrust.do?goods_id=${goods.ID}&from_user=<%=from_user%>" id="intrust_pay_page">
  		<div class="detail-summary-right-request no-remind-request" id="requestBtn"></div> 
  		</a>
  		</div> 
  	</div> 
  </div> 
  <div class="detail-guarentee">
  	<div class="detail-guarentee-block">保证金</div>
  	<div class="detail-guarentee-block" id="guarentee_price_id">¥2000</div> 
  	<div class="detail-guarentee-block-large">加价幅度</div> 
  	<div class="detail-guarentee-block" id="add_price_id">3000</div> 
  	<div class="detail-guarentee-block">佣金:</div> 
  	<div class="detail-guarentee-block-small" id="fee_price_id">0</div> 
  </div> 
  <div class="detail-price">
  	<div class="detail-price-left">
  		<span class="tap">起拍价¥</span><span class="tap" id="begin_price_id">1</span><br/>
  		<span class="tap">延时周期</span><span class="tap" id="time_gap_id">1</span><span>分钟/次</span>
  	</div> 
    <div class="detail-price-right">
    	<span class="tap">保留价¥</span><span class="tap" id="keep_price_id">无</span><br/>
    </div> 
  </div> 
  <div class="detail-record-up" id="bid_price_record_id">
  		<div class="detail-record-up-summary">出价记录（<span id="bid_price_total_num_id" >15</span>）</div> 
  		<div class="detail-record-up-more">全部</div> 
  		<div class="detail-record-up-more-icon"></div> 
  </div>  
  <div class="detail-bid-submit">
	  <div class="top">当前价: <span class="red">¥</span><span class="red" id="current_price">${goods.CURRENT_PRICE}</span></div>
	  <div class="center" >
	  	<div class="block-normal-l" id="minus_btn">-</div>
	  	<div class="block-small" >¥</div>
	  	<div class="block-large" >
	  		<input id="price" name="price" value="${goods.CURRENT_PRICE}" />
	  	</div>
	  	<div class="block-normal-r"  id="plus_btn">+</div>
	  </div>
	  <div class="bellow" id="bid_price_btn" >出价</div>
  </div>  
  </div>
  
 </body>
 <script>
 	var goods_state =${goods.STATE};
 	var is_remind =${is_remind};
 	var is_entrust =${is_entrust};
 </script>
 <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-goods-bid.js"></script>
</html>