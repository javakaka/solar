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
<title>短信接口配置</title>
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
			url: "required",
			username: "required",
			password: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 短信接口配置
	</div>
	<form id="inputForm" action="SaveSmsSetting.do" method="post">
		<table class="input">
			<tr>
				<th>
					短信接口URL:
				</th>
				<td>
					<input type="text" name="url" class="text" maxlength="500" value="${url}" style="width:300px;"/>
					<input type="hidden" name="busi_type" class="text" value="${busi_type}" />
				</td>
			</tr>
			<tr>
				<th>
					短信接口用户名:
				</th>
				<td>
					<input type="text" name="username" class="text" maxlength="500" value="${username}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					短信接口用户密码:
				</th>
				<td>
					<input type="text" name="password" class="text" maxlength="500" value="${password}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					通道组编号不能为空:
				</th>
				<td>
					<input type="text" name="cgid" class="text" maxlength="500" value="${cgid}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					默认使用的签名编号:
				</th>
				<td>
					<input type="text" name="csid" class="text" maxlength="500" value="${csid}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					系统是否开放短信注册:
				</th>
				<td>
					<select id="sms_switch" name="sms_switch" class="text" style="width:290px;">
						<c:choose>
							<c:when test="${sms_switch =='1'}">
								<option value="1" selected>开放</option>
								<option value="0" >关闭</option>
							</c:when>
							<c:when test="${sms_switch =='0'}">
								<option value="1" >开放</option>
								<option value="0" selected>关闭</option>
							</c:when>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<!--
					<input type="button" id="backButton" class="button" value="返回" />
					-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>