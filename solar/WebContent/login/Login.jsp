<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.UUID,java.net.URLEncoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String captchaId = UUID.randomUUID().toString();
String token = request.getParameter("token");
if(token == null || token.trim().length() == 0){
	token ="";
}
else
{
	token =URLEncoder.encode(token);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="" />
<meta name="copyright" content="" />
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/res/admin/css/login.css" rel="stylesheet" type="text/css" />
</head>
<BODY bgcolor="#EFEFEF">
<div class="login">
			<form id="loginForm" action="login.do" method="post">
				<table>
					<tr>
						<td width="190" rowspan="2" align="center" valign="bottom">
							<img src="<%=basePath%>/res/images/login_logo.gif" alt="WUP" />
						</td>
						<th>
							用户名:
						</th>
						<td>
							<input type="text" id="username" name="username" class="text" maxlength="20" />
						</td>
					</tr>
					<tr>
						<th>
							密码:
						</th>
						<td>
							<input type="password" id="password1" name="password1" class="text" maxlength="20" autocomplete="off" />
							<input type="hidden"   id="password"  name="password" />
							<input type="hidden"   id="token"  name="token" value="<%=token%>"/>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							验证码:
						</th>
						<td>
							<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" />
							<img id="captchaImage" class="captchaImage" src="<%=basePath%>include/ValidateCode.jsp?captchaId=<%=captchaId%>" title="验证码" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<label>
								<input type="checkbox" id="isRememberUsername" value="true" />
								记住用户名:
							</label>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th>
							&nbsp;
						</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='<%=basePath%>/'" /><input type="submit" class="loginButton" value="登录" />
						</td>
					</tr>
				</table>
				<div class="powered">COPYRIGHT © 2015-2020 烽火连三月营销策划有限公司 ALL RIGHTS RESERVED.</div>
				<div class="link">
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
				</div>
			</form>
		</div>
</BODY>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/md5.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/rsa.js"></script>
<script type="text/javascript">
	$().ready( function() {
		
		var $loginForm = $("#loginForm");
		var $enPassword = $("#enPassword");
		var $username = $("#username");
		var $password = $("#password1");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $isRememberUsername = $("#isRememberUsername");
		
		// 记住用户名
		if(getCookie("adminUsername") != null) {
			$isRememberUsername.prop("checked", true);
			$username.val(getCookie("adminUsername"));
			$password.focus();
		} else {
			$isRememberUsername.prop("checked", false);
			$username.focus();
		}
		
		// 更换验证码
		$captchaImage.click( function() {
			$captchaImage.attr("src", "<%=basePath%>include/ValidateCode.jsp?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
		});
		
		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if ($username.val() == "") {
				$.message("warn", "请输入用户名");
				return false;
			}
			if ($password.val() == "") {
				$.message("warn", "请输入密码");
				return false;
			}
			if ($captcha.val() == "") {
				$.message("warn", "请输入验证码");
				return false;
			}
			
			if ($isRememberUsername.prop("checked")) {
				addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("adminUsername");
			}
			var password=$password.val();
			var md5Pwd =hex_md5(password);
			$("#password").val(md5Pwd);
		});
	});
</script>
<script type="text/javascript">
	var errorMsg="${error}";
	var showTip=true;
	if(typeof errorMsg == "undefined" || errorMsg == "" || errorMsg==null || errorMsg=="null"){
		showTip=false;
	}
	if(showTip){
		$.message("warn", errorMsg);
	}
</script>
</HTML>
