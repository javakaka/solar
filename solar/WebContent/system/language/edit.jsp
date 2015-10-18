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
<title><cc:message key="framework.language.edit"/></title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			LAN_NAME: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; <cc:message key="framework.language.edit"/>
	</div>
	<form id="inputForm" action="update.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span><cc:message key="framework.language.lan_no" />:
				</th>
				<td>
					<input type="text" name="LAN_NO" class="text" value="${ovo.LAN_NO}" maxlength="200" readonly/>
				</td>
			</tr>
			<tr>
				<th>
					<cc:message key="framework.language.lan_name" />:
				</th>
				<td>
					<input type="text" name="LAN_NAME" class="text" value="${ovo.LAN_NAME}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<cc:message key="framework.language.lan_state" />:
				</th>
				<td>
					<select name="LAN_STATE" class="text" maxlength="200">
						<c:choose>
							<c:when test="${row.LAN_STATE==1}">
								<option value="1" selected>有效</option>
								<option value="2">无效</option>
							</c:when>
							<c:otherwise>
								<option value="1" >有效</option>
								<option value="2" selected>无效</option>
							</c:otherwise>
						</c:choose>
					</select>
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