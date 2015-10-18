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
<title>添加WebPart</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	${flash_message}
	
	// 表单验证
	$inputForm.validate({
		rules: {
			WEBPART_TITLE: "required",
			WEBPART_URL: "required",
			MUST_SELECTED: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 添加WebPart
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>WEBPART标题:
				</th>
				<td>
					<input type="text" name="WEBPART_TITLE" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					必须选择:
				</th>
				<td>
					<select id="" name="" style="width:190px;">
						<option value="0" selected>可选</option>
						<option value="1">必选</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>WEBPART链接:
				</th>
				<td>
					<input type="text" name="WEBPART_URL" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					WEBPAR备注:
				</th>
				<td>
					<input type="text" name="WEBPART_NOTE" class="text" maxlength="200" />
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