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
<title>微信支付参数配置</title>
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
			app_id: "required",
			app_secret: "required",
			api_key: "required",
			mch_id: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 微信支付参数配置
	</div>
	<form id="inputForm" action="save-wx-pay-setting.do" method="post">
		<table class="input">
			<tr>
				<th>
					AppID(应用ID):
				</th>
				<td>
					<input type="text" name="app_id" class="text" maxlength="500" value="${app_id}" style="width:300px;"/>
					<input type="hidden" name="busi_type" class="text" value="${busi_type}" />
					<input type="hidden" name="iswitch" class="text" value="${iswitch}" />
				</td>
			</tr>
			<tr>
				<th>
					AppSecret(应用密钥):
				</th>
				<td>
					<input type="text" name="app_secret" class="text" maxlength="500" value="${app_secret}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					支付key:
				</th>
				<td>
					<input type="text" name="api_key" class="text" maxlength="500" value="${api_key}" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<th>
					商户编号:
				</th>
				<td>
					<input type="text" name="mch_id" class="text" maxlength="500" value="${mch_id}" style="width:300px;"/>
				</td>
			</tr>
			<!--
			<tr>
				<th>
					是否开放微信支付:
				</th>
				<td>
					<select id="iswitch" name="iswitch" class="text" style="width:290px;">
						<c:choose>
							<c:when test="${iswitch =='1'}">
								<option value="1" selected>开放</option>
								<option value="0" >关闭</option>
							</c:when>
							<c:when test="${iswitch =='0'}">
								<option value="1" >开放</option>
								<option value="0" selected>关闭</option>
							</c:when>
						</c:choose>
					</select>
				</td>
			</tr>
			-->
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