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
<title>编辑房源信息</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {
	var selected_cityId ="${row.CITY}";
	var selected_zoneId ="${row.REGION}";
	var pay_day ="${row.PAY_DAY}";

	var $inputForm = $("#inputForm");
	
	//[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			CODE: "required",
			CITY: "required",
			REGION: "required",
			AREA: {
				required:true,
				number:true
			},
			MONTHLY_RENT: {
				required:true,
				number:true
			},
			DEPOSIT:  {
				required:true,
				number:true
			},
			START_DATE: "required",
			END_DATE: "required",
			PAY_DAY: "required",
			STATUS: "required",
			ADDRESS: "required"
		},
		messages:{
			CITY:{
				required: "请选择城市"
			},
			REGION:{
				required: "请选择区域"
			},
			AREA:{
				required: "请输入面积",
				number:"请输入正确的数字"
			},
			MONTHLY_RENT:{
				required: "请输入月租",
				number:"请输入正确的数字"
			},
			DEPOSIT:{
				required: "请输入押金",
				number:"请输入正确的数字"
			},
			START_DATE:{
				required: "请输入起租日期",
				number:"请输入正确的数字"
			},
			END_DATE:{
				required: "请输入终止日期",
				number:"请输入正确的数字"
			},
			PAY_DAY:{
				required: "请选择每月交租日"
			},
			STATUS:{
				required: "请选择房源状态"
			},
			ADDRESS:{
				required: "请输入房源的详细地址"
			}
		}
	});

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
					option_html +="<option value=\"\" >请选择...</option>";
					$.each(city_list,function(i,item){
						option_html +="<option value=\""+item.ID+"\" >"+item.NAME+"</option>";
					});
					city_select.html(option_html);
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
					option_html +="<option value=\"\" >请选择...</option>";
					$.each(zone_list,function(i,zone){
						option_html +="<option value=\""+zone.ID+"\" >"+zone.NAME+"</option>";
					});
					region_select.html(option_html);
					region_select.val(selected_zoneId);
				},
				complete: function (XMLHttpRequest, textStatus){
					//alert("complete...");
				},
				error: function (){
					$.message("error","处理出错");
				}
			});
	});

	var pay_day_select =$("#PAY_DAY");
	pay_day_select.val(pay_day);
});
</script>
</head>
<body>
	<div class="path">
		管理中心 &raquo; 编辑房源信息
	</div>
	<form id="inputForm" action="update.do" method="post">
	<input type="hidden" name="ID" class="text" maxlength="200" value="${row.ID}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>唯一码:
				</th>
				<td>
					<input type="text" name="CODE" class="text" maxlength="200" value="${row.CODE}" readonly/>
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
								<c:when test="${province.ID == row.PROVINCE}">
									<option value="${province.ID}" selected>${province.NAME}</option>
								</c:when>
								<c:otherwise><option value="${province.ID}" >${province.NAME}</option></c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>城市:
				</th>
				<td>
					<select id="CITY" name ="CITY" style="width:190px;" >
						<option value="" >请选择...</option>
							<c:forEach items="${city_list}" var="city" varStatus="status">
							<c:choose>
								<c:when test="${city.ID == row.CITY}"><option value="${row.CITY}" selected>${city.NAME}</option></c:when>
								<c:otherwise><option value="${city.ID}" >${city.NAME}</option></c:otherwise>
							</c:choose>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					区域:
				</th>
				<td>
					<select id="REGION" name ="REGION" style="width:190px;" >
						<option value="" >请选择...</option>
							<c:forEach items="${zone_list}" var="zone" varStatus="status">
							<c:choose>
								<c:when test="${zone.ID == row.REGION}"><option value="${row.REGION}" selected>${zone.NAME}</option></c:when>
								<c:otherwise><option value="${zone.ID}" >${zone.NAME}</option></c:otherwise>
							</c:choose>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>面积:
				</th>
				<td>
					<input type="text" name="AREA" class="text" maxlength="200" value="${row.AREA}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>月租:
				</th>
				<td>
					<input type="text" name="MONTHLY_RENT" class="text" maxlength="200" value="${row.MONTHLY_RENT}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>押金:
				</th>
				<td>
					<input type="text" name="DEPOSIT" class="text" maxlength="200" value="${row.DEPOSIT}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>开始日期:
				</th>
				<td>
					<input type="text" name="START_DATE" class="text Wdate" onfocus="WdatePicker();" maxlength="200" value="${row.START_DATE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>结束日期:
				</th>
				<td>
					<input type="text" name="END_DATE" class="text Wdate" onfocus="WdatePicker();" maxlength="200" value="${row.END_DATE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>收款日:
				</th>
				<td>
					<select id="PAY_DAY" name ="PAY_DAY" style="width:190px;" >
						<option value="" >请选择...</option>
						<option value="01" selected>01</option>
						<option value="02" >02</option>
						<option value="03" >03</option>
						<option value="04" >04</option>
						<option value="05" >05</option>
						<option value="06" >06</option>
						<option value="07" >07</option>
						<option value="08" >08</option>
						<option value="09" >09</option>
						<option value="10" >10</option>
						<option value="11" >11</option>
						<option value="12" >12</option>
						<option value="13" >13</option>
						<option value="14" >14</option>
						<option value="15" >15</option>
						<option value="16" >16</option>
						<option value="17" >17</option>
						<option value="18" >18</option>
						<option value="19" >19</option>
						<option value="20" >20</option>
						<option value="21" >21</option>
						<option value="22" >22</option>
						<option value="23" >23</option>
						<option value="24" >24</option>
						<option value="25" >25</option>
						<option value="26" >26</option>
						<option value="27" >27</option>
						<option value="28" >28</option>
						<option value="29" >29</option>
						<option value="30" >30</option>
						<option value="31" >31</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					邀请码:
				</th>
				<td>
					<input type="text" name="INVITE_CODE" class="text" maxlength="200" value="${row.INVITE_CODE}"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>状态:
				</th>
				<td>
					<select id="STATUS" name ="STATUS" style="width:190px;" >
					<c:choose>
						<c:when test="${row.STATUS == 0}">
							<option value="" >请选择...</option>
							<option value="0" selected>待租</option>
							<option value="1" >签约中</option>
						</c:when>
						<c:when test="${row.STATUS == 1}">
							<option value="" >请选择...</option>
							<option value="0" >待租</option>
							<option value="1" selected>签约中</option>
						</c:when>
						<c:otherwise>
							<option value="" selected>请选择...</option>
							<option value="0" >待租</option>
							<option value="1" >签约中</option>
						</c:otherwise>
					</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>详细地址:
				</th>
				<td>
					<input type="text" name="ADDRESS" class="text" maxlength="500px" value="${row.ADDRESS}" style="width:350px;" />
				</td>
			</tr>
			<tr>
				<th>
					水表读数:
				</th>
				<td>
					<input type="text" name="WATER_NUM" class="text" maxlength="200" value="${row.WATER_NUM}"/>
				</td>
			</tr>
			<tr>
				<th>
					电表读数:
				</th>
				<td>
					<input type="text" name="ELECTRICITY_NUM" class="text" maxlength="200" value="${row.ELECTRICITY_NUM}"/>
				</td>
			</tr>
			<tr>
				<th>
					燃气读数:
				</th>
				<td>
					<input type="text" name="GAS_NUM" class="text" maxlength="200" value="${row.GAS_NUM}"/>
				</td>
			</tr>
			<tr>
				<th>
					物业管理费:
				</th>
				<td>
					<input type="text" name="PROPERTY" class="text" maxlength="200" value="${row.PROPERTY}"/>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" name="REMARK" class="text" maxlength="500px" value="${row.REMARK}" style="width:350px;"  />
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