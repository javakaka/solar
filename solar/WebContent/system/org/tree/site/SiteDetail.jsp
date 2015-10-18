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
<title>部门信息维护</title>
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
			name: "required",
			num: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo;部门详情
	</div>
	<form id="inputForm"  method="post">
		<table class="input">
			<tr>
				<th>
					部门名称:
				</th>
				<td>
					<input type="text" name="SITE_NAME" value="${row.SITE_NAME}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					上级部门:
				</th>
				<td>
					<select id="UP_SITE_NO" name="UP_SITE_NO" class="text" maxlength="200"   style="width:190px;">
						<option value="" selected>请选择...</option>
						<c:forEach items="${departs}" var="opt" varStatus="status">
							<c:choose>
								<c:when test="${row.UP_SITE_NO == opt.SITE_NO}">
									<option value="${opt.SITE_NO}" selected>${opt.SITE_NAME}</option>
								</c:when>
								<c:otherwise>
									<option value="${opt.SITE_NO}" >${opt.SITE_NAME}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					部门地址:
				</th>
				<td>
					${row.ADDR}
				</td>
			</tr>
			<tr>
				<th>
					联系电话:
				</th>
				<td>
					${row.RELA_PHONE}
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td>
				<c:choose>
								<c:when test="${row.STATE == 1}">
									有效
								</c:when>
								<c:when test="${row.STATE == 0}">
									无效
								</c:when>
								<c:otherwise>
									－－
								</c:otherwise>
							</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<textarea >${row.NOTES}</textarea>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>