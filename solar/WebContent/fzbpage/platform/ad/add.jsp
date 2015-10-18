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
<title>添加广告</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	//[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			NAME: {
				required: true,
				remote: {
					url: "<%=basePath%>fzbpage/platform/ad/check_name.do",
					cache: false
				}
			},
			PICTURE: "required",
			START_TIME: "required",
			END_TIME: "required",
			PASSWORD: "required"
		}
	});
	
	KindEditor.ready(function(K) {
		$("input[id^='uploadButton_']").each(function(i,v){
			var obj = this;
			var index=i;
			var uploadbutton = K.uploadbutton({
				button : obj,
				fieldName : 'file',
				url : framework.base + "/upload/file/upload.do",
				afterUpload : function(data) {
					var m_type =data.message.type;
					var m_content =data.message.content;
					if (m_type =="success") {
						var url = K.formatUrl(data.url, 'absolute');
						K('#PICTURE').val(url);
					} else {
						$.message(m_type,m_content);
					}
				},
				afterError : function(str) {
					$.message("error","上传图片出错:"+ str);
				}
			});
			uploadbutton.fileBox.change(function(e) {
				uploadbutton.submit();
			});
		});
	});

});
</script>
</head>
<body>
	<div class="path">
		广告管理 &raquo; 添加广告
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>广告名称:
				</th>
				<td>
					<input type="text" id="NAME" name="NAME" class="text" maxlength="200"/>
					<input type="hidden" name="TYPE_ID" class="text" maxlength="200" value="1" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>广告图片:
				</th>
				<td>
					<input type="text" id="PICTURE" name="PICTURE" class="text" maxlength="200" readonly />
					<input type="button" id="uploadButton_0" value="上传" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>开始时间:
				</th>
				<td>
					<input type="text" id="START_TIME" name="START_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker();" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>到期时间:
				</th>
				<td>
					<input type="text" id="END_TIME" name="END_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker();" />
				</td>
			</tr>
			<tr>
				<th>
					广告图片宽度:
				</th>
				<td>
					<input type="text" name="WIDTH" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					广告图片高度:
				</th>
				<td>
					<input type="text" name="HEIGHT" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					状态:
				</th>
				<td>
					<select id="STATUS" name="STATUS" style="width:190px;" maxlength="200" >
						<option value="1" selected>启用</option>
						<option value="2" >停用</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					广告详情:
				</th>
				<td>
					<!--<input type="text" name="CONTENT" class="text" maxlength="200" />-->
					<textarea id="editor" name="CONTENT" class="editor"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>