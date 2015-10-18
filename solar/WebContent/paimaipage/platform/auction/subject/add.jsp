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
<title>添加专场</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	${flash_message};
	
	var $inputForm = $("#inputForm");
	var $submitBtn = $("#submitBtn");
	$submitBtn.click(function(){
		var SESSION_NAME=$("#SESSION_NAME").val();
		var SUMMARY=$("#SUMMARY").val();
		var PRE_START_TIME=$("#PRE_START_TIME").val();
		var PRE_END_TIME=$("#PRE_END_TIME").val();
		var START_TIME=$("#START_TIME").val();
		var END_TIME=$("#END_TIME").val();
		var ICON_URL=$("#ICON_URL").val();
		if(typeof SESSION_NAME=="undefined" || SESSION_NAME== "")
		{
			$.message("error","专场名称不能为空");
			$("#SESSION_NAME").focus();
			return false;
		}
		if(typeof SUMMARY=="undefined" || SUMMARY== "")
		{
			$.message("error","简介不能为空");
			$("#SUMMARY").focus();
			return false;
		}
		if(typeof PRE_START_TIME=="undefined" || PRE_START_TIME== "")
		{
			$.message("error","预展开始时间不能为空");
			$("#PRE_START_TIME").focus();
			return false;
		}
		if(typeof PRE_END_TIME=="undefined" || PRE_END_TIME== "")
		{
			$.message("error","预展结束时间不能为空");
			$("#PRE_END_TIME").focus();
			return false;
		}
		if(typeof START_TIME=="undefined" || START_TIME== "")
		{
			$.message("error","拍卖开始时间不能为空");
			$("#START_TIME").focus();
			return false;
		}
		if(typeof END_TIME=="undefined" || END_TIME== "")
		{
			$.message("error","拍卖结束时间不能为空");
			$("#END_TIME").focus();
			return false;
		}
		if(typeof ICON_URL=="undefined" || ICON_URL== "")
		{
			$.message("error","请上传专场背景图片");
			$("#ICON_URL").focus();
			return false;
		}
		$inputForm.submit();
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
						if(index == 0 )
						{
							K('#ICON_URL').val(url);
							$("#icon_url_picture").attr("src",url);
						}
						else if(index == 1 )
						{
							K('#TOP_ICON_URL').val(url);
							$("#top_icon_url_picture").attr("src",url);
						}
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
		拍卖管理 &raquo; 添加专场
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>专场名称:
				</th>
				<td>
					<input type="text" id="SESSION_NAME" name="SESSION_NAME" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>专场背景图片:
				</th>
				<td>
					<input type="text" id="ICON_URL" name="ICON_URL" class="text" maxlength="200" readonly />
					<input type="button" id="uploadButton_0" value="上传" />
				</td>
			</tr>
			<tr>
				<th>
					
				</th>
				<td>
					<img src="" style="width:200px;height:200px;" id="icon_url_picture"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>专场顶部图片:
				</th>
				<td>
					<input type="text" id="TOP_ICON_URL" name="TOP_ICON_URL" class="text" maxlength="200" readonly />
					<input type="button" id="uploadButton_1" value="上传" />
				</td>
			</tr>
			<tr>
				<th>
					
				</th>
				<td>
					<img src="" style="width:200px;height:200px;" id="top_icon_url_picture"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>简介:
				</th>
				<td>
					<input type="text" id="SUMMARY"  name="SUMMARY" class="text" maxlength="200" value="" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>预展开始时间:
				</th>
				<td>
					<input type="text" id="PRE_START_TIME"  name="PRE_START_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>预展结束时间:
				</th>
				<td>
					<input type="text" id="PRE_END_TIME"  name="PRE_END_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>拍卖开始时间:
				</th>
				<td>
					<input type="text" id="START_TIME"  name="START_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>拍卖结束时间:
				</th>
				<td>
					<input type="text" id="END_TIME"  name="END_TIME" class="text Wdate" maxlength="200" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" class="button" id="submitBtn" value="<cc:message key="admin.common.submit" />" />
					<input type="button" id="backButton" class="button" value="<cc:message key="admin.common.back" />" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>