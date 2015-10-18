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
<title>编辑拍品分类</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	${flash_message}
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required",
			TYPE_NAME: "required",
			STATE: "required",
			}
	});
});
</script>
</head>
<body>
	<div class="path">
		拍卖管理 &raquo; 编辑拍品分类
	</div>
	<form id="inputForm" action="update.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>分类名称:
				</th>
				<td>
					<input type="text" name="ID" class="hidden" maxlength="200" value="${row.ID }" />
					<input type="text" id="TYPE_NAME" name="TYPE_NAME" class="text" maxlength="200" value="${row.TYPE_NAME }" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<select id="STATE" name="STATE" style="width:190px;">
						<c:choose>
						<c:when test="${row.STATE == 1}">
							<option value=""  >请选择...</option>
						<option value="1" selected>启用</option>
						<option value="2" >停用</option>
						</c:when>
						<c:when test="${row.STATE == 2}">
							<option value=""  >请选择...</option>
						<option value="1" >启用</option>
						<option value="2" selected>停用</option>
						</c:when>
						<c:otherwise>
							<option value=""  selected>请选择...</option>
						<option value="1" >启用</option>
						<option value="2" >停用</option>
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
					<input type="submit" id="submitBtn" class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='list.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>