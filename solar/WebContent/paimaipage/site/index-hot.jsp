<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String attachBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
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
  <title>热拍单品</title>
  <meta name="description" content="热拍单品" />
  <meta name="keywords" content="热拍单品" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="热拍单品">
  <meta name="apple-mobile-web-app-title" content="热拍单品" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style>body {background: white;}</style>
 </head>
 <body >
  <div id="main" class="wrapper white">
  <input type="hidden" name="selected_type_id" id="selected_type_id" value="" />
  <div id="page_top" class="hot-page-top">
	  	<div class="hot-nav-top-img-div">
	  		<img src="<%=basePath%>common/images/top.png" class="hot-nav-top-img"/>
	  	</div>
	  </div>
  <div class="hot-nav">
  	<div class="hot-nav-item selected" name="type_item" data-num="-1" >全部</div>
  	<c:forEach items="${type_list}" var="type" varStatus="status" begin="0" end="3">
  		<div class="hot-nav-item" name="type_item" data-num="${type.ID }" >${type.TYPE_NAME }</div>
  	</c:forEach>
  	<div class="hot-nav-type hide" id="switchBtn">
  	</div>
  </div>
  <div class="category-list gray hidden" id="category_wrapper">
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
	  </div>
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
	  			<div class="num close" >
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
	  			<div class="num close" >
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
	  			<div class="num close" >
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
	  			<div class="num close" >
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
	  			<div class="num close" >
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
	  			<div class="num close" >
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
  </div>
  <jsp:include page="footer.jsp" />
  </div>
  <script >
  	var BasePath ="<%=basePath%>";
  </script>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/iscroll.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-hot.js"></script>
 </body>
 
</html>