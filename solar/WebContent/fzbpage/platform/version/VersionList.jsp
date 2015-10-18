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
<title>版本列表</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<style type="text/css">
.moreTable th {
	width: 80px;
	line-height: 25px;
	padding: 5px 10px 5px 0px;
	text-align: right;
	font-weight: normal;
	color: #333333;
	background-color: #f8fbff;
}

.moreTable td {
	line-height: 25px;
	padding: 5px;
	color: #666666;
}

.promotion {
	color: #cccccc;
}
</style>
<script type="text/javascript">
$().ready(function() {

	${flash_message}

	var $listForm = $("#listForm");
	var $moreButton = $("#moreButton");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");
	
	// 更多选项
	$moreButton.click(function() {
		$.dialog({
			title: "更多选项",
			content:'<table id="moreTable" class="moreTable">'
					+'<tr>'
					+'<th>111:<\/th>'
					+'<td>'
					+'<select name="productCategoryId">'
					+'<option value="">请选择...<\/option>'
					+'<option value="1" selected="selected">11<\/option>'
					+'<option value="2" >22<\/option><option value="3" >33<\/option>'
					+'<\/select>'
					+'<\/td>'
					+'<\/tr>'
					+'<\/table>',
			width: 470,
			modal: true,
			ok: "ok",
			cancel: "cancel",
			onOk: function() {
				$("#moreTable :input").each(function() {
					var $this = $(this);
					$("#" + $this.attr("name")).val($this.val());
				});
				$listForm.submit();
			}
		});
	});
	
	// 商品筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#" + $this.attr("name"));
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});
});

		function downloadAttach(pre_path,file_code,deal_code,deal_type,file_name,file_type)
		{
			var url ="<%=basePath%>/sysupload/Download.jsp?pre_path="+pre_path;
			url +="&file_name="+file_name;
			url +="&file_code="+file_code;
			url +="&deal_code="+deal_code;
			url +="&deal_type="+deal_type;
			url +="&file_type="+file_type;
			window.open(url);
		}
</script>
</head>
<body>
	<div class="path">
		系统设置 &raquo;版本列表
		<span><cc:message key="admin.page.total" args="${page.total}"/></span>
	</div>
	<form id="listForm" action="VersionList.do" method="get">
		<input type="hidden" id="app_id" name="app_id" value="<c:if test="${app_id !=''}">${app_id}</c:if>" />
		<input type="hidden" id="device" name="device" value="<c:if test="${device !=''}">${device}</c:if>" />
		<div class="bar">
			<a href="add.do" class="iconButton">
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
					<a href="javascript:;" id="filterSelect" class="button">
						版本筛选<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="app_id" val="1" <c:if test="${app_id == '1'}"> class="checked" </c:if> >房东租客版</a>
							</li>
							<li>
								<a href="javascript:;" name="app_id" val="2" <c:if test="${app_id == '2'}"> class="checked" </c:if> >中介版</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="device" val="1" <c:if test="${device == '1'}"> class="checked" </c:if> >ios版</a>
							</li>
							<li>
								<a href="javascript:;" name="device" val="2" <c:if test="${device == '2'}"> class="checked" </c:if> >安卓版</a>
							</li>
							<li>
								<a href="javascript:;" name="device" val="3" <c:if test="${device == '3'}"> class="checked" </c:if> >wp版</a>
							</li>
						</ul>
					</div>
				</div>
			<!-- <a href="javascript:;" id="moreButton" class="button">更多选项</a>-->
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
							<a href="javascript:;" <c:if test="${page.searchProperty == 'VERSION_NAME'}"> class="current"</c:if> val="VERSION_NAME">版本名称</a>
						</li>
						<li>
							<a href="javascript:;" <c:if test="${page.searchProperty == 'VERSION'}">class="current"</c:if> val="VERSION">版本号</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="APP_ID">APP类别</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="DEVICE">设备类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="VERSION_NAME">版本名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="VERSION">版本号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="IS_CURRENT_VERSION">当前使用</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="URL">下载地址</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="SIZE">文件大小</a>
				</th>
				<th>
					<a href="javascript:;" >文件类型</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="CREATE_TIME">上传时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="MODIFY_TIME">更新时间</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="REMARK">版本介绍</a>
				</th>
				
				<th>
					<span><cc:message key="admin.common.handle" /></span>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.ID}" />
					</td>
					<td>
						<c:choose>
							<c:when test="${row.APP_ID == '1'}">房东租客版</c:when>
							<c:when test="${row.APP_ID == '2'}">中介版</c:when>
							<c:otherwise>--</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${row.DEVICE == '1'}">ios</c:when>
							<c:when test="${row.DEVICE == '2'}">android</c:when>
							<c:when test="${row.DEVICE == '3'}">wp</c:when>
							<c:otherwise>--</c:otherwise>
						</c:choose>
					</td>
					<td>
						${row.VERSION_NAME}
					</td>
					<td>
						${row.VERSION}
					</td>
					<td>
						<c:choose>
							<c:when test="${row.IS_CURRENT_VERSION == '1'}">是</c:when>
							<c:otherwise>否</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${row.URL}" alt="${row.VERSION_NAME}"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${row.FILE_SIZE == ''}">--</c:when>
							<c:otherwise>${row.FILE_SIZE}</c:otherwise>
						</c:choose>
						M
					</td>
					<td>
						${row.FILE_TYPE}
					</td>
					<td>
						${row.CREATE_TIME}
					</td>
					<td>
						${row.MODIFY_TIME}
					</td>
					<td>
						<span title="${row.REMARK}">${row.REMARK}</span>
					</td>
					<td>
						<a href="edit_version.do?id=${row.ID}" ><cc:message key="admin.common.edit" /></a>
						<c:if test="${row.DEAL_CODE !=''}">
						<a href='javascript:void()'  onclick="downloadAttach('${row.PRE_PATH}','${row.FILE_CODE}','${row.DEAL_CODE}','${row.DEAL_TYPE}','${row.FILE_NAME}','${row.FILE_TYPE}')"> 下载</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
</body>
</html>