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
<title>拍品图片</title>
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
		var goods_show =$("#editor").val();
		if(typeof goods_show == "undefined" || goods_show == "")
		{
			goods_show ="";
		}
		var id =$("#id").val();
		if(typeof id == "undefined" || id == "")
		{
			$.message("error","编号不能为空");
			return false;
		}
		var params={id:id,goods_show:goods_show}
		$.ajax({
				url: "<%=basePath%>paimaipage/platform/auction/goods/saveGoodsShow.do",
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
<body >
	<form id="inputForm" action="" method="post">
	<input type="hidden" id="id" name="id" class="text" maxlength="200" value="${id}"/>
		<table class="input">
			<tr>
				<th>
					拍品缩图图（1张）:
				</th>
				<td>
					<input type="button" name="uploadBtn" id="uploadBtn" class="button" value="点击上传" onclick="upload()"/>
				</td>
			</tr>
			<c:forEach items="${dataset}" var="row" varStatus="status">
				<tr>
				<th>
				</th>
				<td>
					<img src="${row.PATH}" style="width:150px;height:150px;" />
				</td>
				</tr>
			</c:forEach>
			<tr>
				<th>
					拍品顶部图片（1张）:
				</th>
				<td>
					<input type="button" name="uploadBtn1" id="uploadBtn1" class="button" value="点击上传" onclick="uploadTop()"/>
				</td>
			</tr>
			<c:forEach items="${dataset2}" var="row" varStatus="status">
				<tr>
				<th>
				</th>
				<td>
					<img src="${row.PATH}" style="width:150px;height:150px;" />
				</td>
				</tr>
			</c:forEach>
			<tr>
				<th>
					拍品展示:
				</th>
				<td>
					<textarea id="editor" name="goods_show" class="editor">${goods_show}</textarea>
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
<script type="text/javascript">
var id =${id};
var deal_type ="goods_picture";
var type ="goods_picture";
var sub_type ="goods_picture";
var cover ="1";
var file_type ="*.jpg;*.png;*.gif";
var callback ="confirm";
function upload()
{
	if(typeof id =="undefined" || id== "")
	{
		alert("未选择拍品");
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

function uploadTop()
{
	deal_type ="goods_top_picture";
	type ="goods_top_picture";
	sub_type ="goods_top_picture";
	cover ="1";
	file_type ="*.jpg;*.png;*.gif";
	callback ="confirm";
	if(typeof id =="undefined" || id== "")
	{
		alert("未选择拍品");
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
	window.location.reload();
}
</script>
</html>