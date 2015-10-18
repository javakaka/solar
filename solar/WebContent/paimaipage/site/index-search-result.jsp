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
   <div id="wrapper">
	  <div id="scroller">
		<div id="pullDown" class="idle">
			<span class="pullDownIcon"></span>
			<span class="pullDownLabel">下拉更新...</span>
		</div>
	  <div class="search-goods-list" id="search-goods-list">
	  <!--
	  	<div class="search-goods-list-item">
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="search-goods-list-item">
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="search-goods-list-item">
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  		<div class="goods"  >
	  			<div class="icon"  >
	  				<img src="<%=basePath%>common/images/goods_icon.jpg" />
	  			</div>
	  			<div class="title"  title="老坑冰糯种A货翡翠">老坑冰糯种A货翡翠</div>
	  			<div class="price"  >当前价:<span>¥</span><span>3285</span></div>
	  			<div class="time"  >距结束:<span>3小时20分</span></div>
	  			<div class="num current" >
	  				<span class="num-span">98</span><span class="num-unit">次</span><span>竞价中</span>
	  			</div>
	  		</div>
	  	</div>
	  	-->
	  </div>
  	 	 <div id="pullUp" class="idle">
				<span class="pullUpIcon"></span>
				<span class="pullUpLabel">上拉更新...</span>
		</div>
	</div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/iscroll.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-search-result.js"></script>
 </body>
 <script>
 	$(function(){
 		
 	});
 </script>
</html>