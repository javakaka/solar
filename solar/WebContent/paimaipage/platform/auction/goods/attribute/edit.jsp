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
<title>编辑拍品属性</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	${flash_message}
	var $submitBtn = $("#submitBtn");
	$submitBtn.click( function() {
		var ID=$("#ID").val();
		var GOODS_ID=$("#GOODS_ID").val();
		var BRAND=$("#BRAND").val();
		var PRICE=$("#PRICE").val();
		var MATERIAL=$("#MATERIAL").val();
		var ORIGIN_PLACE=$("#ORIGIN_PLACE").val();
		var KIND=$("#KIND").val();
		var SHAPE=$("#SHAPE").val();
		var STYLE=$("#STYLE").val();
		var WEIGHT=$("#WEIGHT").val();
		var SIZE=$("#SIZE").val();
		var INSIDE_DIMESSION=$("#INSIDE_DIMESSION").val();
		var WIDTH=$("#WIDTH").val();
		var THICKNESS=$("#THICKNESS").val();
		var HAVE_CERTIFICATE=$("#HAVE_CERTIFICATE").val();
		var CERTIFACATE_ORG_NAME=$("#CERTIFACATE_ORG_NAME").val();
		var CERTIFICATE_ORG_SITE=$("#CERTIFICATE_ORG_SITE").val();
		var CERTIFICATE_NO=$("#CERTIFICATE_NO").val();
		var GOODS_DESC=$("#GOODS_DESC").val();
		if(typeof ID == "undefined" || ID == "")
		{
			ID ="";
		}
		if(typeof GOODS_ID == "undefined" || GOODS_ID == "")
		{
			GOODS_ID ="";
			$.message("error","未指定拍品，不能保存！");
			return false;
		}
		if(typeof BRAND == "undefined" || BRAND == "")
		{
			BRAND ="";
		}
		if(typeof PRICE == "undefined" || PRICE == "")
		{
			PRICE ="";
		}
		if(typeof MATERIAL == "undefined" || MATERIAL == "")
		{
			MATERIAL ="";
		}
		if(typeof ORIGIN_PLACE == "undefined" || ORIGIN_PLACE == "")
		{
			ORIGIN_PLACE ="";
		}
		if(typeof KIND == "undefined" || KIND == "")
		{
			KIND ="";
		}
		if(typeof SHAPE == "undefined" || SHAPE == "")
		{
			SHAPE ="";
		}
		if(typeof STYLE == "undefined" || STYLE == "")
		{
			STYLE ="";
		}
		if(typeof WEIGHT == "undefined" || WEIGHT == "")
		{
			WEIGHT ="";
		}
		if(typeof SIZE == "undefined" || SIZE == "")
		{
			SIZE ="";
		}
		if(typeof INSIDE_DIMESSION == "undefined" || INSIDE_DIMESSION == "")
		{
			INSIDE_DIMESSION ="";
		}
		if(typeof WIDTH == "undefined" || WIDTH == "")
		{
			WIDTH ="";
		}
		if(typeof THICKNESS == "undefined" || THICKNESS == "")
		{
			THICKNESS ="";
		}
		if(typeof HAVE_CERTIFICATE == "undefined" || HAVE_CERTIFICATE == "")
		{
			HAVE_CERTIFICATE ="";
		}
		if(typeof CERTIFACATE_ORG_NAME == "undefined" || CERTIFACATE_ORG_NAME == "")
		{
			CERTIFACATE_ORG_NAME ="";
		}
		if(typeof CERTIFICATE_ORG_SITE == "undefined" || CERTIFICATE_ORG_SITE == "")
		{
			CERTIFICATE_ORG_SITE ="";
		}
		if(typeof CERTIFICATE_NO == "undefined" || CERTIFICATE_NO == "")
		{
			CERTIFICATE_NO ="";
		}
		if(typeof GOODS_DESC == "undefined" || GOODS_DESC == "")
		{
			GOODS_DESC ="";
		}
		var params={ID: ID,GOODS_ID: GOODS_ID,BRAND: BRAND,PRICE: PRICE,MATERIAL: MATERIAL,ORIGIN_PLACE: ORIGIN_PLACE,KIND: KIND,SHAPE: SHAPE,STYLE: STYLE,WEIGHT: WEIGHT,SIZE: SIZE,INSIDE_DIMESSION: INSIDE_DIMESSION,WIDTH: WIDTH,THICKNESS: THICKNESS,HAVE_CERTIFICATE: HAVE_CERTIFICATE,CERTIFACATE_ORG_NAME: CERTIFACATE_ORG_NAME,CERTIFICATE_ORG_SITE: CERTIFICATE_ORG_SITE,CERTIFICATE_NO: CERTIFICATE_NO,GOODS_DESC: GOODS_DESC}
		$.ajax({
				url: "<%=basePath%>paimaipage/platform/auction/goods/attribute/save.do",
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
						var v_id =ovo.oForm.ID;
						$("#ID").val(v_id);
						$.message("success","保存成功");
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
});
</script>
</head>
<body>
	<form id="inputForm" action="save.do" method="post">
	<input type="hidden" id="ID" name="ID" class="text" maxlength="200" value="${row.ID}"/>
	<input type="hidden" id="GOODS_ID" name="GOODS_ID" class="text" maxlength="200" value="${GOODS_ID}"/>
		<table class="input">
			<tr>
				<th>
					品牌:
				</th>
				<td>
					<input type="text" id="BRAND" name="BRAND" class="text" maxlength="200" value="${row.BRAND}" />
				</td>
			</tr>
			<tr>
				<th>
					评估价:
				</th>
				<td>
					<input type="text" id="PRICE" name="PRICE" class="text" maxlength="200" value="${row.PRICE}"/>元
				</td>
			</tr>
			
			<tr>
				<th>
					材质:
				</th>
				<td>
					<input type="text" id="MATERIAL" name="MATERIAL" class="text" maxlength="200" value="${row.MATERIAL}"/>
				</td>
			</tr>
			<tr>
				<th>
					产地:
				</th>
				<td>
					<input type="text" id="ORIGIN_PLACE" name="ORIGIN_PLACE" class="text" maxlength="200" value="${row.ORIGIN_PLACE}" />
				</td>
			</tr>
			<tr>
				<th>
					品种:
				</th>
				<td>
					<input type="text" id="KIND" name="KIND" class="text" maxlength="200" value="${row.KIND}" />
				</td>
			</tr>
			<tr>
				<th>
					造型:
				</th>
				<td>
					<input type="text" id="SHAPE" name="SHAPE" class="text" maxlength="200" value="${row.SHAPE}" />
				</td>
			</tr>
			<tr>
				<th>
					款式:
				</th>
				<td>
					<input type="text" id="STYLE" name="STYLE" class="text" maxlength="200" value="${row.STYLE}" />
				</td>
			</tr>
			<tr>
				<th>
					重量:
				</th>
				<td>
					<input type="text" id="WEIGHT" name="WEIGHT" class="text" maxlength="200" value="${row.WEIGHT}" />克
				</td>
			</tr>
			<tr>
				<th>
					尺寸:
				</th>
				<td>
					<input type="text" id="SIZE" name="SIZE" class="text" maxlength="200" value="${row.SIZE}" />
				</td>
			</tr>
			<tr>
				<th>
					内径:
				</th>
				<td>
					<input type="text" id="INSIDE_DIMESSION" name="INSIDE_DIMESSION" class="text" maxlength="200" value="${row.INSIDE_DIMESSION}"  />mm
				</td>
			</tr>
			<tr>
				<th>
					宽:
				</th>
				<td>
					<input type="text" id="WIDTH" name="WIDTH" class="text" maxlength="200" value="${row.WIDTH}"  />mm
				</td>
			</tr>
			<tr>
				<th>
					厚:
				</th>
				<td>
					<input type="text" id="THICKNESS" name="THICKNESS" class="text" maxlength="200" value="${row.THICKNESS}"  />mm
				</td>
			</tr>
			<tr>
				<th>
					是否有证书:
				</th>
				<td>
					<select id="HAVE_CERTIFICATE" name="HAVE_CERTIFICATE" class="text" style="width:190px;">
						<c:choose>
							<c:when test="${row.HAVE_CERTIFICATE == 1}">
								<option value="">请选择...</option>
								<option value="1"  selected="true">有</option>
								<option value="2" >无</option>
							</c:when>
							<c:when test="${row.HAVE_CERTIFICATE == 2}">
								<option value="">请选择...</option>
								<option value="1" >有</option>
								<option value="2" selected="true">无</option>
							</c:when>
							<c:otherwise>
								<option value="" selected="true">请选择...</option>
								<option value="1" >有</option>
								<option value="2" >无</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					证书机构名称:
				</th>
				<td>
					<input type="text" id="CERTIFACATE_ORG_NAME" name="CERTIFACATE_ORG_NAME" class="text" maxlength="200" value="${row.CERTIFACATE_ORG_NAME}"  />
				</td>
			</tr>
			<tr>
				<th>
					证书机构网站:
				</th>
				<td>
					<input type="text" id="CERTIFICATE_ORG_SITE" name="CERTIFICATE_ORG_SITE" class="text" maxlength="200" value="${row.CERTIFICATE_ORG_SITE}"  />
				</td>
			</tr>
			<tr>
				<th>
					证书机构编号:
				</th>
				<td>
					<input type="text" id="CERTIFICATE_NO" name="CERTIFICATE_NO" class="text" maxlength="200" value="${row.CERTIFICATE_NO}" />
				</td>
			</tr>
			<tr>
				<th>
					宝贝描述:
				</th>
				<td>
					<textarea rows="5" cols="50" id="GOODS_DESC" name="GOODS_DESC">${row.GOODS_DESC}</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" id="submitBtn" class="button" value="确定"/>
					<input type="button" id="backBtn" class="button" value="返回" onclick="javascript:window.parent.location.href='../list.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>