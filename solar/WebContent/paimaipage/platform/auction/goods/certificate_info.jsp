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
<title>证书展示</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	${flash_message}
	var $inputForm = $("#inputForm");
	var $submitButton = $("#submitButton");
	$submitButton.click(function(){
		var certificate_info =$("#editor").val();
		if(typeof certificate_info == "undefined" || certificate_info == "")
		{
			certificate_info ="";
		}
		var id =$("#id").val();
		if(typeof id == "undefined" || id == "")
		{
			$.message("error","编号不能为空");
			return false;
		}
		var params={id:id,certificate_info:certificate_info}
		$.ajax({
				url: "<%=basePath%>paimaipage/platform/auction/goods/saveCertificateInfo.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
				},
				success: function(ovo, textStatus) {
					$.message(ovo);
					var code =ovo.code;
					if(code >=0)
					{
						$.message("success","success");
					}
					else
					{
						$.message("error",ovo.msg);
					}
				},
				complete: function (XMLHttpRequest, textStatus){
				},
				error: function (){
					$.message("error","error");
				}
			});
	});
});
</script>
</head>
<body>
	<form id="inputForm" action="" method="post">
		<input type="hidden" id="id" name="id" class="text" maxlength="200"  value="${id}" />
		<table class="input">
			<tr>
				<th>
					详情:
				</th>
				<td>
					<textarea id="editor" name="certificate_info" class="editor">${certificate_info}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitButton"class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='list.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>