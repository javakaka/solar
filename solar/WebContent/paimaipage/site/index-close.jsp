<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String attachBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>历史专场</title>
  <meta name="description" content="历史专场" />
  <meta name="keywords" content="历史专场" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="历史专场">
  <meta name="apple-mobile-web-app-title" content="历史专场" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper">
	  <div class="main-frame">
		<div class="auction-list">
		  <c:forEach items="${page}" var="row" varStatus="status">
		  	<div class="auction-list-item<c:if test='${status.index > 0}' > span-line</c:if>">
			  <a href="index-auction-item.do?id=${row.ID}">
			   <div class="auction-list-item-top">
				<div class="auction-list-item-left">
				 <h4 id="item_title_0">${row.SESSION_NAME}</h4>
				 <div class="subtitle"> 
				  <span id="item_price_0">${row.PRICE_NUM}</span><span >次出价</span>
				  <span id="item_people_0">${row.SIGN_NUM}</span><span >人报名</span>
				 </div>
				</div> 
				<div class="auction-list-item-right">
					<div class="auction-list-item-right-img close">
						<span class="close-span">已结束</span>
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
	  <jsp:include page="footer.jsp" />
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
 </body>
 <script>
 	
 </script>
</html>