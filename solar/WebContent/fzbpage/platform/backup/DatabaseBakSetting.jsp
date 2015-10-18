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
<title>数据库备份配置</title>
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
			db_name: "required",
			db_type: "required",
			base_path: "required",
			username: "required",
			password: "required"
		}
	});
	var $bakBtn =$("#bakBtn");
	$bakBtn.click(function(){
		var url ="<%=basePath%>fzbpage/platform/backup/backup.do";
		var params ={};
		$.ajax({
				url: url,
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
				},
				success: function(msg, textStatus) {
					var type="";
					$.message(msg.type,msg.content);
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					alert('error...');
				}
			});
	});
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 数据库备份配置
	</div>
	<form id="inputForm" action="SaveBakSetting.do" method="post">
	<input type="hidden" name="busi_type" class="text" maxlength="500"  style="width:300px;" value="${busi_type}"/>
		<table class="input">
			<tr>
				<th>
					数据库类型:
				</th>
				<td>
					<select id="db_type" name="db_type" class="text" maxlength="500" style="width:300px;">
						<c:choose>
							<c:when test="${db_type == 'mysql'}">
								<option value="" >请选择...</option>
								<option value="mysql" selected>Mysql</option>
								<option value="oracle" >Oracle</option>
								<option value="mssql" >Microsoft SQL Server</option>
							</c:when>
							<c:when test="${db_type == 'oracle'}">
								<option value="" >请选择...</option>
								<option value="mysql" >Mysql</option>
								<option value="oracle" selected>Oracle</option>
								<option value="mssql" >Microsoft SQL Server</option>
							</c:when>
							<c:when test="${db_type == 'mssql'}">
								<option value="" >请选择...</option>
								<option value="mysql" >Mysql</option>
								<option value="oracle" >Oracle</option>
								<option value="mssql" selected>Microsoft SQL Server</option>
							</c:when>
							<c:otherwise>
								<option value="" selected>请选择...</option>
								<option value="mysql" >Mysql</option>
								<option value="oracle" >Oracle</option>
								<option value="mssql" >Microsoft SQL Server</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					数据库名称:
				</th>
				<td>
					<input type="text" name="db_name" class="text" maxlength="500"  style="width:300px;" value="${db_name}"/>
				</td>
			</tr>
			<tr>
				<th>
					备份文件根路径:
				</th>
				<td>
					<input type="text" name="base_path" class="text" maxlength="500"  style="width:300px;" value="${base_path}"/>
				</td>
			</tr>
			<tr>
				<th>
					用户名:
				</th>
				<td>
					<input type="text" name="username" class="text" maxlength="500"  style="width:300px;" value="${username}"/>
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type="text" name="password" class="text" maxlength="500"  style="width:300px;" value="${password}"/>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="保存配置" />
					<input type="button" class="button" value="备份数据" id="bakBtn" name="bakBtn" />
					<!-- <input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />-->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>