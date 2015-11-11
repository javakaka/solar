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
<title>添加职位</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	
	${flash_message}
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: {
				required: true
			},
			TITLE: {
				required: true
			},
			WORKINGYEARS: "required",
			ADDRESS: "required",
			REQUIREMENT: "required"
		},
		messages:{
			ID:{
				required: "ID不能为空"
			},
			TITLE:{
				required: "职位名称不能为空"
			},
			WORKINGYEARS:{
				required: "工作年限不能为空"
			},
			ADDRESS:{
				required: "工作地点不能为空"
			},
			REQUIREMENT:{
				required: "资格要求不能为空"
			},
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		蓝波情报 &raquo; 编辑职位
	</div>
	<form id="inputForm" action="save.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID }" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>职位名称:
				</th>
				<td>
					<input type="text" name="TITLE" class="text" maxlength="200" value="${row.TITLE }" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>工作年限:
				</th>
				<td>
					<input type="text" name="WORKINGYEARS" class="text" maxlength="200" value="${row.WORKINGYEARS }" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>工作地点:
				</th>
				<td>
					<input type="text" name="ADDRESS" class="text" maxlength="200" value="${row.ADDRESS }"/>
				</td>
			</tr>
			
			<tr>
				<th>
					简介:
				</th>
				<td>
					<textarea name="DESCS" class="text"  rows="3" cols="50">${row.DESCS }</textarea>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>招聘要求:
				</th>
				<td>
					<textarea id="editor" name="REQUIREMENT" class="editor">${row.REQUIREMENT }</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" id="backButton" class="button" value="取消" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>