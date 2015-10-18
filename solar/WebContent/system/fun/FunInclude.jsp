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
<title><cc:message key="framework.nav.fun" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/css/diymen/tipswindown.js?version=1.4"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="listForm" action="" method="get">
		<div class="bar">
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
		</div>
		<table id="listTable" class="list_include" >
		<thead>
			<tr>
				<th>
					<a href="javascript:;" class="sort" name="RES_ITEM">编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="LAN_NO">功能名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="RES">功能简介</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="RES">排序</a>
				</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ovo}" var="row" varStatus="status">
				<tr val="${row.FUN_ID}">
					<td>
						${row.FUN_ID}
					</td>
					<td>
						${row.FUN_NAME}
					</td>
					<td>
						${row.FUN_DESC}
					</td>
					<td>
						${row.LEVEL_INDEX}
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<table id="addTable" class="list_include" >
				<tr class="input tabContent">
			<tr>
				<th>
					功能编号:
				</th>
				<td>
					<input type="text" id="f_id" name="f_id" class="text" maxlength="20" readonly/>
					<input type="hidden" id="f_up_id" name="f_up_id" class="text" maxlength="20" readonly/>
				</td>
				<th>
					排序:
				</th>
				<td>
					<input type="text" id="level_index" name="level_index" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					功能中文名称:
				</th>
				<td>
					<input type="text" id="f_name" name="f_name" class="text" maxlength="20" />
				</td>
				<th>
					功能英文名称:
				</th>
				<td>
					<input type="text" id="f_ename" name="f_ename" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					窗口链接:
				</th>
				<td>
					<input type="text" id="f_win_target" name="f_win_target" class="text" maxlength="20" readonly/>
					<input type="hidden" id="f_win_id" name="f_win_id" class="text"  />
					<img id="select_target_id" name="select_target_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectTarget();" />
				</td>
				<th>
					功能图标:
				</th>
				<td>
					<input type="text" id="f_ico_name" name="f_ico_name" class="text" maxlength="20" style="width:100px;" readonly/>
					<img id="ico_preview_id" src="" style="width:45px;height:45px;"/>
					<img id="select_ico_id" name="select_ico_id" src="<%=basePath%>res/images/select_window.gif" onclick="selectIcon();" />
				</td>
			</tr>
			<tr>
				<th>
					功能简介:
				</th>
				<td>
					<input type="text" id="f_desc" name="f_desc" class="text" maxlength="20" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	$().ready(function() {
		var $TR_LIST=$("#listTable tbody tr");
		$TR_LIST.click(function(){
			var $this = $(this);
			$TR_LIST.css("background-color","");
			$this.css("background-color"," rgb(163, 189, 236)");
			var fid=$this.attr("val");
			getFunDetail(fid);
		});
	});

	var pic_path="<%=basePath%>images/icons/";
	var win_id;
	function getFunDetail(fun_id){
		var params={fun_id:fun_id};
		$.ajax({
					url: "FunEdit.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					success: function(message) {
						var f_id=message.FUN_ID;
						var f_up_id=message.UP_FUN_ID;
						var level_index=message.LEVEL_INDEX;
						var f_name=message.FUN_NAME;
						var f_ename=message.FUN_ENAME;
						var f_win_id=message.WIN_ID;
						var f_win_target=message.WIN_TARGET;
						var f_ico_name=message.ICO_NAME;
						var f_desc=message.FUN_DESC;
						$("#f_id").val(f_id);
						$("#f_up_id").val(f_up_id);
						$("#level_index").val(level_index);
						$("#f_name").val(f_name);
						$("#f_ename").val(f_ename);
						$("#f_win_id").val(f_win_id);
						win_id=f_win_id;
						$("#f_win_target").val(f_win_target);
						$("#f_ico_name").val(f_ico_name);
						$("#ico_preview_id").attr("src",pic_path+f_ico_name);
						$("#f_desc").val(f_desc);
					}
				});
	}


	var title;
	var url;
	var width=520;
	var height=400;
	var drag="true";
	var time="";
	var showBg="true";
	var cssName="leotheme";
	var iframeName="selectIframeId";
	function popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName)
	{
		tipsWindown(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}

	 function closeTipWindow()
	 {
		tipsWindown.close();
	 }

	 function iframeSelectTarget()
	 {
	 	//var iframe =window.frames["selectWindowIframeId"].document.selectTarget;
	 	//window.frames["selectWindowIframeId"].document.selectTarget();
	 	window.frames["selectWindowIframeId"].selectTarget();
	 	
	 }
	 
	 function selectTarget(){
		title ="选择窗口";
		url="iframe:<%=basePath%>system/window/SelectWindow.do?win_id="+win_id;
		iframeName="selectWindowIframeId";
		popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}

	function selectIcon(){
		title ="选择图标";
		url="iframe:<%=basePath%>system/icon/SelectIcon.do?win_id="+win_id;
		width=720;
		iframeName="selectIconIframeId";
		popWindow(title,url,width,height,drag,time,showBg,cssName,iframeName);
	}
	
	function setSelectedWindow(id,target)
	{
		$("#f_win_id").val(id);
		$("#f_win_target").val(target);
	}
	
	function setSelectedImg(imgName)
	{
		$("#f_ico_name").val(imgName);
		$("#ico_preview_id").attr("src",pic_path+imgName);
	
	}
	
	function addFun()
	{
		$("#f_id").val("");
		//alert(window.parent.SELECTED_FUN_ID);
		$("#f_up_id").val(window.parent.SELECTED_FUN_ID);
		$("#level_index").val("");
		$("#f_name").val("");
		$("#f_ename").val("");
		$("#f_win_id").val("");
		$("#f_win_target").val("");
		$("#f_ico_name").val("");
		$("#ico_preview_id").attr("src","");
		$("#f_desc").val("");
		$("#level_index").focus();
	}
	
	function saveFun()
	{
		var f_id=$("#f_id").val();
		var f_up_id=$("#f_up_id").val();
		var level_index=$("#level_index").val();
		var f_name=$("#f_name").val();
		var f_ename=$("#f_ename").val();
		var f_win_id=$("#f_win_id").val();
		var f_win_target=$("#f_win_target").val();
		var f_ico_name=$("#f_ico_name").val();
		var f_desc=$("#f_desc").val();
		if(typeof f_name == "undefined" || f_name == ""){
			alert("请输入功能项名称!");
			$("#f_name").focus();
			return false;
		}
		var params={f_id:f_id,f_up_id:f_up_id,level_index:level_index,f_name:f_name,f_ename:f_ename,f_win_id:f_win_id,f_win_target:f_win_target,f_ico_name:f_ico_name,f_desc:f_desc};
		$.ajax({
					url: "FunSave.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						//alert('.....');
					},
					success: function(data, textStatus) {
						var id=data.oForm.FUN_ID;
						$("#f_id").val(id);
					},
					complete: function (XMLHttpRequest, textStatus){
						//alert("complete...");
					},
					error: function (){
						alert('error...');
					}
				});
	}
	
	function deleteFun()
	{
		var fun_id=window.parent.SELECTED_FUN_ID;
		var params={fun_id:fun_id};
		if(!confirm('将删除节点以及子节点确认')){
							return ;
						}
		$.ajax({
					url: "FunDelete.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						$("#deleteButton").addClass("disabled");
					},
					success: function (data, textStatus){
						if(data >0){
							window.parent.location.reload();
						}
						else
						alert('failure');
					},
					complete: function (XMLHttpRequest, textStatus){
						$("#deleteButton").removeClass("disabled");
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