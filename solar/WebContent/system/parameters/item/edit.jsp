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
<title>静态参数值维护</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	//[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			FIELD_NAME: "required",
			ITEM_TITLE: "required",
			NOTES: "required",
			ONLY_VIEW: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		系统管理 &raquo;静态参数值维护
	</div>
	<form id="inputForm" action="update.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>静态参数名称:
				</th>
				<td>
					<input type="text" name="FIELD_ENAME" class="text" maxlength="200" value="${row.FIELD_ENAME}" readonly />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>字段值:
				</th>
				<td>
					<input type="text" name="USED_VIEW" class="text" maxlength="200" value="${row.USED_VIEW}" readonly />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>显示值:
				</th>
				<td>
					<input type="text" name="DISP_VIEW" class="text" maxlength="200" value="${row.DISP_VIEW}" />
				</td>
			</tr>
			<tr>
				<th>
					显示顺序:
				</th>
				<td>
					<input type="text" name="DISP_ORDER" class="text" maxlength="200" value="${row.DISP_ORDER}" />
				</td>
			</tr>
			<tr>
				<th>
					描述:
				</th>
				<td>
					<input type="text" name="NOTES" class="text" maxlength="200" value="${row.NOTES}" />
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