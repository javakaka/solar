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
<title>添加中介用户</title>
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
	${flash_message}
	// 表单验证
	$inputForm.validate({
		rules: {
			TELEPHONE: {
				required: true,
				remote: {
					url: "<%=basePath%>fzbpage/platform/agent/check_telephone.do",
					cache: false
				}
			},
			PASSWORD:{
				required: true,
				minlength: 6
		   },
			EMAIL: {
				required: false,
				email:true,
				remote: {
					url: "<%=basePath%>fzbpage/platform/agent/check_email.do",
					cache: false
				}
			},
			SEX: "required",
			BANK_CARD_NO:{
				required: false,
				number:true
			}
		},
		messages: {
		   TELEPHONE: "请输入手机号码",
		   EMAIL: {
			required: "请输入Email地址",
			email: "请输入正确的email地址"
		   },
		   PASSWORD: {
			required: "请输入密码",
			minlength: jQuery.format("密码不能小于{0}个字 符")
		   },
		   SEX: {
			required: "请选择用户性别"
		   },
		   BANK_CARD_NO:{
		   number: "请输入合法的数字"
		   }
		  }
	});
	
});
</script>
</head>
<body>
	<div class="path">
		中介用户 &raquo; 添加中介用户
	</div>
	<form id="inputForm" action="save.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>手机号码:
				</th>
				<td>
					<input type="text" name="TELEPHONE" class="text" maxlength="200" value=""  />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>登录密码:
				</th>
				<td>
					<input type="password" id="PASSWORD" name="PASSWORD" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					真实姓名:
				</th>
				<td>
					<input type="text" name="NAME" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td>
					<select id="SEX" name="SEX" class="text" maxlength="200" style="width:190px" >
								<option value="" selected>请选择...</option>
								<option value="1" >男</option>
								<option value="2" >女</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input type="text" name="EMAIL" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					银行帐号:
				</th>
				<td>
					<input type="text" name="BANK_CARD_NO" class="text" maxlength="200" value="" />
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