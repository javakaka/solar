<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>网银+</title>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>

<div class="nav">
    <span class="arrow goback"><em></em></span>

    <h1>退款结果</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

    <div class="noticeWrap grid94">
        提示信息: ${errorMsg}
        <br/>
        <c:if test="${resultData ne null}">
            交易币种: ${resultData.tradeCurrency}
            交易日期:  ${resultData.tradeDate}
            交易时间:  ${resultData.tradeTime}
            交易金额:  ${resultData.tradeAmount} 分
            交易备注:  ${resultData.tradeNote}
            交易号:  ${resultData.tradeNum}
            交易状态  ${resultData.tradeStatus}
        </c:if>
    </div>


</div>


<!--submit btn start-->
<div class="grid94">
    <a href="javascript:history.go(-1);" id="J-next-btn" class="btn btn-actived mt15">返回</a>
</div>
<!--submit btn end-->

</body>
</html>
