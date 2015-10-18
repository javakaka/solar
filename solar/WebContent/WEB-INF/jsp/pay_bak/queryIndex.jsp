<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>模拟商户--交易查询</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>
<div class="nav">
    <span class="arrow goback"><em></em></span>

    <h1>交易查询</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

<form method="post" action="${ctx }/wepay/demo/query/sign" id="queryTradeForm">

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
                <input type="text" class="" name="tradeNum" value="<c:out value=""/>" autocomplete="off"
                       placeholder="请输入交易号" minlength="15" maxlength="50"/>
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
            $('#queryTradeForm').submit();
        });

    })(Zepto);
</script>
</body>
</html>
