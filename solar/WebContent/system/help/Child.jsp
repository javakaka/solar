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
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<link href="<%=basePath%>/res/css/diymen/tipswindown.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/css/diymen/tipswindown.js?version=1.4"></script>

</head>
<body>
	<form id="listForm" action="" method="get">
		<div class="bar">
			<a href="add.do?pfaq_no=${pfaq_no}" class="iconButton">
				<span class="addIcon">&nbsp;</span><cc:message key="admin.common.add" />
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span><cc:message key="admin.common.delete" />
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span><cc:message key="admin.common.refresh" />
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						<cc:message key="admin.page.pageSize" /><span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 10}">class="current"</c:if> val="10" >10</a>
							</li>
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 20}">class="current"</c:if> val="20">20</a>
							</li>
							<li>
								<a href="javascript:;" <c:if test="${page.pageSize == 50}"> class="current"</c:if>val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"  <c:if test="${page.pageSize == 100}">class="current"</c:if>val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'ROLE_NAME'}"> class="current"</c:if> val="ROLE_NAME">角色名称</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'ROLE_BEGINTIME'}">class="current"</c:if> val="ROLE_BEGINTIME">有效起始时间</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'ROLE_ENDTIME'}">class="current"</c:if> val="ROLE_ENDTIME">有效结束时间</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'STATE'}">class="current"</c:if> val="STATE">角色状态</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'ROLE_DESC'}">class="current"</c:if> val="ROLE_DESC">功能简介</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list" >
		<thead>
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="LAN_NO">主题编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="RES">主题</a>
				</th>
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${data_list}" var="row" varStatus="status">
				<tr val="${row.FAQ_NO}">
					<td>
						<input type="checkbox" name="ids" value="${row.FAQ_NO}" />
					</td>
					<td>
						${row.FAQ_NO}
					</td>
					<td>
						${row.SUBJECT}
					</td>
					<td>
						<a href="edit.do?faq_no=${row.FAQ_NO}&pfaq_no=${row.PFAQ_NO}"><cc:message key="admin.common.edit" /></a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
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