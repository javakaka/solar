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
<title>编辑商家</title>
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
	var ID ="";
	var C_NAME ="";
	var TYPE ="";
	var PROVINCE ="";
	var CITY ="";
	var REGION ="";
	var LINK_NAME ="";
	var LINK_TEL ="";
	var LONGITUDE ="";
	var LATITUDE ="";
	var ADDRESS ="";
	var STAR ="";
	var AVERAGE_COST ="";
	var REMARK ="";
	var DETAIL ="";//CONTENT
	function checkForm()
	{
		ID =$("#ID").val();
		C_NAME =$("#C_NAME").val();
		TYPE =$("#TYPE").val();
		PROVINCE =$("#PROVINCE").val();
		CITY =$("#CITY").val();
		REGION =$("#REGION").val();
		LINK_NAME =$("#LINK_NAME").val();
		LINK_TEL =$("#LINK_TEL").val();
		LONGITUDE =$("#LONGITUDE").val();
		LATITUDE =$("#LATITUDE").val();
		ADDRESS =$("#LATITUDE").val();
		STAR =$("#STAR").val();
		AVERAGE_COST =$("#AVERAGE_COST").val();
		REMARK =$("#REMARK").val();
		DETAIL =$("#editor").val();
		if(typeof ID == "undefined" || ID == "")
		{
			$.message("error","编号不能为空");
			$("#ID").focus();
			return false;
		}
		if(typeof C_NAME == "undefined" || C_NAME == "")
		{
			$.message("error","名称不能为空");
			$("#C_NAME").focus();
			return false;
		}
		if(typeof TYPE == "undefined" || TYPE == "")
		{
			$.message("error","商家分类不能为空");
			$("#TYPE").focus();
			return false;
		}
		if(typeof PROVINCE == "undefined" || PROVINCE == "")
		{
			$.message("error","请选择省份");
			$("#PROVINCE").focus();
			return false;
		}
		if(typeof CITY == "undefined" || CITY == "")
		{
			$.message("error","请选择城市");
			$("#CITY").focus();
			return false;
		}
		if(typeof LINK_NAME == "undefined" || LINK_NAME == "")
		{
			$.message("error","联系人姓名不能为空");
			$("#LINK_NAME").focus();
			return false;
		}
		if(typeof LINK_TEL == "undefined" || LINK_TEL == "")
		{
			$.message("error","联系人电话不能为空");
			$("#LINK_TEL").focus();
			return false;
		}
		if(typeof LONGITUDE == "undefined" || LONGITUDE == "")
		{
			$.message("error","请填写经度");
			$("#LONGITUDE").focus();
			return false;
		}
		if(typeof LATITUDE == "undefined" || LATITUDE == "")
		{
			$.message("error","请填写纬度");
			$("#LATITUDE").focus();
			return false;
		}
		if(typeof ADDRESS == "undefined" || ADDRESS == "")
		{
			$.message("error","请填详细地址");
			$("#ADDRESS").focus();
			return false;
		}
		if(typeof STAR == "undefined" || STAR == "")
		{
			$.message("error","请填星级");
			$("#STAR").focus();
			return false;
		}
		return true;
	}

	function submit()
	{
		//alert('submit');
		/**/
		C_NAME =$("#C_NAME").val();
		ID =$("#ID").val();
		TYPE =$("#TYPE").val();
		PROVINCE =$("#PROVINCE").val();
		CITY =$("#CITY").val();
		REGION =$("#REGION").val();
		LINK_NAME =$("#LINK_NAME").val();
		LINK_TEL =$("#LINK_TEL").val();
		LONGITUDE =$("#LONGITUDE").val();
		LATITUDE =$("#LATITUDE").val();
		ADDRESS =$("#LATITUDE").val();
		STAR =$("#STAR").val();
		AVERAGE_COST =$("#AVERAGE_COST").val();
		REMARK =$("#REMARK").val();
		DETAIL =$("#editor").val();
		//REMARK =$("#editor").val();
		//alert(REMARK);
		var params={ID: ID,C_NAME: C_NAME,TYPE: TYPE,PROVINCE_ID: PROVINCE,CITY_ID: CITY,ZONE_ID: REGION,LINK_NAME: LINK_NAME,LINK_TEL: LINK_TEL,LONGITUDE: LONGITUDE,LATITUDE: LATITUDE,ADDRESS: ADDRESS,STAR: STAR,REMARK: REMARK,DETAIL: DETAIL,AVERAGE_COST: AVERAGE_COST}
		$.ajax({
				url: "<%=basePath%>cxhlpage/platform/shop/profile/save.do",
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
	
	var province_select =$("#PROVINCE");
	var city_select =$("#CITY");
	var region_select =$("#REGION");

	province_select.change(function(){
		var province_id =$("#PROVINCE").val();
		if(typeof province_id == "undefined" || province_id =="" )
		{
			$.message("error","请先选择省份!");
			return false;
		}
		var url ="<%=basePath%>system/zone/cityOfProvince.do";
		var params ={id:province_id};
		$.ajax({
				url: url,
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
				},
				success: function(data, textStatus) {
					var city_list =data.oForm.CITY_LIST;
					city_select.html("");
					var option_html ="";
					option_html +="<option value='' >请选择...</option>";
					$.each(city_list,function(i,item){
						option_html +="<option value=\""+item.ID+"\" >"+item.NAME+"</option>";
					});
					city_select.html(option_html);
					region_select.html("<option value='' >请选择...</option>");
				},
				complete: function (XMLHttpRequest, textStatus){
				},
				error: function (){
					$.message("error","处理出错");
				}
			});
	});

	city_select.change(function(){
		var city_id =$("#CITY").val();
		if(typeof city_id == "undefined" || city_id =="" )
		{
			return false;
		}
		var url ="<%=basePath%>system/zone/zoneOfCity.do";
		var params ={id:city_id};
		$.ajax({
				url: url,
				type: "POST",
				data: params,
				dataType: "json",
				cache: false,
				beforeSend: function (XMLHttpRequest){
					//alert('.....');
				},
				success: function(data, textStatus) {
					var zone_list =data.oForm.ZONE_LIST;
					region_select.html("");
					var option_html ="";
					option_html +="<option value='' >请选择...</option>";
					$.each(zone_list,function(i,zone){
						option_html +="<option value=\""+zone.ID+"\" >"+zone.NAME+"</option>";
					});
					region_select.html(option_html);
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					$.message("error","处理出错");
				}
			});
	});
	
});
</script>
</head>
<body>
	<div class="path">
		商家管理 &raquo; 添加商家
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table class="input">
		<tr>
			<th>
				<span class="requiredField">*</span>商家名称:
			</th>
			<td>
				<input type="text" id="ID" name="ID" class="hidden" maxlength="200" value="${row.ID }" />
				<input type="text" id="C_NAME" name="C_NAME" class="text" maxlength="200" value="${row.C_NAME }" />
			</td>
		</tr>
		<tr>
			<th>
				<span class="requiredField">*</span>商家分类:
			</th>
			<td>
			<select  id="TYPE" name="TYPE" class="text" style="width:190px;" >
				<option value="" selected>请选择...</option>
				<c:forEach items="${shop_type_list}" var="list" varStatus="status">
					<c:choose>
						<c:when test="${row.TYPE == list.ID }">
							<option value="${list.ID}" selected>${list.NAME}</option>
						</c:when>
						<c:otherwise>
							<option value="${list.ID}" >${list.NAME}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</td>
		</tr>
		<tr>
			<th>
				<span class="requiredField">*</span>省份:
			</th>
			<td>
				<select id="PROVINCE" name ="PROVINCE" style="width:190px;" >
					<option value="" >请选择...</option>
					<c:forEach items="${province_list}" var="province" varStatus="status">
						<c:choose>
						<c:when test="${row.PROVINCE_ID == province.ID}">
							<option value="${province.ID}" selected>${province.NAME}</option>
						</c:when>
						<c:otherwise>
							<option value="${province.ID}" >${province.NAME}</option>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</select>
				<span class="requiredField">*</span>城市:
				<select id="CITY" name ="CITY" style="width:190px;" >
						<option value="" >请选择...</option>
						<c:forEach items="${city_list}" var="city" varStatus="status">
							<c:choose>
								<c:when test="${row.CITY_ID == city.ID}">
									<option value="${city.ID}" selected>${city.NAME}</option>
								</c:when>
								<c:otherwise>
									<option value="${city.ID}" >${city.NAME}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					区域:
					<select id="REGION" name ="REGION" style="width:190px;" >
						<option value="" >请选择...</option>
							<c:forEach items="${zone_list}" var="zone" varStatus="status">
								<c:choose>
								<c:when test="${row.REGION_ID == city.ID}">
									<option value="${zone.ID}" selected>${zone.NAME}</option>
								</c:when>
								<c:otherwise>
									<option value="${zone.ID}" >${zone.NAME}</option>
								</c:otherwise>
							</c:choose>
							</c:forEach>
					</select>
			</td>
		</tr>
		
		<tr>
				<th>
					<span class="requiredField">*</span>联系人姓名:
				</th>
				<td>
					<input type="text" id="LINK_NAME" name="LINK_NAME" class="text" maxlength="200" value="${row.LINK_NAME }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>联系电话:
				</th>
				<td>
					<input type="text" id="LINK_TEL" name="LINK_TEL" class="text" maxlength="200" value="${row.LINK_TEL }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>地理位置经度:
				</th>
				<td>
					<input type="text" id="LONGITUDE" name="LONGITUDE" class="text" maxlength="200" value="${row.LONGITUDE }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>地理位置纬度:
				</th>
				<td>
					<input type="text" id="LATITUDE" name="LATITUDE" class="text" maxlength="200" value="${row.LATITUDE }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>详细地址:
				</th>
				<td>
					<input type="text" id="ADDRESS" name="ADDRESS" class="text" maxlength="200" value="${row.ADDRESS }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>星级:
				</th>
				<td>
					<select id="STAR" name ="STAR" style="width:190px;" >
						<c:choose>
							<c:when test="${row.STAR ==0 }">
								<option value="" >请选择...</option>
								<option value="0" selected>无星级</option>
								<option value="1" >一星</option>
								<option value="2" >二星</option>
								<option value="3" >三星</option>
								<option value="4" >四星</option>
								<option value="5" >五星</option>
							</c:when>
							<c:when test="${row.STAR ==1 }">
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" selected>一星</option>
								<option value="2" >二星</option>
								<option value="3" >三星</option>
								<option value="4" >四星</option>
								<option value="5" >五星</option>
							</c:when>
							<c:when test="${row.STAR ==2 }">
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" >一星</option>
								<option value="2" selected>二星</option>
								<option value="3" >三星</option>
								<option value="4" >四星</option>
								<option value="5" >五星</option>
							</c:when>
							<c:when test="${row.STAR == 3}">
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" >一星</option>
								<option value="2" >二星</option>
								<option value="3" selected>三星</option>
								<option value="4" >四星</option>
								<option value="5" >五星</option>
							</c:when>
							<c:when test="${row.STAR ==4 }">
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" >一星</option>
								<option value="2" >二星</option>
								<option value="3" >三星</option>
								<option value="4" selected>四星</option>
								<option value="5" >五星</option>
							</c:when>
							<c:when test="${row.STAR ==5 }">
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" >一星</option>
								<option value="2" >二星</option>
								<option value="3" >三星</option>
								<option value="4" >四星</option>
								<option value="5" selected>五星</option>
							</c:when>
							<c:otherwise>
								<option value="" >请选择...</option>
								<option value="0" >无星级</option>
								<option value="1" >一星</option>
								<option value="2" >二星</option>
								<option value="3" >三星</option>
								<option value="4" >四星</option>
								<option value="5" selected>五星</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>平均消费:
				</th>
				<td>
					<input type="text" id="AVERAGE_COST" name="AVERAGE_COST" class="text" maxlength="200" value="${row.AVERAGE_COST }" />
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>简要介绍:
				</th>
				<td>
					<textarea cols="50" rows="5" id="REMARK" name="REMARK" >${row.REMARK }</textarea>
				</td>
			</tr>
		<tr>
				<th>
					<span class="requiredField">*</span>详细图文介绍:
				</th>
				<td>
					<textarea id="editor" name="CONTENT" class="editor">${row.DETAIL }</textarea>
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