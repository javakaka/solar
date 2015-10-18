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
<title>修改用户</title>
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
			DEPART_ID: "required",
			NAME: "required",
			PASSWORD: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo; 修改用户
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>部门:
				</th>
				<td>
					<select id="DEPART_ID" name="DEPART_ID" class="text" maxlength="200" >
						<option value="" selected>请选择...</option>
						<c:forEach items="${sites}" var="opt" varStatus="status">
							<c:choose>
							<c:when test="${row.DEPART_ID ==opt.SITE_NO }">
								<option value="${opt.SITE_NO}" selected>${opt.SITE_NAME}</option>
							</c:when>
							<c:otherwise>
								<option value="${opt.SITE_NO}">${opt.SITE_NAME}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					姓名:
				</th>
				<td>
					<input type="text" name="NAME" class="text" maxlength="200" value="${row.NAME}" />
					<input type="hidden" name="USERNAME" class="text" maxlength="200" value="${row.USERNAME}"/>
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type="text" name="PASSWORD" class="text" maxlength="200" value="${row.PASSWORD}" />
				</td>
			</tr>
			<tr>
				<th>
					手机:
				</th>
				<td>
					<input type="text" name="TELEPHONE" class="text" maxlength="200" value="${row.TELEPHONE}"/>
				</td>
			</tr>
			<tr>
				<th>
					性别:
				</th>
				<td>
					<select id="SEX" name="SEX" class="text" maxlength="200" >
					<c:if test="${row.SEX =='男'}">
						<option value="男" selected>男</option>
						<option value="女" >女</option>
					</c:if>
					<c:if test="${row.SEX == '女'}">
						<option value="男" >男</option>
						<option value="女" selected>女</option>
					</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					职位:
				</th>
				<td>
					<input type="text" name="POSITION" class="text" maxlength="200" value="${row.POSITION}"/>
				</td>
			</tr>
			<tr>
				<th>
					部门负责人:
				</th>
				<td>
					<select id="MANAGER_ID" name="MANAGER_ID" class="text" maxlength="200" >
						<c:if test="${row.MANAGER_ID == '否'}">
						<option value="否" selected>否</option>
						<option value="是" >是</option>
					</c:if>
					<c:if test="${row.MANAGER_ID == '是'}">
						<option value="否" >否</option>
						<option value="是" selected>是</option>
					</c:if>
					</select>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" name="REMARK" class="text" maxlength="200" value="${row.REMARK}"/>
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