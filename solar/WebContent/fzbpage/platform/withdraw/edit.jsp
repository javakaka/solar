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
<title>编辑提现申请</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	${flash_message};
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required",
			NAME: {
				required: true,
				remote: {
					url: "<%=basePath%>system/zone/city/check_extra_name.do?ID=${row.ID}",
					cache: false
				}
			},
			STATE: "required",
			PROVINCEID: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 编辑提现申请
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID}" />
		<input type="hidden" id="USER_ID" name="USER_ID" class="text" maxlength="200" value="${row.USER_ID}" />
		<table class="input">
			<tr>
				<th>
					申请人姓名:
				</th>
				<td>
					${row.NAME}
				</td>
			</tr>
			<tr>
				<th>
					申请人电话:
				</th>
				<td>
					${row.TELEPHONE}
				</td>
			</tr>
			<tr>
				<th>
					提现金额:
				</th>
				<td>
					${row.MONEY}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>状态:
				</th>
				<td>
				<select id="STATUS" name="STATUS" class="text" style="width:190px;" >
					<c:choose>
							<c:when test="${row.STATUS==1}">
								<option value="">请选择...</option>
								<option value="1" selected>申请中</option>
								<option value="2">审核不通过</option>
								<option value="3">审核通过</option>
								<option value="4">已打款</option>
							</c:when>
							<c:when test="${row.STATUS==2}">
								<option value="">请选择...</option>
								<option value="1" >申请中</option>
								<option value="2" selected>审核不通过</option>
								<option value="3">审核通过</option>
								<option value="4">已打款</option>
							</c:when>
							<c:when test="${row.STATUS==3}">
								<option value="">请选择...</option>
								<option value="1" >申请中</option>
								<option value="2">审核不通过</option>
								<option value="3" selected>审核通过</option>
								<option value="4">已打款</option>
							</c:when>
							<c:when test="${row.STATUS==4}">
								<option value="">请选择...</option>
								<option value="1" >申请中</option>
								<option value="2">审核不通过</option>
								<option value="3">审核通过</option>
								<option value="4" selected>已打款</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >申请中</option>
								<option value="2">审核不通过</option>
								<option value="3">审核通过</option>
								<option value="4">已打款</option>
							</c:otherwise>
						</c:choose>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" id="REMARK" name="REMARK" class="text" maxlength="600" value="${row.REMARK}" style="width:400px;"/>
				</td>
			</tr>
			<tr>
				<th>
					申请时间:
				</th>
				<td>
					${row.CREATE_TIME}
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>