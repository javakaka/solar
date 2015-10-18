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
  <title>委托竞拍支付</title>
  <meta name="description" content="支付" />
  <meta name="keywords" content="支付" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="支付">
  <meta name="apple-mobile-web-app-title" content="支付" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
 </head>
 <body >
  <div id="main" class="wrapper white">
  	<input type="hidden" name="pay_type_value" id="pay_type_value" value="" />
  	<div class="guarentee-pay-label">支付方式</div>
  	<div class="guarentee-pay-list">
  		<div class="item">
  			<div class="brand">
  				<div class="wechat"></div>
  			</div>
  			<div class="brand-label">微信支付</div>
  			<div class="choose-icon selected" name="pay_type" data-num="1" id="wx_pay_item"></div>
  		</div>
  		<div class="item">
  			<div class="brand">
  				<div class="ali-fast"></div>
  			</div>
  			<div class="brand-label">支付宝快捷支付</div>
  			<div class="choose-icon" name="pay_type" data-num="2" id="alipay_fast_item"></div>
  		</div>
  		<div class="item">
  			<div class="brand">
  				<div class="ali-card"></div>
  			</div>
  			<div class="brand-label">支付宝银行卡支付</div>
  			<div class="choose-icon" name="pay_type" data-num="3" id="alipay_card_item"></div>
  		</div>
  	</div>
  	<!-- 
  	<div class="guarentee-pay-submit">
  		<div class="button" id="checkBtn">检查</div>
  	</div>
  	
  	<div class="guarentee-pay-submit">
  		<div class="button" id="shareBtn">分享</div>
  	</div>
  	-->
  	<div class="guarentee-pay-submit">
  		<div class="button" id="payBtn">确认支付</div>
  	</div>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/pay-entrust-buy.js"></script>
 </body>
 <script>
 	var appId ="${appId}";
    var timestamp ="${timestamp}";
    var nonceStr ="${nonceStr}";
    var signature ="${signature}";
    
    var pay_timestamp ="${pay_timestamp}";
    var pay_noncestr ="${pay_noncestr}";
    var pay_package ="${pay_package}";
    var pay_signtype ="${pay_signtype}";
    var pay_paysign ="${pay_paysign}";
    
    
    /*
   * 注意：
   * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
   * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
   * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * 如有问题请通过以下渠道反馈：
   * 邮箱地址：weixin-open@qq.com
   * 邮件主题：【微信JS-SDK反馈】具体问题
   * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
   */
  wx.config({
      debug: false,
      appId: appId,
      timestamp: timestamp,
      nonceStr: nonceStr,
      signature: signature,
      jsApiList: [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'chooseWXPay'
      ]
  });
/*
 * 注意：
 * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
 * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
 * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
 *
 * 如有问题请通过以下渠道反馈：
 * 邮箱地址：weixin-open@qq.com
 * 邮件主题：【微信JS-SDK反馈】具体问题
 * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
 */
  // 10 微信支付接口
  // 10.1 发起一个支付请求
  document.querySelector('#payBtn').onclick = function () {
	 wx.checkJsApi({
	      jsApiList: [
	        'getNetworkType',
	        'previewImage',
	        'chooseWXPay'
	      ],
	      success: function (res) {
	        wx.chooseWXPay({
	  	      timestamp: '${pay_timestamp}', // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
	  	      nonceStr: '${pay_noncestr}', // 支付签名随机串，不长于 32 位
	  	      package: '${pay_package}', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
	  	      signType: '${pay_signtype}', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
	  	      paySign: '${pay_paysign}', // 支付签名
	  	      success: function (res) {
	  	          // 支付成功后的回调函数
	  	          showMsg('支付成功')
	  	          $("#payBtn").hide();
	  	      }
	  	  	});
	      }
	    });
	  
	  
	wx.error(function (res) {
	  alert(res.errMsg);
	});
 };
 </script>
</html>