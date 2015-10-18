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
    <title>房租宝线上交租-订单支付失败</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${ctx }/res/wepay/css/base.css"/>
</head>
<body>

<div class="nav">
    <span class=" goback"><em></em></span>

    <h1>订单支付结果</h1>
</div>
<div class="nav-wrap"></div>

<div class="grid">

<form method="post" action="" id="paySignForm">
    <ul class="form-wrap" id="J-form-wrap">
			<li class="form-item form-item-border clearfix">
            <label>支付结果</label>
            <div class="form-field">
                ${order_no},支付失败
                <span class="clear-btn J-clear-btn">×</span>
            </div>
        </li>
    </ul>
</form>
</div>
</body>
</html>
