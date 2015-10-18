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
<title>支付配置</title>
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
			bank_type: "required",
			bank_no: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 支付配置
	</div>
	<form id="inputForm" action="SavePaySetting.do" method="post">
		<table class="input">
			<tr>
				<th>
					所属银行:
				</th>
				<td>
					<select id="bank_type" name="bank_type" class="text" maxlength="500" style="width:300px;">
						<c:choose>
							<c:when test="${bank_type == 1}">
								<option value="" >请选择...</option>
								<option value="1" selected>中国银行</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="1" >中国银行</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					平台支付帐号:
				</th>
				<td>
					<input type="bank_no" name="bank_no" class="text" maxlength="500"  style="width:300px;" value="${bank_no}"/>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<!-- <input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>