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
<title>Sql日志详情</title>
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
		系统管理 &raquo;Sql日志详情
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" name="LOG_ID" value="${row.LOG_ID}" />
		<table class="input">
			<tr>
				<th>
					类型:
				</th>
				<td>
					<input type="hidden" name="ID" class="text" value="${row.ID}" maxlength="200" />
					<input type="text" name="TYPE" class="text" value="${row.TYPE}" maxlength="200" readonly />
				</td>
			</tr>
			<tr>
				<th>
					开始时间:
				</th>
				<td>
					<input type="text" name="START_TIME" class="text" value="${row.START_TIME}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					结束时间:
				</th>
				<td>
					<input type="text" name="END_TIME" class="text" value="${row.END_TIME}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					花费时间:
				</th>
				<td>
					<input type="text" name="SPEND_TIME" class="text" value="${row.SPEND_TIME}" maxlength="200"  style="width:90%;"/>
				</td>
			</tr>
			<tr>
				<th>
					SQL语句:
				</th>
				<td >
					<textarea name="SSQL" style="width:90%;height:150px;">${row.SSQL}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="printButton"class="button" value="打印" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>