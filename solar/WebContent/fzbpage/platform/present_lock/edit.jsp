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
<title>编辑赠送门锁信息</title>
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
			DEPART_ID: "required",
			NAME: "required",
			PASSWORD: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo; 编辑赠送门锁信息
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					租客姓名:
				</th>
				<td>
					${row.USER_NAME}
				</td>
			</tr>
			<tr>
				<th>
					租客手机:
				</th>
				<td>
					${row.USER_TELEPHONE}
				</td>
			</tr>

			<tr>
				<th>
					赠送状态:
				</th>
				<td>
				<select id="PRESENT_STATUS" name="PRESENT_STATUS" style="width:190px;" >
					<c:choose>
							<c:when test="${row.PRESENT_STATUS=='0' }">
								<option value="0" selected>未赠送</option>
								<option value="1">已赠送</option>
							</c:when>
							<c:when test="${row.PRESENT_STATUS=='1' || row.STATUS=='4'}">
								<option value="0">未赠送</option>
								<option value="1" selected>已赠送</option>
							</c:when>
							<c:otherwise>
								<option value="0" selected>未赠送</option>
								<option value="1">已赠送</option>
							</c:otherwise>
					</c:choose>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					收货地址:
				</th>
				<td>
					<input type="text" id="ADDRESS" name="ADDRESS" class="text" maxlength="600" value="${row.ADDRESS}" style="width:400px;" />
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