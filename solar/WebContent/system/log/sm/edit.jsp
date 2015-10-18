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
<title>管理日志详情</title>
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
			//title: "required",
			//articleCategoryId: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		系统管理 &raquo; 查看操作日志
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" name="LOG_ID" value="${row.LOG_ID}" />
		<table class="input">
			<tr>
				<th>
					人员:
				</th>
				<td>
					<input type="hidden" name="SATFF_NO" class="text" value="${row.SATFF_NO}" maxlength="200" />
					<input type="text" name="REAL_NAME" class="text" value="${row.REAL_NAME}" maxlength="200" readonly />
				</td>
			</tr>
			<tr>
				<th>
					部门:
				</th>
				<td>
					<input type="text" name="SITE_NO" class="text" value="${row.SITE_NO}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					岗位:
				</th>
				<td>
					<input type="text" name="POSI_NO" class="text" value="${row.POSI_NO}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					操作类型:
				</th>
				<td>
					<input type="text" name="OPERATE_TYPE" class="text" value="${row.OPERATE_TYPE}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					记录时间:
				</th>
				<td>
					<input type="text" name="LOG_TIME" class="text" value="${row.LOG_TIME}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					日志内容:
				</th>
				<td>
					<input type="text" name="CONTENT" class="text" value="${row.CONTENT}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="打印" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>