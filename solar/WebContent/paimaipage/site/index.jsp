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
  <title>首页</title>
  <meta name="description" content="今日专场" />
  <meta name="keywords" content="今日专场" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="今日专场">
  <meta name="apple-mobile-web-app-title" content="今日专场" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link id="js_maincss" rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper">
	  <div id="page_top" class="page-top">
	  	<div class="nav-top-img-div">
	  		<img src="${top_row.ICON_URL}" class="nav-top-img"/>
	  	</div>
	  	<div class="nav-top-title">
	  		<span class="upper">${top_row.SESSION_NAME}</span>
	  		<span class="below">${top_row.SUMMARY} ${fn:substring(top_row.START_TIME, 5, 7)}月${fn:substring(top_row.START_TIME, 8, 10)}日${fn:substring(top_row.START_TIME, 11, 16)}开拍</span>
	  	</div>
	  </div>
	  <div id="page_nav" class="page-nav">
	  <a href="index-pre.do?from_user=<%=from_user%>">
	  	<div class="nav-left">
	  		<div class="nav-left-icon">
	  			<img src="<%=basePath%>common/images/nav_left.png" class="nav-left-icon-img"/>
	  		</div>
	  		<div class="nav-left-text">
	  			<div class="upper">明日专场</div>
	  			<div class="below">专场抢先看</div>
	  		</div>
	  	</div>
	  	</a>
	  	<a href="index-close.do?from_user=<%=from_user%>">
	  	<div class="nav-center">
	  		<div class="nav-center-icon">
	  			<img src="<%=basePath%>common/images/nav_center.png" class="nav-center-icon-img"/>
	  		</div>
	  		<div class="nav-center-text">
	  			<div class="upper">已结束</div>
	  			<div class="below">专场回顾</div>
	  		</div>
	  	</div>
	  	</a>
	  	<a href="index-search-type.do?from_user=<%=from_user%>">
	  	<div class="nav-right">
	  		<div class="nav-right-icon">
	  			<img src="<%=basePath%>common/images/nav_right.png" class="nav-right-icon-img"/>
	  		</div>
	  		<div class="nav-right-text">
	  			<div class="upper">寻宝</div>
	  			<div class="below">捡漏找货</div>
	  		</div>
	  	</div>
	  	</a>
	  </div>
	  <div class="main-frame">
		<div class="auction-list">
		  <c:forEach items="${page}" var="row" varStatus="status">
			  <div class="auction-list-item<c:if test='${status.index > 0}' > span-line</c:if>">
			  <a href="index-auction-item.do?id=${row.ID}&from_user=<%=from_user%>">
			   <div class="auction-list-item-top">
				<div class="auction-list-item-left">
				 <h4 id="item_title_0">${row.SESSION_NAME}</h4>
				 <div class="subtitle"> 
				  <span class="red" id="item_price_0">${row.PRICE_NUM}</span><span >次出价</span>
				  <span class="red" id="item_people_0">${row.SIGN_NUM}</span><span >人报名</span>
				 </div>
				</div> 
				<div class="auction-list-item-right">
					<div class="auction-list-item-right-img current">
						<span>今日专场</span>
						<span id="item_end_time_0">${fn:substring(row.END_TIME, 11, 16)}结束</span>
					</div>
				</div>
			   </div>
				<div class="auction-list-item-img"> 
				 <img  src="${row.ICON_URL}"  />
				</div>
			  </a>
			  </div>
		  </c:forEach>
		</div>
	  </div>
  	  <jsp:include page="footer.jsp">
  	 	 <jsp:param name="from_user" value="<%=from_user %>" />
  	  </jsp:include>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
 </body>
</html>