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
<title>修改密码</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/md5.js"></script>
<script type="text/javascript">
$().ready(function() {

	var oldPwd ="";
	var pwd ="";
	var rePwd ="";
	var $submitButton = $("#submitBtn");
	$submitButton.click( function() {
		 oldPwd =$("#old_password").val();
		 pwd =$("#password").val();
		 rePwd =$("#repassword").val();
		 if(typeof oldPwd == "undefined" || oldPwd =="")
		 {
			$.message("warn","请输入旧密码");
			$("#old_password").focus();
			return ;
		 }
		 if(typeof pwd == "undefined" || pwd =="")
		 {
			$.message("warn","请输入新密码");
			$("#password").focus();
			return ;
		 }
		 if(typeof rePwd == "undefined" || rePwd =="")
		 {
			$.message("warn","请确认新密码");
			$("#repassword").focus();
			return ;
		 }
		 if(pwd != rePwd)
		 {
			$.message("warn","两次输入的新密码不一致!");
			$("#password").focus();
			return ;
		 }
		 var md5_old_pwd =hex_md5(oldPwd);
		 var md5_pwd =hex_md5(pwd);
		 var url ="<%=basePath%>login/changePassword.do";
		 var params ={pwd:md5_old_pwd,new_pwd:md5_pwd};
		 $.ajax({
			url:url,
			type:"POST",
			data: params,
			dataType: "json",
			cache: false,
			beforeSend: function (XMLHttpRequest){
				//alert('.....');
			},
			success: function(msg, textStatus) {
				$.message(msg.type, msg.content);
			},
			complete: function (XMLHttpRequest, textStatus){
				//alert("complete...");
			},
			error: function (){
				$.message("error", "处理出错，请重试");
			}

		 });
	});
});
</script>
</head>
<body>
	<div class="path">
		<cc:message key="framework.nav.index" /> &raquo; 修改密码
	</div>
	<form id="inputForm" >
		<table class="input">
			<tr>
				<th>
					原密码:
				</th>
				<td>
					<input type="password" id="old_password" name="old_password" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					新密码:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					确认新密码:
				</th>
				<td>
					<input type="password" id="repassword" name="repassword" class="text" maxlength="200" value=""/>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitBtn" class="button" value="<cc:message key="admin.common.submit" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>