<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
/**
* 用户选择系统定义的webpart
*/
%>
<html>
<title>桌面定义</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
<body onLoad="loadStaffWebPart()">
<div class="path">
	用户配置 &raquo;快捷桌面
	<span><cc:message key="admin.page.total" args="${page.total}"/></span>
</div>
<form id="listForm" action="RoomList.do" method="get">
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />选中
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="desc">介绍</a>
				</th>
			</tr>
			<c:forEach items="${page.content}" var="row" varStatus="status">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${row.ID}" />
					</td>
					<td>
						<span title="${row.NAME}">${row.NAME}</span>
					</td>
					<td>
						${row.DESC}
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="/include/pagination.jsp" %> 
	</form>
<div align="center">
	<input type="button" value="设置桌面" onClick="onSetDesktop()">
</div>

</body>
</html>
<script language="javascript">
<!--
var WEB_PATH ="<%=basePath%>";
var iRows =0;
function loadStaffWebPart()
{
	var url =WEB_PATH+"/staff/portlet/getStaffPortletJson.do";
	var params={};
	$.ajax({
		url: url,
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
				//create table tr
				var html ="";
				var list =ovo.oForm.WEBPARTS;
				for(var i=0;i<list.length;i++)
				{
					html +="<tr>";
					html +="<td>";
					html +="<input type=\"checkbox\" name=\"ids\" value=\""+list[i].WEBPART_NO+"\" />";
					html +="</td>";
					html +="<td>";
					html +="<span title=\""+list[i].WEBPART_TITLE+"\">"+list[i].WEBPART_TITLE+"</span>";
					html +="</td>";
					html +="<td>";
					html +=list[i].WEBPART_NOTE;
					html +="</td>";
					html +="</tr>";
				}
				$("#listTable").append(html);
				var sStaffWebpart =ovo.oForm.PART_SERIAL;
				if(sStaffWebpart !="")
				{
					var tempStr=sStaffWebpart.replace("|",",").replace("|",",");
					var arr =tempStr.split(",");
					for(var i=0;i<arr.length;i++)
					{
						if(typeof arr[i] != "undefined" && arr[i]!= "")
						{
							$("input:checkbox[value='"+arr[i]+"']").attr("checked",true);
						}
					}
				}
			}
			else
			{
				$.message("error",ovo.msg);
			}
		},
		complete: function (XMLHttpRequest, textStatus){
		},
		error: function (){
			alert('error...');
		}
	});
}
/*设置桌面*/
function onSetDesktop()
{
	var sConfigIds ="";
	var ck =document.getElementsByName("ids");
	for(var i=0;i<ck.length;i++)
	{
		if(ck[i].checked)
		{
			if(sConfigIds.length >0)
				sConfigIds +=",";
			sConfigIds +=ck[i].value;
		}
	}
	window.returnValue =sConfigIds;
	window.opener.document.sConfigs =sConfigIds;
	window.opener.onAfterChildWindowSetDesktop(sConfigIds);
	window.close();
}

/*获取用户设置的桌面配置*/
function onGetUserDesktop()
{

}
//-->
</script>