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
	//[@flash_message /]
	${flash_message}
	// 表单验证
	$inputForm.validate({
		rules: {
			TELEPHONE: {
				required: true,
				remote: {
					url: "<%=basePath%>fzbpage/platform/user/check_telephone.do",
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
					url: "<%=basePath%>fzbpage/platform/user/check_email.do",
					cache: false
				}
			},
			ID_CARD_NO: {
				required: false,
				remote: {
					url: "<%=basePath%>fzbpage/platform/user/check_id_card_no.do",
					cache: false
				}
			},
			TYPE: "required",
			BANK_CARD_NO:{
				required: false,
				number:true
			},
			CREDIT_CARD_NO:{
				required: false,
				number:true
			},
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
		   TYPE: {
			required: "请选择用户类型"
		   },
		   BANK_CARD_NO:{
		   number: "请输入合法的数字"
		   },
		   CREDIT_CARD_NO:{
		   number: "请输入合法的数字"
		   }
		  }
	});
});
</script>
</head>
<body>
	<div class="path">
		房东租客 &raquo; 添加用户
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>手机号码:
				</th>
				<td>
					<input type="text" id="TELEPHONE" name="TELEPHONE" class="text" maxlength="200" value=""  />
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
					<span class="requiredField">*</span>类型:
				</th>
				<td>
					<select id="TYPE" name="TYPE" class="text" maxlength="200"  style="width:190px;">
						<option value="" selected>请选择...</option>
						<option value="1" >房东</option>
						<option value="2" >租客</option>
						<option value="3" >房东|租客</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					用户名:
				</th>
				<td>
					<input type="text" id="USERNAME" name="USERNAME" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					真实姓名:
				</th>
				<td>
					<input type="text" id="NAME" name="NAME" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input type="text" id="EMAIL" name="EMAIL" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					身份证号码:
				</th>
				<td>
					<input type="text" id="ID_CARD_NO" name="ID_CARD_NO" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					收款帐号:
				</th>
				<td>
					<input type="text" id="BANK_CARD_NO" name="BANK_CARD_NO" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					付款帐号:
				</th>
				<td>
					<input type="text" id="CREDIT_CARD_NO" name="CREDIT_CARD_NO" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					收货地址:
				</th>
				<td>
					<textarea id="ADDRESS" name="ADDRESS" class="text" ></textarea>
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