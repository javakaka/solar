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
<title><cc:message key="framework.moudle.edit"/></title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			BUREAU_NO: "required",
			BUREAU_NAME: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; <cc:message key="framework.moudle.edit"/>
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" name="BUREAU_NO" value="${bureau.BUREAU_NO}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>区域名称:
				</th>
				<td>
					<input type="text" name="BUREAU_NAME" class="text" value="${bureau.BUREAU_NAME}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					地址:
				</th>
				<td>
					<input type="text" name="AREA_CODE" class="text" value="${bureau.AREA_CODE}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					联系方式:
				</th>
				<td>
					<input type="text" name="LINKS" class="text" value="${bureau.LINKS}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" name="NOTES" class="text" value="${bureau.NOTES}" maxlength="200" />
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