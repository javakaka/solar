<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>模拟商户--订单支付页面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>

<div class="nav">
    <span class=" goback"><em></em></span>

    <h1>交易信息</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

    <form method="post" action="${serverUrl}" id="payForm">
        <!--交易信息 start-->
        <input type="hidden" name="version" value="${tradeInfo.version}"/>
        <input type="hidden" name="token" value="${tradeInfo.token}"/>
        <input type="hidden" name="merchantSign" value="${tradeInfo.merchantSign}"/>
        <input type="hidden" name="merchantNum" value="${tradeInfo.merchantNum}"/>
        <input type="hidden" name="merchantRemark" value="${tradeInfo.merchantRemark}"/>
        <input type="hidden" name="tradeNum" value="${tradeInfo.tradeNum}"/>
        <input type="hidden" name="tradeName" value="${tradeInfo.tradeName}"/>
        <input type="hidden" name="tradeDescription" value="${tradeInfo.tradeDescription}"/>
        <input type="hidden" name="tradeTime" value="${tradeInfo.tradeTime}"/>
        <input type="hidden" name="tradeAmount" value="${tradeInfo.tradeAmount}"/>
        <input type="hidden" name="currency" value="${tradeInfo.currency}"/>
        <input type="hidden" name="notifyUrl" value="${tradeInfo.notifyUrl}"/>
        <input type="hidden" name="successCallbackUrl" value="${tradeInfo.successCallbackUrl}"/>
        <input type="hidden" name="failCallbackUrl" value="${tradeInfo.failCallbackUrl}"/>
        <!--交易信息 end-->

        <ul class="form-wrap" id="J-form-wrap">

            <li class="form-item form-item-border clearfix">
                <label>交易名称</label>

                <div class="form-field">
                    <input type="text" class="" value="${tradeName}" autocomplete="off"
                           minlength="15" maxlength="18" data-callback="input.status"/>
                    <span class="clear-btn J-clear-btn">×</span>
                </div>
            </li>
            <li class="form-item form-item-border clearfix">
                <label>交易金额</label>

                <div class="form-field">
                    <input type="text" class="" value="${tradeAmount} 分" autocomplete="off"
                           placeholder="请输入身份证号" minlength="15" maxlength="18" data-callback="input.status"/>
                    <span class="clear-btn J-clear-btn">×</span>
                </div>
            </li>

            <div class="grid96">
                <a href="javascript:;" id="J-next-btn" class="btn btn-disabled mt15 btn-actived">去支付</a>
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
            $('#payForm').submit();
        });
    })(Zepto);
</script>
</body>
</html>
