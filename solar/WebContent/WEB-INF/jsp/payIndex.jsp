<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8"/>
    <title>房租宝线上交租-订单支付页面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>

<div class="nav">
    <span class="goback"><em></em></span>

    <h1>房租宝线上交租</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

<form method="post" action="${ctx }/wepay/demo/pay/sign.jsp" id="paySignForm">
	<input type="hidden" class="" name="serverUrl" value="https://m.wangyin.com/wepay/web/pay" data-callback="input.status"/>
	<input type="hidden" class="" name="version" value="1.0" autocomplete="off" data-callback="input.status"/>
	<input type="hidden" class="" name="token" value="" autocomplete="off" data-callback="input.status"/>
	<input type="hidden" class="" name="merchantNum" value="${merchantNum}" autocomplete="off" data-callback="input.status" readonly />
	<input type="hidden" class="" name="merchantRemark" value="生产环境-测试商户号" autocomplete="off" data-callback="input.status" readonly />
	<input type="hidden" class="" name="tradeTime" value="<fmt:formatDate value="${tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" autocomplete="off" data-callback="input.status" readonly />
	<input type="hidden" class="" name="notifyUrl" value="<%=basePath %>${notifyUrl}?order_no=${tradeNum}" autocomplete="off" data-callback="input.status"/>
	<input type="hidden" class="" name="successCallbackUrl" value="<%=basePath %>${successCallbackUrl}?order_no=${tradeNum}" autocomplete="off" data-callback="input.status"/>
	<input type="hidden" class="" name="failCallbackUrl" value="<%=basePath %>${failCallbackUrl}?order_no=${tradeNum}" autocomplete="off" data-callback="input.status"/>
    <ul class="form-wrap" id="J-form-wrap">
<!-- 
        <li class="form-item form-item-border clearfix">
            <label>服务URL</label>

            <div class="form-field">
                <input type="text" class="" name="serverUrl" value="https://m.wangyin.com/wepay/web/pay" autocomplete="off"
                       minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>接口版本</label>

            <div class="form-field">
                <input type="text" class="" name="version" value="1.0" autocomplete="off"
                        minlength="15" maxlength="18" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>令牌</label>

            <div class="form-field">
                <input type="text" class="" name="token" value="" autocomplete="off" placeholder="请输入用户交易令牌"
                       minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>


        <li class="form-item form-item-border clearfix">
            <label>商户号</label>

            <div class="form-field">
                <input type="text" class="" name="merchantNum" value="${merchantNum}" autocomplete="off"
                       placeholder="请输入商户号" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>商户备注</label>

            <div class="form-field">
                <input type="text" class="" name="merchantRemark" value="生产环境-测试商户号" autocomplete="off"
                       placeholder="请输入商户备注" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
-->
        <li class="form-item form-item-border clearfix">
            <label>交易号</label>

            <div class="form-field">
                <input type="text" class="" name="tradeNum" value="<c:out value="${tradeNum}"/>" autocomplete="off" placeholder="请输入交易号" data-callback="input.status" readonly />
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>交易名称</label>

            <div class="form-field">
                <input type="text" class="" name="tradeName" value="房租宝线上交租" autocomplete="off" data-callback="input.status" readonly />
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>交易描述</label>

            <div class="form-field">
                <input type="text" class="" name="tradeDescription" value="交易描述" autocomplete="off" placeholder="请输入交易描述" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
<!-- 
        <li class="form-item form-item-border clearfix">
            <label>交易时间</label>

            <div class="form-field">
                <input type="text" class="" name="tradeTime" value="<fmt:formatDate value="${tradeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" autocomplete="off"
                       placeholder="请输入交易时间" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>${tradeAmountFen}${tradeAmount}
            </div>
        </li>
-->
        <li class="form-item form-item-border clearfix">
            <label>交易金额</label>

            <div class="form-field">
                <!-- 
                <input type="text" class="" name="tradeAmountFen" value="0.01 元" autocomplete="off" data-callback="input.status" readonly />
                <input type="hidden" class="" name="tradeAmount" value="1" autocomplete="off" data-callback="input.status" readonly />
                -->
                <input type="text" class="" name="tradeAmountFen" value="${tradeAmountFen } 元" autocomplete="off" data-callback="input.status" readonly />
                <input type="hidden" class="" name="tradeAmount" value="${tradeAmount }" autocomplete="off" data-callback="input.status" readonly />
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>货币种类</label>

            <div class="form-field">
                <input type="text" class="" name="currency" value="CNY" autocomplete="off" data-callback="input.status" readonly />
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
<!-- 
        <li class="form-item form-item-border clearfix">
            <label>异步通知</label>

            <div class="form-field">
                <input type="text" class="" name="notifyUrl" value="${notifyUrl}"
                       autocomplete="off" placeholder="请输入异步通知地址" minlength="15" maxlength="200"
                       data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>成功通知</label>

            <div class="form-field">
                <input type="text" class="" name="successCallbackUrl" value="${successCallbackUrl}"
                       autocomplete="off" placeholder="请输入交易成功通知地址" minlength="15" maxlength="200"
                       data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>失败通知</label>

            <div class="form-field">
                <input type="text" class="" name="failCallbackUrl" value="${failCallbackUrl}"
                       autocomplete="off" placeholder="请输入交易失败通知地址" minlength="15" maxlength="200"
                       data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
-->
			<li class="form-item form-item-border clearfix">
            <label>提示信息</label>
            <div class="form-field">
                ${error}
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
        <div class="grid96">
            <c:choose>
            	<c:when test="${not empty error}">
            	<a href="javascript:;" class="btn btn-disabled mt15">支付请求错误</a>
            	</c:when>
            	<c:otherwise>
            		<a href="javascript:;" id="J-next-btn" class="btn btn-disabled mt15 btn-actived">提交</a>
            	</c:otherwise>
            </c:choose>
        </div>
    </ul>
</form>
</div>




<script src="${ctx }/res/wepay/js/zepto.js"></script>
<script>
    ;(function ($) {
        var Dom = {
            nextBtn: $('#J-next-btn')
        }
        /*点击下一步的操作*/
        Dom.nextBtn.on('click', function () {
            $('#paySignForm').submit();
        });

    })(Zepto);
</script>
</body>
</html>
