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
<title>修改中介用户信息</title>
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
			USERNAME: "required",
			TELEPHONE: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		中介用户 &raquo; 修改中介用户信息
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					用户名:
				</th>
				<td>
					<input type="text" name="USERNAME" class="text" maxlength="200" value="${row.USERNAME}" readonly/>
				</td>
			</tr>
			<tr>
				<th>
					真实姓名:
				</th>
				<td>
					<input type="text" name="NAME" class="text" maxlength="200" value="${row.NAME}" />
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td>
					<select id="SEX" name="SEX" class="text" maxlength="200" style="width:190px" >
					<c:choose>
							<c:when test="${row.SEX == 1}">
								<option >请选择...</option>
								<option value="1" selected>男</option>
								<option value="2" >女</option>
							</c:when>
							<c:when test="${row.SEX == 2}">
								<option >请选择...</option>
								<option value="1" >男</option>
								<option value="2" selected>女</option>
							</c:when>
							<c:otherwise>
								<option selected value="0">请选择...</option>
								<option value="1" >男</option>
								<option value="2" >女</option>
							</c:otherwise>
					</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					手机号码:
				</th>
				<td>
					<input type="text" name="TELEPHONE" class="text" maxlength="200" value="${row.TELEPHONE}"  readonly/>
				</td>
			</tr>
			<tr>
				<th>
					邮箱:
				</th>
				<td>
					<input type="text" name="EMAIL" class="text" maxlength="200" value="${row.EMAIL}"/>
				</td>
			</tr>
			<tr>
				<th>
					银行帐号:
				</th>
				<td>
					<input type="text" name="BANK_CARD_NO" class="text" maxlength="200" value="${row.BANK_CARD_NO}" />
				</td>
			</tr>
			<tr>
				<th>
					注册时间:
				</th>
				<td>
					<input type="text" name="REGISTER_TIME" class="text" maxlength="200" value="${row.REGISTER_TIME}" readonly/>
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