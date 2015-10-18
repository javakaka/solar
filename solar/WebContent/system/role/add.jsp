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
<title><cc:message key="framework.moudle.add"/></title>
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
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ROLE_NAME: "required",
			STATE: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; <cc:message key="framework.moudle.add"/>
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>角色名称:
				</th>
				<td>
					<input type="text" name="ROLE_NAME" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					请选择区域:
				</th>
				<td>
					<select id="BUREAU_NO" name="BUREAU_NO" class="text" maxlength="200"  style="width:190px;">
						<option value="" selected>请选择...</option>
						<c:forEach items="${bureau}" var="row" varStatus="status">
							<option value="${row.BUREAU_NO}">${row.BUREAU_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					请选择状态:
				</th>
				<td>
					<select id="STATE" name="STATE" class="text" maxlength="200"  style="width:190px;">
						<option value="1" selected>有效</option>
						<option value="0">无效</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					有效期起始时间:
				</th>
				<td>
					<input type="text" name="ROLE_BEGINTIME" maxlength="200" class="text Wdate" value="" onfocus="WdatePicker();" />
				</td>
			</tr>
			<tr>
				<th>
					有效期结束时间:
				</th>
				<td>
					<input type="text" name="ROLE_ENDTIME" maxlength="200" class="text Wdate" value="" onfocus="WdatePicker();"/>
				</td>
			</tr>
			<tr>
				<th>
					功能简介:
				</th>
				<td>
					<input type="text" name="ROLE_DESC" class="text" maxlength="200" />
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