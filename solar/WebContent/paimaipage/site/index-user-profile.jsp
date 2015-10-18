<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String from_user =request.getParameter("from_user");
if(from_user == null || from_user.replace(" ", "").length() == 0)
{
	from_user ="";
}
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title>修改个人信息</title>
  <meta name="description" content="修改个人信息" />
  <meta name="keywords" content="修改个人信息" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta content="telephone=no" name="format-detection">
  <meta name="apple-mobile-web-app-capable" content="修改个人信息">
  <meta name="apple-mobile-web-app-title" content="修改个人信息" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta content="telephone=no" name="format-detection" />
  <meta name="full-screen" content="yes" />
  <meta name="x5-fullscreen" content="true" /> 
  <link rel="Stylesheet" href="<%=basePath%>common/css/main.css" />
  <style type="text/css">body{background:white;}</style>
 </head>
 <body >
  <div id="main" class="wrapper white">
  <form id="form" action="save-user-profile.do" method="post">
  	<div class="user-profile-col">
  		<div class="left">姓名:</div>
  		<div class="right"><input name="username" id="username" type="text" value="${user.USERNAME}" /></div>
  	</div>
  	<div class="user-profile-col">
  		<div class="left">电话:</div>
  		<div class="right"><input name="telephone" id="telephone" type="text" value="${user.TELEPHONE}" /></div>
  	</div>
  	<div class="user-profile-col">
  		<div class="left">收货地址:</div>
  		<div class="right"><input name="address" id="address" type="text" value="${user.ADDRESS}" /></div>
  	</div>
  	<div class="user-profile-col">
  		<div class="left">身份认证</div>
  		<div class="right"></div>
  	</div>
  	<div class="user-profile-col">
  		<div class="left">身份证号码:</div>
  		<div class="right">
			<input name="id_card_no" id="id_card_no" type="text" value="${user.ID_CARD_NO}" />
			<input name="id_card_upper_url" id="id_card_upper_url" type="hidden" value="${user.ID_CARD_UPPER_URL}" />
			<input name="id_card_bellow_url" id="id_card_bellow_url" type="hidden" value="${user.ID_CARD_BELLOW_URL}" />
			<input name="avatar" id="avatar" type="hidden" value="${user.AVATAR}" />
			<input name="from_user" id="id_card_bellow_url" type="hidden" value="${user.FROM_USER}" />
  		</div>
  	</div>
  	<div class="user-profile-card-col">
  		<div class="up">上传身份证扫描件或彩色图片</div>
  		<div class="down">
  			<div class="upload" ><img src="${user.ID_CARD_UPPER_URL}" style="width:75px;height:75px;" id="upperImg"/></div>
  			<div class="upload" ><img src="${user.ID_CARD_BELLOW_URL}" style="width:75px;height:75px;" id="downImg"/></div>
  			<div class="upload icon1" id="uploadButton_1"></div>
  			<div class="upload icon2" id="uploadButton_2"></div>
  		</div>
  	</div>
  	<div class="user-profile-card-col">
  		<div class="up">上传头像</div>
  		<div class="down">
  			<div class="upload" ><img src="${user.AVATAR}" style="width:75px;height:75px;" id="userAvatar"/></div>
  			<div class="upload icon2" id="uploadButton_3">上传</div>
  		</div>
  	</div>
  	<div class="user-profile-submit-col">
  		<div class="label">提交后我们将会在1-3天内为您认证</div>
  		<div class="submit" id="submitBtn">提交</div>
  	</div>
  	</form>
  </div>
  <script type="text/javascript" src="<%=basePath%>common/js/gloable.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/editor/kindeditor.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/http.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/layer/layer.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>common/js/index-user-profile.js"></script>
 </body>
 <script>
 </script>
</html>