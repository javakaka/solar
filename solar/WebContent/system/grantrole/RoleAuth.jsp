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
<title><cc:message key="framework.nav.i18n" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/css/diymen/tipswindown.js?version=1.4"></script>

</head>
<body>
	<form id="listForm" action="" method="get">
		<div class="bar">
			
			对<c:choose><c:when test="${type == 1}">岗位:[${posi_name}]</c:when><c:when test="${type == 4}">人员:[${staff_name}]</c:when></c:choose>进行授权
			<input type="button" name="authBtn" id="authBtn" value="授权" <c:if test="${type == 0}">disabled</c:if> />
			<!--
			<a href="javascript:void(0)" onclick="addFun()" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>
			<div class="buttonWrap">
				<a href="javascript:void(0)" onclick="deleteFun()" id="deleteButton" class="iconButton">
					<span class="deleteIcon">&nbsp;</span><cc:message key="admin.common.delete" />
				</a>
				<a href="javascript:;" onclick="refreshFun()" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span><cc:message key="admin.common.refresh" />
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton" onclick="saveFun()">
					<span class="addIcon">&nbsp;</span>保存
				</a>
			</div>
			-->
		</div>
		<table id="listTable" class="list_include" >
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="selectAllUse" /><a href="javascript:;" name="RES_ITEM">角色使用</a>
				</th>
				<th>
					<input type="checkbox" id="selectAllAsign" /><a href="javascript:;" name="LAN_NO">角色授予</a>
				</th>
				<th>
					<a href="javascript:;" name="RES">角色名称</a>
				</th>
				<th>
					<a href="javascript:;" name="RES">开始时间</a>
				</th>
				<th>
					<a href="javascript:;" name="结束时间">开始时间</a>
				</th>
				<th>
					<a href="javascript:;" name="结束时间">角色描述</a>
				</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${roles}" var="row" varStatus="status">
				<tr val="${row.ROLE_ID}">
				<c:forEach items="${role_dataset}" var="srow" varStatus="status">
					<td>
						<input type="checkbox" name="use_state_box" id="use_state_box${row.ROLE_ID}" 
						<c:if test="${srow.ROLE_ID == row.ROLE_ID && srow.USE_STATE == 1}">checked</c:if>/>
					</td>
					<td>
						<input type="checkbox" name="assign_state_box" id="assign_state_box${row.ROLE_ID}" <c:if test="${srow.ROLE_ID == row.ROLE_ID && srow.ASSIGN_STATE == 1}">checked</c:if> />
					</td>
				</c:forEach>
				<c:if test="${role_dataset.size() ==0 }">
					<td><input type="checkbox" name="use_state_box" id="use_state_box${row.ROLE_ID}" ></input></td>
					<td><input type="checkbox" name="assign_state_box" id="assign_state_box${row.ROLE_ID}" ></input></td>
				</c:if>
					<td>
						${row.ROLE_NAME}
					</td>
					<td>
						${row.ROLE_BEGINTIME}
					</td>
					<td>
						${row.ROLE_ENDTIME}
					</td>
					<td>
						${row.ROLE_DESC}
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>
	<script type="text/javascript">
	var auth_type ="${type}";
	var posi_no ="${posi_no}";
	var staff_no ="${staff_no}";
	$().ready(function() {
		var $TR_LIST=$("#listTable tbody tr");
		$TR_LIST.click(function(){
			var $this = $(this);
			$TR_LIST.css("background-color","");
			$this.css("background-color"," rgb(163, 189, 236)");
			var fid=$this.attr("val");
		});
		
		//select use 
		$("#selectAllUse").click(function (){
			selectAllUseCheckBox();
		});
		//select assign
		$("#selectAllAsign").click(function (){
			selectAllAsignCheckBox();
		});
		$("#authBtn").click(function (){
			saveRoleAuth();
		});
	});
	
	function  selectAllUseCheckBox()
	{
		var handlerBox =document.getElementById("selectAllUse");
		var checked =0;
		if(handlerBox.checked ==true){
			checked =1;
		}
		else
		{
			checked =0;
		}
		var box =document.getElementsByName("use_state_box");
		for(var i=0; i<box.length; i++)
		{
			if(checked ==1 )
			{
				box[i].checked =true;
			}
			else if(checked == 0)
			{
				box[i].checked =false;
			}
		}
	}
	function  selectAllAsignCheckBox()
	{
		var handlerBox =document.getElementById("selectAllAsign");
		var checked =0;
		if(handlerBox.checked ==true){
			checked =1;
		}
		else
		{
			checked =0;
		}
		var box =document.getElementsByName("assign_state_box");
		for(var i=0; i<box.length; i++)
		{
			if(checked ==1 )
			{
				box[i].checked =true;
			}
			else if(checked == 0)
			{
				box[i].checked =false;
			}
		}
	}
	
	
	function saveRoleAuth()
	{
		if(auth_type == "0"){
			alert("请先选择授权对象，岗位或者人员！");
			return false;
		}
		var auth_item="";
		var $TR_LIST=$("#listTable tbody tr");
		$.each($TR_LIST, function (i,item){
			var role_id = $(item).attr("val");
			var use_box_id ="use_state_box"+role_id;
			var assign_box_id ="assign_state_box"+role_id;
			var use_box =document.getElementById(use_box_id);
			var assign_box =document.getElementById(assign_box_id);
			var use_box_state=0;
			var assign_box_state =0;
			if(use_box.checked ==true){
				use_box_state =1;
			}
			if(assign_box.checked ==true )
			{
				assign_box_state =1;
			}
			var authValue ="";
			if(use_box_state != 0 || assign_box_state !=0)
			{
				authValue =role_id+"@"+use_box_state+"@"+assign_box_state;
				if(auth_item == "")
				{
					auth_item +=authValue;
				}
				else
				{
					auth_item +=","+authValue;
				}
			}
			//alert(auth_item);
		});
		
		var params=null;
		var tipMsg ="";
		//posi
		if(auth_type == "1"){
			params={type:auth_type,id:posi_no,items:auth_item};	
			tipMsg ="未勾选角色授权与角色使用，此岗位将不能使用之前的权限";
		}
		else if(auth_type == "4" )
		{
			params={type:auth_type,id:staff_no,items:auth_item};
			tipMsg ="未勾选角色授权与角色使用，此人员将不能使用之前的权限";
		}
		//alert(auth_item);
		if(auth_item == "")
		{
			//alert("请选择角色！");
			if(!confirm(tipMsg))
			{
				return false;
			}
			else
			{
				params.items ="";
				alert(params.items);
			}
		}
		/**/
		$.ajax({
					url: "saveRoleAuth.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						//alert('.....');
					},
					success: function(data, textStatus) {
						var id=data.oForm.STATUS;
						//alert(id);
						if(id == "1"){
							alert("保存成功！");
						}
					},
					complete: function (XMLHttpRequest, textStatus){
						//alert("complete...");
					},
					error: function (){
						alert('error...');
					}
				});
	}
	
	function refreshFun()
	{
		window.location.reload();
	}
	</script>
</body>
</html>