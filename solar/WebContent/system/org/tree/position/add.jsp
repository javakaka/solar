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
<title>添加部门岗位</title>
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
			SITE_NAME: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo;添加岗位
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>岗位名称:
				</th>
				<td>
					<input type="text" name="POSI_NAME" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>所属部门:
				</th>
				<td>
					<select id="SITE_NO" name="SITE_NO" class="text" maxlength="200" >
						<option value="" selected>请选择...</option>
						<c:forEach items="${departs}" var="row" varStatus="status">
							<option value="${row.SITE_NO}">${row.SITE_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>上级岗位:
				</th>
				<td>
					<select id="UP_POSI_NO" name="UP_POSI_NO" class="text" maxlength="200" >
						<option value="" selected>请选择...</option>
						<c:forEach items="${positions}" var="row" varStatus="status">
							<option value="${row.POSI_NO}">${row.POSI_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					日常负责的工作:
				</th>
				<td>
					<input type="text" name="DAY_WORK" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					兼办的工作:
				</th>
				<td>
					<input type="text" name="PART_WORK" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					协助办理的工作:
				</th>
				<td>
					<input type="text" name="ASSISTANT_WORK" class="text" maxlength="200" />
				</td>
			</tr><tr>
				<th>
					偶然性工作:
				</th>
				<td>
					<input type="text" name="ACCIDENT_WORK" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					临时代理性工作:
				</th>
				<td>
					<input type="text" name="TEMPORAR_WORK" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					岗位人员数限制:
				</th>
				<td>
					<input type="text" name="STAFFNUMS" class="text" maxlength="200" value="0" />
				</td>
			</tr>
			<tr>
				<th>
					对应通用岗位:
				</th>
				<td>
					<select id="COMM_POSI_NO" name="COMM_POSI_NO" class="text" maxlength="200" >
						<option value="">请选择...</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td>
					<select id="STATE" name="STATE" class="text" maxlength="200" >
						<option value="1">有效</option>
						<option value="0">无效</option>
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