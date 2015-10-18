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

    <h1>查询结果</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

    <div class="noticeWrap grid94">
        提示信息: ${errorMsg}
        <br/>

        <c:forEach items="${viewList}" var="qrte">
            交易币种: ${qrte.tradeCurrency}
            交易日期:  ${qrte.tradeDate}
            交易时间:  ${qrte.tradeTime}
            交易金额:  ${qrte.tradeAmount} 分
            交易备注:  ${qrte.tradeNote}
            交易号:  ${qrte.tradeNum}
            交易状态  ${qrte.tradeStatus}
        </c:forEach>
    </div>


</div>


<!--submit btn start-->
<div class="grid94">
    <a href="javascript:history.go(-1);" id="J-next-btn" class="btn btn-actived mt15">返回</a>
</div>
<!--submit btn end-->

</body>
</html>
