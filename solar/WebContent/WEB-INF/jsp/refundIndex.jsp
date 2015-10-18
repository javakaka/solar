<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>模拟商户--订单退款页面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>

<div class="nav">
    <span class="arrow goback"><em></em></span>

    <h1>退款请求</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

<form method="post" action="${ctx }/wepay/demo/refund/sign" id="paySignForm">

    <ul class="form-wrap" id="J-form-wrap">

        <li class="form-item form-item-border clearfix">
            <label>接口版本</label>

            <div class="form-field">
                <input type="text" class="" name="version" value="1.0" autocomplete="off"
                        minlength="15" maxlength="18" data-callback="input.status"/>
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
            <label>交易号</label>

            <div class="form-field">
                <input type="text" class="" name="tradeNum" value="<c:out value="${tradeNum}"/>" autocomplete="off"
                       placeholder="请输入交易号" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>原交易号</label>

            <div class="form-field">
                <input type="text" class="" name="oTradeNum" value="" autocomplete="off"
                       placeholder="请输入原交易号" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>交易日期</label>

            <div class="form-field">
                <input type="text" class="" name="tradeDate" value="<fmt:formatDate value="${nowTime}" pattern="yyyyMMdd"/>" autocomplete="off"
                       placeholder="请输入交易日期" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>交易时间</label>

            <div class="form-field">
                <input type="text" class="" name="tradeTime" value="<fmt:formatDate value="${nowTime}" pattern="HHmmss"/>" autocomplete="off"
                       placeholder="请输入交易时间" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>


        <li class="form-item form-item-border clearfix">
            <label>交易金额</label>

            <div class="form-field">
                <input type="text" class="" name="tradeAmount" value="1" autocomplete="off"
                       placeholder="请输入交易金额" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>货币种类</label>

            <div class="form-field">
                <input type="text" class="" name="tradeCurrency" value="CNY" autocomplete="off"
                       placeholder="请输入交易币种" minlength="15" maxlength="50" data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>异步通知</label>

            <div class="form-field">
                <input type="text" class="" name="tradeNotice" value=""
                       autocomplete="off" placeholder="请输入异步通知地址" minlength="15" maxlength="200"
                       data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <li class="form-item form-item-border clearfix">
            <label>交易备注</label>

            <div class="form-field">
                <input type="text" class="" name="tradeNote" value=""
                       autocomplete="off" placeholder="交易备注" minlength="15" maxlength="200"
                       data-callback="input.status"/>
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>

        <div class="grid96">
            <a href="javascript:;" id="J-next-btn" class="btn btn-disabled mt15 btn-actived">提交</a>
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
