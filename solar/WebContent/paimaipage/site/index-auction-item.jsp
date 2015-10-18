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
  <title>${row.SESSION_NAME}</title>
  <meta name="description" content="拍卖会场" />
  <meta name="keywords" content="拍卖会场" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="拍卖会场">
  <meta name="apple-mobile-web-app-title" content="拍卖会场" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <meta http-equiv="refresh" content="30"> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style>
  body{
      background: white;
  }
  </style>
 </head>
 
 <body >
  <div id="main" class="wrapper white">
  <div id="page_top" class="auction-item-page-top">
	  	<div class="auction-item-nav-top-img-div">
	  		<img src="${row.TOP_ICON_URL}" class="auction-item-nav-top-img"/>
	  	</div>
	  	<!--
	  	<div class="auction-item-nav-top-summary font-white">
	  		 <h4> ${row.SESSION_NAME}</h4>
	  	</div>
	  	-->
	  	<c:choose>
	  		<c:when test="${row.STATE == 0}">
				<div class="auction-item-nav-top-title auction-item-close font-white">
				<div class="auction-item-nav-top-title-left">
					<span class="upper" id="auction_tips_label">本场已结束于:</span>
					<span class="below" id="auction_tips_text">${fn:substring(row.END_TIME, 11, 13)}时${fn:substring(row.END_TIME, 14, 16)}分</span>
				</div>
				<div class="auction-item-nav-top-title-center">
				</div>
				<div class="auction-item-nav-top-title-right">
					<div class="auction-item-nav-top-title-right-upper"></div>
					<div class="auction-item-nav-top-title-right-bellow"><span>已结束</span></div>
				</div>
				</div>
	  		</c:when>
	  		<c:when test="${row.STATE == 2}">
				<div class="auction-item-nav-top-title auction-item-current font-white">
				<div class="auction-item-nav-top-title-left">
					<span class="upper" id="auction_tips_label">距结束还有:</span>
					<span class="below" id="auction_tips_text"></span>
				</div>
				<div class="auction-item-nav-top-title-center">
				</div>
				<div class="auction-item-nav-top-title-right">
					<div class="auction-item-nav-top-title-right-upper"></div>
					<div class="auction-item-nav-top-title-right-bellow"><span>前结束提醒</span></div>
				</div>
				</div>
				<script language="javascript" type="text/javascript"> 
					var end_date ='${row.END_TIME}';
					var interval = 1000; 
					var is_stop =0;
					function ShowCountDown(end_date,divname) 
					{ 
					
					var now = new Date(); 
					var endDate = new Date(end_date); 
					var leftTime=endDate.getTime()-now.getTime(); 
					var leftsecond = parseInt(leftTime/1000); 
					var day1=Math.floor(leftsecond/(60*60*24)); 
					var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
					var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
					var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
					var cc = document.getElementById(divname); 
					cc.innerHTML = hour+"小时"+minute+"分"+second+"秒"; 
						if(hour == 0 && minute== 0 && second==0)
						{
							clearInterval(ShowCountDown);
						}
					} 
					//t=setTimeout(ShowCountDown(end_date,'auction_tips_text'),interval)
					window.setInterval(function(){ShowCountDown(end_date,'auction_tips_text');}, interval); 
				</script> 
	  		</c:when>
	  		<c:when test="${row.STATE == 1}">
				<div class="auction-item-nav-top-title auction-item-pre font-white">
				<div class="auction-item-nav-top-title-left">
					<span class="upper" id="auction_tips_label">距开始还有:</span>
					<span class="below" id="auction_tips_text">${fn:substring(row.START_TIME, 12, 13)}时${fn:substring(row.START_TIME, 15, 16)}分30秒</span>
				</div>
				<div class="auction-item-nav-top-title-center">
				</div>
				<div class="auction-item-nav-top-title-right">
					<div class="auction-item-nav-top-title-right-upper"></div>
					<div class="auction-item-nav-top-title-right-bellow"><span></span></div>
				</div>
				</div>
				<script language="javascript" type="text/javascript"> 
					var end_date ='${row.START_TIME}';
					var interval = 1000; 
					function ShowCountDown(end_date,divname) 
					{ 
					var now = new Date(); 
					var endDate = new Date(end_date); 
					var leftTime=endDate.getTime()-now.getTime(); 
					var leftsecond = parseInt(leftTime/1000); 
					var day1=Math.floor(leftsecond/(60*60*24)); 
					var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
					var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
					var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
					var cc = document.getElementById(divname); 
					cc.innerHTML = hour+"小时"+minute+"分"+second+"秒"; 
					} 
					window.setInterval(function(){ShowCountDown(end_date,'auction_tips_text');}, interval); 
				</script> 
	  		</c:when>
	  	</c:choose>
	  	<!--
	  	<div class="auction-item-nav-top-more"><a><span>专场更多信息 ></span></a></div>
	  	-->
	  </div>
  <div class="seq-nav">
  	<div class="seq-nav-default" id="defaultOrderBtn">默认</div>
  	<div class="seq-nav-num"   id="priceNumOrderBtn">出价次数</div>
  	<div class="seq-nav-arrow up" id="priceNumArrowOrderBtn"></div>
  	<div class="seq-nav-price" id="currentPriceOrderBtn">价格</div>
  	<div class="seq-nav-arrow up" id="currentPriceArrowOrderBtn"></div>
  	<div class="seq-nav-summary">
  		<div class="seq-nav-summary-up">拍品:<span id="goods_total_num" name="goods_total_num">${row.GOODS_NUM}</span>件 出价:<span id="price_total_num" name="price_total_num">${row.PRICE_NUM}</span>次</div>
  		<div class="seq-nav-summary-down">围观:<span id="attention_total_num" name="attention_total_num">${row.LOOK_NUM}</span>次</div>
  	</div>
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
	  		<a href="index-goods-detail.jsp">
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
	  		</a>
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
  <script >
  var BasePath ="<%=basePath%>";
  </script>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/iscroll.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-auction-item.js?v=1"></script>
 </body>
</html>