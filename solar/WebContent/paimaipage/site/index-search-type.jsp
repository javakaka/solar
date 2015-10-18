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
  <title>寻宝</title>
  <meta name="description" content="寻宝" />
  <meta name="keywords" content="寻宝" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="寻宝">
  <meta name="apple-mobile-web-app-title" content="寻宝" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style>body {background: white;}</style>
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<input id="selected_category_id" name="selected_category_id" value="-1" type="hidden" />
  	<input id="selected_state_id" name="selected_state_id" value="1" type="hidden" />
	  <div class="search-title">
	  	<div class="search-label">类目:</div>
	  </div>
	  <div class="category-list gray">
	  	<div class="category-list-item">
	  		<div class="left selected" name="category_item" data-num="-1">全部</div>
	  		<c:forEach items="${type_list}" var="type" varStatus="status" begin="0" end="1">
		  		<c:if test="${status.index % 3 == 0 }">
		  			<div class="center" name="category_item" data-num="${type.ID }">${type.TYPE_NAME }</div>
		  		</c:if>
		  		<c:if test="${status.index % 3 == 1 }">
		  			<div class="right" name="category_item" data-num="${type.ID }">${type.TYPE_NAME }</div>
		  		</c:if>
		  	</c:forEach>
	  	</div>
	  	<c:forEach items="${type_list}" var="type" varStatus="status" begin="2" >
		  		<c:if test="${status.index % 3 == 2 }">
				  	<div class="category-list-item">
		  				<div class="left" name="category_item" data-num="${type.ID }">${type.TYPE_NAME }</div>
		  		</c:if>
		  		<c:if test="${status.index % 3 == 0 }">
		  				<div class="center" name="category_item" data-num="${type.ID }">${type.TYPE_NAME }</div>
		  		</c:if>
		  		<c:if test="${status.index % 3 == 1 }">
			  			<div class="right" name="category_item" data-num="${type.ID }">${type.TYPE_NAME }</div>
				  	</div>
		  		</c:if>
		</c:forEach>
		<!--
	  	<div class="category-list-item">
	  		<div class="left" name="category_item" data-num="3">琥珀</div>
	  		<div class="center" name="category_item" data-num="4">水晶</div>
	  		<div class="right" name="category_item" data-num="5">玉石</div>
	  	</div>
	  	<div class="category-list-item">
	  		<div class="left" name="category_item" data-num="6">有色宝石</div>
	  		<div class="center" name="category_item" data-num="7">石榴石</div>
	  		<div class="right" name="category_item" data-num="8">碧玺</div>
	  	</div>
	  	-->
	  </div>
	  <div class="search-state">
	  	<div class="search-label">状态:</div>
	  </div>
	  <div class="search-state-list gray">
	  	<div class="left selected" name="state_item" data-num="1">即将开始</div>
	  	<div class="center" name="state_item" data-num="2">正在进行</div>
	  	<div class="right" name="state_item" data-num="0">已结束</div>
	  </div>
	  <div class="search-price-content">
	  	<div class="search-label left">价格:</div>
	  	<input id="start_price_inp" name="start_price_inp" value="" type="text" class="inputbox left"/>
	  	<div class="search-price-content-label left">元～</div>
	  	<input id="end_price_inp" name="end_price_inp" value="" type="text" class="inputbox left"/>
	  	<div class="search-price-content-label left">元</div>
	  </div>
	  <div class="search-submit-btn" id="submitBtn">
	  	确定
	  </div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-search.js"></script>
 </body>
 <script>
 	
 </script>
</html>