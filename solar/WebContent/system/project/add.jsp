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
<title><cc:message key="framework.moudle.add"/></title>
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
			PROJECT_NAME: "required",
			PROJECT_DESC: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		系统管理 &raquo;添加项目
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>项目名称:
				</th>
				<td>
					<input type="text" name="PROJECT_NAME" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					项目英文名称:
				</th>
				<td>
					<input type="text" name="PROJECT_ENAME" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>项目简介:
				</th>
				<td>
					<input type="text" name="PROJECT_DESC" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					开始日期:
				</th>
				<td>
					<input type="text" name="BEGIN_DATE" class="text" maxlength="200" onfocus="WdatePicker();" />
				</td>
			</tr>
			<tr>
				<th>
					预估周期（天）:
				</th>
				<td>
					<input type="text" name="DAYS" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					开发公司:
				</th>
				<td>
					<input type="text" name="COMPANY" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					客户名称:
				</th>
				<td>
					<input type="text" name="CUSTOMER" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					关于我们:
				</th>
				<td>
					<input type="text" name="ABOUT_US" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					联系我们:
				</th>
				<td>
					<input type="text" name="CONTACT" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					服务理念:
				</th>
				<td>
					<input type="text" name="SERVICES" class="text" maxlength="200" />
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