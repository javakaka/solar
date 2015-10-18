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
  <title>预览专场</title>
  <meta name="description" content="预览专场" />
  <meta name="keywords" content="预览专场" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="预览专场">
  <meta name="apple-mobile-web-app-title" content="预览专场" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper">
	  <div id="page_date" class="date-list">
	  	
	  	<c:if test="${date_param == ''}">
			<div class="date-item">
				<div id="current_date_item" name="date_item" class="date-item-content" data-num="${first_day}">今日</div>
			</div>
			<div class="date-item">
				<div id="tomorrow_date_item" name="date_item" class="date-item-content red" data-num="${second_day}">明日</div>
			</div>
			<div class="date-item">
				<div name="date_item" class="date-item-content" data-num="${third_day}">${fn:substring(third_day, 8, 10)}日</div>
			</div>
			<div class="date-item">
				<div name="date_item" class="date-item-content" data-num="${fouth_day}">${fn:substring(fouth_day, 8, 10)}日</div>
			</div>
	  	</c:if>
	  	<c:if test="${date_param != ''}">
			<div class="date-item">
				<div id="current_date_item" name="date_item" class="date-item-content <c:if test="${date_param == first_day}">red</c:if>" data-num="${first_day}">今日</div>
			</div>
			<div class="date-item">
				<div id="tomorrow_date_item" name="date_item" class="date-item-content  <c:if test="${date_param == second_day}">red</c:if>" data-num="${second_day}">明日</div>
			</div>
			<div class="date-item">
				<div id="third_date_item" name="date_item" class="date-item-content <c:if test="${date_param == third_day}">red</c:if>" data-num="${third_day}">${fn:substring(third_day, 8, 10)}日</div>
			</div>
			<div class="date-item">
				<div id="fouth_date_item" name="date_item" class="date-item-content <c:if test="${date_param == fouth_day}">red</c:if>" data-num="${fouth_day}">${fn:substring(fouth_day, 8, 10)}日</div>
			</div>
	  	</c:if>
	  </div>
	  <div class="main-frame">
		<div class="auction-list">
		  <c:forEach items="${page}" var="row" varStatus="status">
			  <div class="auction-list-item<c:if test='${status.index > 0}' > span-line</c:if>">
			  <a href="index-auction-item.do?id=${row.ID}">
			   <div class="auction-list-item-top">
				<div class="auction-list-item-left">
				 <h4 id="item_title_0">${row.SESSION_NAME}</h4>
				 <div class="subtitle"> 
				  <span class="red" id="item_price_0">${row.PRICE_NUM}</span><span >次出价</span>
				  <span class="red" id="item_people_0">${row.SIGN_NUM}</span><span >人报名</span>
				 </div>
				</div> 
				<div class="auction-list-item-right">
					<c:choose>
							<c:when test="${date_param == first_day}">
								<div class="auction-list-item-right-img current">
									<span>今日专场</span>
									<span id="item_end_time_0">${fn:substring(row.END_TIME, 11, 16)}结束</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="auction-list-item-right-img prepare">
									<span>明日专场</span>
									<span id="item_end_time_0">${fn:substring(row.END_TIME, 11, 16)}结束</span>
								</div>
							</c:otherwise>
					</c:choose>
					<!--
					<div class="auction-list-item-right-img prepare">
						<span>明日专场</span>
						<span id="item_end_time_0">${fn:substring(row.END_TIME, 11, 16)}结束</span>
					</div>
					-->
				</div>
			   </div>
				<div class="auction-list-item-img"> 
				 <img  src="${row.ICON_URL}"  />
				</div>
			  </a>
			  </div>
		  </c:forEach>
		</div>
	 <jsp:include page="footer.jsp" />
	  </div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
 </body>
 <script>
 	$(function(){
 		$("[name='date_item']").click(function(obj){
 				$("[name='date_item']").removeClass("red");
 				$obj =$(this);
 				var day_num =$obj.attr("data-num")
 				var url ="<%=basePath%>paimaipage/site/index-pre.do?from_user=<%=from_user%>";
 				url +="&date_param="+day_num;
 				$obj.addClass("red");
 				window.location.href=url;
 			});
 	});
 </script>
</html>