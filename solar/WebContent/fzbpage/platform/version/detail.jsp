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
<title>版本详情</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<SCRIPT src="<%=basePath%>/res/js/web.js"></SCRIPT>
<SCRIPT src="<%=basePath%>/res/js/Http.js"></SCRIPT>
</head>
<body >
	<div class="path">
		系统设置 &raquo; 版本详情
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
var deal_type ="fangzubao_app_file";
var type ="app_file";
var sub_type ="app_file";
var cover ="1";
var file_type ="*.apk;*.ipa";
var callback ="confirm";
function upload()
{
	if(typeof id =="undefined" || id== "")
	{
		alert("请先保存版本基本信息");
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
		var server_url ="<%=basePath%>fzbpage/platform/version/copyVersionFile.do";
		//id=1;
		var params ={id:id,deal_type:deal_type,type:type,sub_type:sub_type};
		//alert(params);
		$.ajax({url: "<%=basePath%>fzbpage/platform/version/copyVersionFile.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
					//alert('.....');
				},
				success: function(ovo, textStatus) {
					alert('已替换之前的下载文件');
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					//alert('error...');
				}
			});
}
</script>
</html>