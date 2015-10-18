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
String goods_id =request.getParameter("id");
if(goods_id == null || goods_id.replace(" ", "").length() == 0)
{
	goods_id ="";
}
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>拍品详情</title>
  <meta name="description" content="拍品详情" />
  <meta name="keywords" content="拍品详情" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="拍品详情">
  <meta name="apple-mobile-web-app-title" content="拍品详情" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <!-- <meta http-equiv="refresh" content="5"> -->
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  <input type="hidden" name="selected_type_id" id="selected_type_id" value="" />
  <div id="page_top" class="detail-page-top">
	  	<div class="detail-nav-top-img-div">
	  		<img src="${bg_picture_url}" class="detail-nav-top-img"/>
	  	</div>
	  	<div class="detail-page-top-time-tip">
	  		<c:choose>
	  			<c:when test="${goods.STATE == 0 }">
	  				<div class="detail-page-top-time-label-icon detail-page-top-close" id="top_process">已结束</div>
	  				<span class="detail-page-top-time-tip-close-span" >拍卖已成交</span>
	  			</c:when>
	  			<c:when test="${goods.STATE == 1 }">
	  				<div class="detail-page-top-time-label-icon detail-page-top-pre" id="top_process">即将开始</div>
	  				<span class="detail-page-top-time-tip-span" id="time-tip-span">距开始:</span><span class="detail-page-top-time-tip-value" id="time_tip_value"></span>
	  			</c:when>
	  			<c:when test="${goods.STATE == 2 }">
	  				<div class="detail-page-top-time-label-icon detail-page-top-current" id="top_process">正在进行</div>
	  				<span class="detail-page-top-time-tip-span" id="time-tip-span">距结束:</span><span class="detail-page-top-time-tip-value" id="time_tip_value"></span>
	  			</c:when>
	  			<c:otherwise></c:otherwise>
	  		</c:choose>
	  	</div>
	  </div>
  <div class="detail-summary">
  	<div class="detail-summary-left">
  		<div class="detail-summary-left-title">${goods.GOODS_NAME}</div>
  		<div class="detail-summary-left-price">当前价:<span id="goods_price" class="red tap">¥</span><span id="goods_price" class="red">${goods.CURRENT_PRICE}</span><span id="goods_price" class="red">元</span></div>
  		<div class="detail-summary-left-nums">
  			<span id="people_join_num" class="tap">${goods.SIGN_NUM}</span>人报名
  			<span id="people_remind_num" class="tap">${goods.REMIND_NUM}</span>人设置提醒
  			<span id="people_look_num" class="tap">${goods.LOOK_NUM}</span>次围观
  		</div> 
  	</div> 
  	<div class="detail-summary-right">
  		<div class="detail-summary-right-clock no-remind" id="clockBtn"></div> 
  		<div class="detail-summary-right-word">结束前提醒</div>
  		 <a href="index-goods-intrust.do?goods_id=${goods.ID}&from_user=<%=from_user%>" id="intrust_pay_page">
  		<div class="detail-summary-right-request no-remind-request" id="requestBtn">
  		</div> 
  		</a>
  	</div> 
  </div> 
  <div class="detail-guarentee">
  	<div class="detail-guarentee-block">保证金</div>
  	<div class="detail-guarentee-block" id="guarentee_price_id">¥${goods.GUARENTEE_MONEY}</div> 
  	<div class="detail-guarentee-block-large">加价幅度</div> 
  	<div class="detail-guarentee-block" id="add_price_id">${goods.ADD_PRICE}</div> 
  	<div class="detail-guarentee-block">佣金:</div> 
  	<div class="detail-guarentee-block-small" id="fee_price_id">${goods.COMMISSION}</div> 
  </div> 
  <div class="detail-price">
  	<div class="detail-price-left">
  		<span class="tap">起拍价¥</span><span class="tap" id="begin_price_id">${goods.BEGIN_PRICE}</span><br/>
  		<span class="tap">延时周期</span><span class="tap" id="time_gap_id">${goods.DELAY_TIME}</span><span>分钟/次</span>
  	</div> 
    <div class="detail-price-right">
    	<span class="tap">保留价¥</span><span class="tap" id="keep_price_id">${goods.KEEP_PRICE}</span><br/>
    </div> 
  </div> 
  <div class="detail-record">
  <a href="index-price-record.do?id=${goods.ID}">
  	<div class="detail-record-up" id="bid_price_record_id">
  		<div class="detail-record-up-summary">出价记录（<span id="bid_price_total_num_id" >${goods.PRICE_NUM}</span>）</div> 
  		<div class="detail-record-up-more">全部</div> 
  		<div class="detail-record-up-more-icon"></div> 
  	</div> 
  	</a>
  	<div class="detail-record-down">
  	<c:forEach items="${top_list}" var="row" varStatus="status">
		<div class="detail-record-down-block">
  			<div class='detail-record-down-block-up <c:choose><c:when test="${row.STATE == 1}">price-over-icon</c:when><c:when test="${row.STATE == 0}">success-icon</c:when><c:when test="${row.STATE == -1}">out-icon</c:when></c:choose>'></div>
  			<div class="detail-record-down-block-down">
  				<div class="detail-record-down-block-down-left">${row.SHORT_NAME}</div>
  				<div class="detail-record-down-block-down-right">${row.PRICE}${row.UNIT_NAME}</div>
  			</div> 
  		</div>
  	</c:forEach>
  		<!--
  		<div class="detail-record-down-block">
  			<div class='detail-record-down-block-up <c:choose><c:when test="${row.STATE == 1}">success-icon</c:when><c:when test="${row.STATE == 0}">success-icon</c:when><c:when test="${row.STATE == -1}">out-icon</c:when></c:choose>'></div>
  			<div class="detail-record-down-block-down">
  				<div class="detail-record-down-block-down-left">${row.SHORT_NAME}</div>
  				<div class="detail-record-down-block-down-right">${row.PRICE}${row.UNIT_NAME}</div>
  			</div> 
  		</div> 
  		<div class="detail-record-down-block">
  			<div class="detail-record-down-block-up out-icon"></div>
  			<div class="detail-record-down-block-down">
  				<div class="detail-record-down-block-down-left">${row.SHORT_NAME}</div>
  				<div class="detail-record-down-block-down-right">${row.PRICE}${row.UNIT_NAME}</div>
  			</div> 
  		</div> 
  		<div class="detail-record-down-block">
  			<div class="detail-record-down-block-up out-icon"></div>
  			<div class="detail-record-down-block-down">
  				<div class="detail-record-down-block-down-left">${row.SHORT_NAME}</div>
  				<div class="detail-record-down-block-down-right">${row.PRICE}${row.UNIT_NAME}</div>
  			</div> 
  		</div> 
  		-->
  	</div> 
  </div>  
  <div class="detail-org">
  	<span>送拍机构：</span><span>${org_name}</span><img src="" />
  </div> 
  <div class="detail-param">
  	<a href="index-goods-param.do?id=${goods.ID}"><span>查看拍品参数</span></a>
  </div> 
  <div class="detail-else">
  	<span><a href="index-auction-item.do?id=${goods.AUCTION_ID}&from_user=<%=from_user%>">同场其他拍品</a></span>
  </div> 
  <c:choose>
	  <c:when test="${goods.STATE == 0}"></c:when>
	  <c:when test="${goods.STATE == 1}"></c:when>
	  <c:when test="${goods.STATE == 2}">
	  <!-- 拍卖中 未交报名保证金 -->
		  <div class="detail-submit">
			  <c:if test="${is_payed == 0}">
				  <a href="pay-guarentee.do?order_id=${goods.ID}&user_id=<%=from_user%>"><div class="detail-submit-btn" id="price_sign_btn"> 报名交保证金</div></a>
			  </c:if>
			  <!-- 拍卖中 已交报名保证金 -->
			  <c:if test="${is_payed == 1}">
				  <a href="index-goods-bid.do?goods_id=${goods.ID}&from_user=<%=from_user%>"><div class="detail-submit-btn" id="price_bid_btn"> 出价</div></a>
			  </c:if>
		  </div>
	  </c:when>
	  <c:otherwise></c:otherwise>
  </c:choose>
  <div class="detail-process">
  	<div class="detail-process-up"><span class="tap">拍卖流程</span></div> 
  	<div class="detail-process-down">
  		<span>交保证金</span>
  		<span>></span>
  		<span>出价竞拍</span>
  		<span>></span>
  		<span>竞拍成功</span>
  		<span>></span>
  		<span>支付货款</span>
  		<span>></span>
  		<span>联系送货</span>
  		
  	</div> 
  </div> 
  <div class="detail-param-list">
  	<div class="detail-label">
  		<div class="detail-label-icon">拍品属性</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">品牌</div> 
  		<div class="detail-param-cell-l-val">${attribute.BRAND}</div> 
  		<div class="detail-param-cell-r">评估价</div> 
  		<div class="detail-param-cell-r-val">${attribute.PRICE}万（仅供参考）</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">材质</div> 
  		<div class="detail-param-cell-l-val">${attribute.MATERIAL}</div> 
  		<div class="detail-param-cell-r">产地</div> 
  		<div class="detail-param-cell-r-val">${attribute.ORIGIN_PLACE}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">品种</div> 
  		<div class="detail-param-cell-l-val">${attribute.KIND}</div> 
  		<div class="detail-param-cell-r">造型</div> 
  		<div class="detail-param-cell-r-val">${attribute.SHAPE}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">款式</div> 
  		<div class="detail-param-cell-l-val">${attribute.STYLE}</div> 
  		<div class="detail-param-cell-r">重量</div> 
  		<div class="detail-param-cell-r-val">${attribute.WEIGHT}</div> 
  	</div> 
  	<div class="detail-param-col"><div class="detail-param-cell-l">尺寸${attribute.SIZE}（mm）</div> </div>
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">内径</div> 
  		<div class="detail-param-cell-l-val">${attribute.INSIDE_DIMESSION}</div> 
  		<div class="detail-param-cell-r">宽</div> 
  		<div class="detail-param-cell-r-val">${attribute.WIDTH}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">厚</div> 
  		<div class="detail-param-cell-l-val">${attribute.THICKNESS}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">证书机构名称</div> 
  		<div class="detail-param-cell-l-val-single">${attribute.CERTIFACATE_ORG_NAME}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">证书机构网站</div> 
  		<div class="detail-param-cell-l-val-single">${attribute.CERTIFICATE_ORG_SITE}</div> 
  	</div> 
  	<div class="detail-param-col">
  		<div class="detail-param-cell-l">证书编号</div> 
  		<div class="detail-param-cell-l-val-single">${attribute.CERTIFICATE_NO}</div> 
  	</div> 
  	<div class="detail-param-col"><div class="detail-param-cell-l">宝贝描述</div> </div>
  	<div class="detail-param-remark">
  	${attribute.GOODS_DESC}
  	</div>
  </div> 
  <div class="detail-content">
  	<div class="detail-label">
  		<div class="detail-label-icon">拍品展示</div> 
  	</div> 
  	<div id="goods_show_div">${goods.GOODS_SHOW}</div>
  </div> 
  <div class="detail-certificate">
 	<div class="detail-label">
  		<div class="detail-label-icon">证书展示</div> 
  	</div> 
  	<div id="goods_certificate_info_div">${goods.CERTIFICATE_INFO}</div>
  </div> 
  <div class="detail-brand">
  	<div class="detail-label">
  		<div class="detail-label-icon">品牌介绍</div> 
  	</div> 
  	<div id="goods_brand_info_div">${goods.BRAND_INFO}</div>
  </div> 
  <div class="detail-need-know">
  	<div class="detail-label">
  		<div class="detail-label-icon">拍卖须知</div> 
  	</div> 
  	<div id="goods_need_know_div">${goods.NEED_KNOW}</div>
  </div> 
  <div class="detail-service">
  	<div class="detail-label">
  		<div class="detail-label-icon">售后服务</div> 
  	</div> 
  	<div id="goods_sale_service_div">${goods.SALE_SERVICE}</div>
  </div> 
  </div>
   <script>
 	var goods_state =${goods.STATE};
 	var is_payed =${is_payed}; 
 	var is_remind =${is_remind};
 	var is_entrust =${is_entrust};
 	var goods_start_time ="${goods.START_TIME}";
 	var goods_end_time ="${goods.END_TIME}";
 </script>
 <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
 <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-goods-detail.js"></script>
 </body>

</html>