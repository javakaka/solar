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
<title>公司信息</title>
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
			NAME: "required",
			ADDRESS: "required",
			INTRODUCTION: "required",
			TEL: "required",
			EMAIL: {
				required: true,
				email: true
			},
			CONTACTNAME: "required",
			WEBSITE: "required",
			ZIPCODE: {
				required: true,
				maxlength: 10
			},
			
		},
		messages:{
			NAME:{
				required: "公司不能为空"
			},
			ADDRESS:{
				required: "公司地址不能为空"
			},
			INTRODUCTION:{
				required: "公司介绍不能为空"
			},
			TEL:{
				required: "联系电话不能为空"
			},
			EMAIL:{
				required: "邮箱不能为空",
				email: "请输入正确的邮箱"
			},
			CONTACTNAME:{
				required: "联系人姓名不能为空"
			},
			WEBSITE:{
				required: "网站地址不能为空"
			},
			ZIPCODE:{
				required: "邮编不能为空",
				maxlength: "长度不能超过10"
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		蓝波情报 &raquo; 公司信息
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>公司中文名称:
				</th>
				<td>
					<input type="text" name="NAME" class="text" maxlength="200" value="${row.NAME}" />
				</td>
			</tr>
			<tr>
				<th>
					公司英文名称:
				</th>
				<td>
					<input type="text" name="ENGLISHNAME" class="text" maxlength="200" value="${row.ENGLISHNAME}" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>地址:
				</th>
				<td>
					<input type="text" name="ADDRESS" class="text" maxlength="200" value="${row.ADDRESS}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>电话:
				</th>
				<td>
					<input type="text" name="TEL" class="text" maxlength="200" value="${row.TEL}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>邮箱:
				</th>
				<td>
					<input type="text" name="EMAIL" class="text" maxlength="200" value="${row.EMAIL}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>联系人:
				</th>
				<td>
					<input type="text" name="CONTACTNAME" class="text" maxlength="200" value="${row.CONTACTNAME}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>网站:
				</th>
				<td>
					<input type="text" name="WEBSITE" class="text" maxlength="200" value="${row.WEBSITE}"/>
				</td>
			</tr>
			<tr>
				<th>
					传真:
				</th>
				<td>
					<input type="text" name="FAX" class="text" maxlength="200" value="${row.FAX}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>邮编:
				</th>
				<td>
					<input type="text" name="ZIPCODE" class="text" maxlength="200" value="${row.ZIPCODE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>公司介绍:
				</th>
				<td>
					<textarea id="editor" name="INTRODUCTION" class="editor">${row.INTRODUCTION}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<!-- 
					<input type="button" id="backButton" class="button" value="返回" />
					-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>