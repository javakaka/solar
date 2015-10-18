<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>拍品参数</title>
  <meta name="description" content="拍品参数" />
  <meta name="keywords" content="拍品参数" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="拍品参数">
  <meta name="apple-mobile-web-app-title" content="拍品参数" />
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
  <!--
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">产品编号</div>
  	<div class="param-item-right">1001</div>
  </div>
  -->
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">商品名称</div>
  	<div class="param-item-right">${goods.GOODS_NAME}</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">送拍机构</div>
  	<div class="param-item-right">${goods.ORG_NAME}</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">起拍价</div>
  	<div class="param-item-right">${goods.BEGIN_PRICE}元</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">材质</div>
  	<div class="param-item-right">${attribute.MATERIAL}</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">款式</div>
  	<div class="param-item-right">${attribute.STYLE}</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">重量</div>
  	<div class="param-item-right">${attribute.WEIGHT}</div>
  </div>
  <div class="param-item" id="" name="" >
  	<div class="param-item-left">是否有证书</div>
  	<div class="param-item-right">${attribute.CERTIFACATE_ORG_NAME}</div>
  </div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
 </body>
 <script>
 	$(function(){
 		
 	});
 </script>
</html>