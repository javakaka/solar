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
<title>添加用户</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
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
			TELEPHONE: {
				required: false,
				remote: {
					url: "<%=basePath%>cxhlpage/platform/member/profile/check_telephone.do",
					cache: false
				}
			},
			PASSWORD: "required",
			USERNAME: {
				required: false,
				remote: {
					url: "<%=basePath%>cxhlpage/platform/member/profile/check_user_name.do",
					cache: false
				}
			},
			INVITE_CODE: {
				required: false,
				remote: {
					url: "<%=basePath%>cxhlpage/platform/member/profile/check_invite_code.do",
					cache: false
				}
			}
		},
		messages:{
			TELEPHONE:{
				required: "手机号码不能为空",
				remote: "手机号码已存在，请使用其他手机号码"
			},
			PASSWORD:{
				required: "密码不能为空"
			},
			USERNAME:{
				required: "用户名已存在",
				remote: "此用户名已经存在，请使用其他用户名试试"
			},
			INVITE_CODE:{
				required: "",
				remote: "此邀请码不存在，请使用其他邀请码"
			},
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		用户管理 &raquo; 添加用户
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>手机号码:
				</th>
				<td>
					<input type="text" name="TELEPHONE" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>密码:
				</th>
				<td>
					<input type="text" name="PASSWORD" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					用户名:
				</th>
				<td>
					<input type="text" name="USERNAME" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			
			<tr>
				<th>
					姓名:
				</th>
				<td>
					<input type="text" name="NAME" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td>
					<select id="SEX" name ="SEX" style="width:190px;" >
						<option value="" selected>请选择...</option>
						<option value="1" >男</option>
						<option value="2" >女</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					邀请码:
				</th>
				<td>
					<input type="text" name="INVITE_CODE" class="text" maxlength="200" value=""  />
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