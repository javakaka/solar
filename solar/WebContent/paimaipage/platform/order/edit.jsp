<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑订单信息</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	
	//[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required",
			MONEY: "required"
		},
		messages:{
			MONEY:{
				required: "订单金额不能为空"
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		订单管理 &raquo; 编辑订单信息
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					用户姓名:
				</th>
				<td>
					${row.USERNAME}
				</td>
			</tr>
			<tr>
				<th>
					用户手机:
				</th>
				<td>
					${row.TELEPHONE}
				</td>
			</tr>
			<tr>
				<th>
					订单编号:
				</th>
				<td>
					<input type="text" name="ORDER_NO" class="text" maxlength="200" value="${row.ORDER_NO}" readonly/>
				</td>
			</tr>
			<tr>
				<th>
					订单金额:
				</th>
				<td>
					<input type="text" name="MONEY" class="text" maxlength="200" value="${row.MONEY}"/>
				</td>
			</tr>
			<tr>
				<th>
					已支付金额:
				</th>
				<td>
					<input type="text" name="PAY_MONEY" class="text" maxlength="200" value="${row.PAY_MONEY}"/>
				</td>
			</tr>
			<tr>
				<th>
					退款金额:
				</th>
				<td>
					<input type="text" name="RETURN_MONEY" class="text" maxlength="200" value="${row.RETURN_MONEY}"/>
				</td>
			</tr>
			<tr>
				<th>
					支付方式:
				</th>
				<td>
					<select id="PAY_TYPE" name ="PAY_TYPE" style="width:190px;" >
					<c:choose>
						<c:when test="${row.PAY_TYPE == 1}">
							<option value="" >未付款</option>
							<option value="1" selected>微信</option>
							<option value="2" >支付宝</option>
						</c:when>
						<c:when test="${row.PAY_TYPE == 2}">
							<option value="" >未付款</option>
							<option value="1" >微信</option>
							<option value="2" selected>支付宝</option>
						</c:when>
						<c:otherwise>
							<option value="" selected>未付款</option>
							<option value="1" >微信</option>
							<option value="2" >支付宝</option>
						</c:otherwise>
					</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td>
					<select id="STATE" name ="STATE" style="width:190px;" >
					<c:choose>
						<c:when test="${row.STATE == 0}">
							<option value="0" selected>已退货</option>
							<option value="1" >待付款</option>
							<option value="2" >已付款</option>
							<option value="3" >已到账</option>
						</c:when>
						<c:when test="${row.STATE == 1}">
							<option value="0" selected>已退货</option>
							<option value="1" >待付款</option>
							<option value="2" >已付款</option>
							<option value="3" >已到账</option>
						</c:when>
						<c:when test="${row.STATE == 2}">
							<option value="0" selected>已退货</option>
							<option value="1" >待付款</option>
							<option value="2" >已付款</option>
							<option value="3" >已到账</option>
						</c:when>
						<c:when test="${row.STATE == 3}">
							<option value="0" selected>已退货</option>
							<option value="1" >待付款</option>
							<option value="2" >已付款</option>
							<option value="3" >已到账</option>
						</c:when>
						<c:otherwise>
							<option value="" selected>请选择...</option>
							<option value="0" >已退货</option>
							<option value="1" >待付款</option>
							<option value="2" >已付款</option>
							<option value="3" >已到账</option>
						</c:otherwise>
					</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>