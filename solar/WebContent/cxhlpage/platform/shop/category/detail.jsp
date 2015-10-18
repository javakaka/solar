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
<title>商家分类图片</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script src="<%=basePath%>/res/js/web.js"></script>
<script src="<%=basePath%>/res/js/Http.js"></script>
</head>
<body >
	<div class="path">
		商家管理 &raquo; 商家分类图片
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					上传文件:
				</th>
				<td>
					<input type="button" name="uploadBtn" id="uploadBtn" class="button" value="点击上传" onclick="upload()"/>
				</td>
			</tr>
			
		</table>
	</form>
</body>
<script type="text/javascript">
var id =request("id");
var deal_type ="shop_type_icon";
var type ="shop_type_icon";
var sub_type ="shop_type_icon";
var cover ="1";
var file_type ="*.jpg;*.png;*.gif";
var callback ="confirm";
function upload()
{
	if(typeof id =="undefined" || id== "")
	{
		alert("请先保存基本信息");
		return false;
	}
	var url ="<%=basePath%>sysupload/Upload.jsp";
	url+="?deal_type="+deal_type;
	url+="&deal_code="+id;
	url+="&type="+type;
	url+="&sub_type="+sub_type;
	url+="&cover="+cover;
	url+="&file_type="+file_type;
	url+="&callback="+callback;
	window.open (url,'uploadwindow','height=400,width=680,top=200,left=200 ,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
}

//复制版本文件到下载目录
function confirm()
{
	
}
</script>
</html>