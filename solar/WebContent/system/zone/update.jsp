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
<title>地理数据更新</title>
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
		}
	});
	
	$updateBtn =$("#updateBtn");
	$updateBtn.click(function(){
		var url ="<%=basePath%>system/zone/makeGeograhpyFiles.do";
		var params ={};
		$.ajax({
			url: url,
			type: "POST",
			data: params,
			dataType: "json",
			cache: false,
			beforeSend: function (XMLHttpRequest){
			},
			success: function(ovo, textStatus) {
				var code =ovo.code;
				if(code >=0)
				{
					$.message("success","更新成功");
				}
				else
				{
					$.message("error",ovo.msg);
				}
			},
			complete: function (XMLHttpRequest, textStatus){
			},
			error: function (){
				$.message("error","处理出错");
			}
		});
	});
	
	$refreshButton =$("#refreshButton");
	$refreshButton.click(function(){
		window.location.reload();
	});
});
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo; 地理数据更新
	</div>
	<form id="inputForm" action="update.do" method="post">
		<table class="input">
			<tr>
				<th>
					地理数据文件路径:
				</th>
				<td>
					<a href="${geo_file_path }" alt="文件下载" target="_blank">省份城市数据下载(鼠标右键->另存为...)</a>
				</td>
			</tr>
			<tr>
				<th>
					文件版本时间戳:
				</th>
				<td>
					${version}
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					根据文件版本的时间戳，判断客户端是否需要更新地理数据文件<br/>
					<c:choose>
					<c:when test="${file_existed == 1}">指定目录存在数据文件</c:when>
					<c:when test="${file_existed == 0}"><font color="red">指定目录不存在数据文件，请点击"更新"按钮，更新文件</font></c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="updateBtn" class="button" value="更新文件" />
					<input type="button" id="refreshButton" class="button" value="刷新" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>