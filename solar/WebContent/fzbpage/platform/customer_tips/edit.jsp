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
<title>用户反馈详情</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	${flash_message};
	
	// 表单验证
	$inputForm.validate({
		rules: {
			ID: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 编辑用户反馈
	</div>
	<form id="inputForm" action="update.do" method="post">
		<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID}" />
		<table class="input">
			<tr>
				<th>
					标题:
				</th>
				<td>
					${row.TITLE }
				</td>
			</tr>
			<tr>
				<th>
					反馈内容:
				</th>
				<td>
					<textarea name="ASK_CONTENT" id="ASK_CONTENT" class="text"  rows="10" cols="100">${row.ASK_CONTENT }</textarea>
				</td>
			</tr>
			<!--
			<tr>
				<th>
					状态:
				</th>
				<td>
					<c:choose>
						<c:when test="${row.STATUS==0}">未回复</c:when>
						<c:when test="${row.STATUS==1}">已回复</c:when>
						<c:otherwise>--</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					回复内容:
				</th>
				<td>
					<textarea name="REPLY_CONTENT" id="REPLY_CONTENT" class="text"  rows="10" cols="100">${row.REPLY_CONTENT}</textarea>
				</td>
			</tr>
			-->
			<tr>
				<th>
					反馈时间:
				</th>
				<td>
					${row.CREATE_TIME}
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>