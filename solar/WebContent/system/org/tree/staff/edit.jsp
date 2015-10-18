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
<title>维护系统人员</title>
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
			REAL_NAME: "required",
			SITE_NO: "required",
			STAFF_NAME: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 系统人员信息编辑
	</div>
	<form id="inputForm" action="update.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>真实姓名:
				</th>
				<td>
					<input type="text" name="REAL_NAME" class="text" maxlength="200" value="${row.REAL_NAME}"/>
					<input type="hidden" name="PAGE_SITE_NO"  value="${site_no}"class="text" maxlength="200" />
					<input type="hidden" name="PAGE_POSI_NO" value="${posi_no}" class="text" maxlength="200" />
					<input type="hidden" name="STAFF_NO"  value="${row.STAFF_NO}"class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>所属部门:
				</th>
				<td>
					<select id="SITE_NO" name="SITE_NO" class="text" maxlength="200"  style="width:190px;">
						<option value="" selected>请选择...</option>
						<c:forEach items="${departs}" var="opts" varStatus="status">
							<c:choose>
								<c:when test="${row.SITE_NO == opts.SITE_NO}">
									<option value="${opts.SITE_NO}" selected>${opts.SITE_NAME}</option>
								</c:when>
								<c:otherwise>
									<option value="${opts.SITE_NO}">${opts.SITE_NAME}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>登录名:
				</th>
				<td>
					<input type="text" name="STAFF_NAME" class="text" maxlength="200" value="${row.STAFF_NAME}"/>
				</td>
			</tr>
			<!-- 
			<tr>
				<th>
					<span class="requiredField">*</span>密码:
				</th>
				<td>
					<input type="text" name="PASSWORD" class="text" maxlength="200" value="${row.PASSWORD}"/>
				</td>
			</tr>
			-->
			<tr>
				<th>
					权限等级:
				</th>
				<td>
					<input type="text" name="AUTH_LEVEL" class="text" maxlength="200" value="${row.AUTH_LEVEL}"/>
				</td>
			</tr>
			<tr>
				<th>
					人员顺序:
				</th>
				<td>
					<input type="text" name="STAFF_SEQ" class="text" maxlength="200" value="${row.STAFF_SEQ}"/>
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td>
					<select id="STATE" name="STATE" class="text" maxlength="200"   style="width:190px;">
						<c:choose>
								<c:when test="${row.STATE == 1}">
									<option value="1" selected>有效</option>
									<option value="0">无效</option>
								</c:when>
								<c:otherwise>
									<option value="1" >有效</option>
									<option value="0" selected>无效</option>
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