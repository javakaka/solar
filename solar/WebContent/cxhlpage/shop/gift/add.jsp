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
<title>编辑商家礼品</title>
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
	
	
	var $submitBtn = $("#submitBtn");
	$submitBtn.click( function() {
		var isValid =checkForm();
		if(isValid)
		{
			submit();
		}
		return false;
	});
	//[@flash_message /]
	var NAME ="";
	var SHOP_ID ="";
	var TOTAL_NUM ="";
	var LINK_TEL ="";
	var ADDRESS ="";
	var REMARK ="";//CONTENT
	function checkForm()
	{
		NAME =$("#NAME").val();
		SHOP_ID =$("#SHOP_ID").val();
		TOTAL_NUM =$("#TOTAL_NUM").val();
		LINK_TEL =$("#LINK_TEL").val();
		ADDRESS =$("#ADDRESS").val();
		REMARK =$("#editor").val();
		if(typeof NAME == "undefined" || NAME == "")
		{
			$.message("error","名称不能为空");
			$("#NAME").focus();
			return false;
		}
		
		if(typeof TOTAL_NUM == "undefined" || TOTAL_NUM == "")
		{
			$.message("error","请填写总数量");
			$("#TOTAL_NUM").focus();
			return false;
		}
		if(typeof LINK_TEL == "undefined" || LINK_TEL == "")
		{
			$.message("error","请填写联系电话");
			$("#LINK_TEL").focus();
			return false;
		}
		if(typeof ADDRESS == "undefined" || ADDRESS == "")
		{
			$.message("error","请填写兑奖地址");
			$("#ADDRESS").focus();
			return false;
		}
		
		return true;
	}

	function submit()
	{
		NAME =$("#NAME").val();
		SHOP_ID =$("#SHOP_ID").val();
		TOTAL_NUM =$("#TOTAL_NUM").val();
		LINK_TEL =$("#LINK_TEL").val();
		ADDRESS =$("#ADDRESS").val();
		REMARK =$("#editor").val();
		if(typeof ADDRESS == "undefined" || ADDRESS == "")
		{
			ADDRESS ="";
		}
		if(typeof REMARK == "undefined" || REMARK == "")
		{
			REMARK ="";
		}
		var params={NAME: NAME,SHOP_ID: SHOP_ID,TOTAL_NUM: TOTAL_NUM,LINK_TEL: LINK_TEL,ADDRESS: ADDRESS,REMARK: REMARK}
		$.ajax({
				url: "<%=basePath%>cxhlpage/platform/shop/gift/save.do",
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
					//alert('.....');
				},
				success: function(ovo, textStatus) {
					var code =ovo.code;
					if(code >=0)
					{
						var v_id =ovo.oForm.ID;
						$("#ID").val(v_id);
						window.parent.enableTab("detail","detail.jsp?id="+v_id);
						window.parent.changeTabUrl("base","edit.do?id="+v_id);
						$.message("success","保存成功");
					}
					else
					{
						$.message("error",ovo.msg);
					}
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					alert('error...');
				}
			});
			
		//window.parent.enableTab("detail","detail.jsp?id=1");
	}
	
	
});
</script>
</head>
<body>
	<div class="path">
		商家管理 &raquo; 编辑商家礼品
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
		<tr>
			<th>
				<span class="requiredField">*</span>礼品名称:
			</th>
			<td>
				<input type="text" id="ID" name="ID" class="hidden" maxlength="200" value="" />
				<input type="text" id="NAME" name="NAME" class="text" maxlength="200" value="" />
			</td>
		</tr>
		<tr>
			<th>
				<span class="requiredField">*</span>请选择商家:
			</th>
			<td>
			<select  id="SHOP_ID" name="SHOP_ID" class="text" style="width:190px;" >
				<option value="" selected>请选择...</option>
				<c:forEach items="${shop_list}" var="row" varStatus="status">
					<option value="${row.ID}" >${row.C_NAME}</option>
				</c:forEach>
			</select>
		</td>
		</tr>
		
		<tr>
				<th>
					<span class="requiredField">*</span>数量:
				</th>
				<td>
					<input type="text" id="TOTAL_NUM" name="TOTAL_NUM" class="text" maxlength="200" value="" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>联系电话:
				</th>
				<td>
					<input type="text" id="LINK_TEL" name="LINK_TEL" class="text" maxlength="200" value="" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>兑奖地址:
				</th>
				<td>
					<input type="text" id="ADDRESS" name="ADDRESS" class="text" maxlength="200" value="" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>详细图文介绍:
				</th>
				<td>
					<textarea id="editor" name="CONTENT" class="editor"></textarea>
				</td>
				</td>
			</tr>
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" id="submitBtn" class="button" value="确定"/>
				<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='list.do'"/>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>