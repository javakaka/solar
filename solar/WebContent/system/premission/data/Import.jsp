<%@ page contentType="text/html; charset=gb2312" %>
<%@ include file="/include/Head.jsp"%>
<%
  String sServerName="officeedit/OfficeServer.jsp";
  String sClientName="officeedit/WebEditor.ocx#version=4,3,0,0";
  String sServerUrl="http://"+request.getServerName()+":"+request.getServerPort()+GlobalUtil._WEB_PATH+"/"+sServerName;
  String sClientUrl="http://"+request.getServerName()+":"+request.getServerPort()+GlobalUtil._WEB_PATH+"/"+sClientName;
%>
<html>
<head>
<title>WebEditor</title>
<script src="<%=GlobalUtil._WEB_PATH%>/print/js/OfficePrint.js"></script>
<script src="js/Import.js"></script>
</head>
<body onload="onLoadOrgModel()" onunload="unLoad()">
<form name="webform" method="post">
<table id="idTbOffice" border=0 cellspacing='0' cellpadding='0' width='100%' height="300">
<tr>
 <td>
	<OBJECT id="WebOffice" width="100%" height="100%" classid="clsid:33739A7E-2004-4D1C-88D5-D50B18F7C347" codebase="<%=sClientUrl%>"
	style="position:absolute;height:100%;clip:rect(20 auto auto auto);">
		<param name="BorderStyle" value="1">
		<param name="Menubar" value="1">
		<param name="Toolbars" value="1">
		<param name="Caption" value="20040520">
		<param name="WebUrl" value="<%=sServerUrl%>">
		<param name="Template" value="10015">
		<param name="FileName" value="">
		<param name="EditType" value="0">
		<param name="FileType" value=".xls">
	</OBJECT>
 </td>
</tr>
</table>
</form>
<table width=100%>
<tr>
	<td><font color="red">注意</font>：<br>表格数据中不能存在空行数据！<br>在岗位数据中，最高岗位后请带*（只有一条记录）</td>
	<td><input type=button value=" 校  验 " onClick="onCheckOrgData()"><input type=button name="btOrgDataImport" value=" 导  入 " onClick="onImportOrgData()"></td>
</tr>
</table>
<div style="display:none" id=StatusBar>状态栏</div>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
function onLoadOrgModel()
{
	idTbOffice.style.height="550px";
	loadTemplateOffice();
}
//-->
</SCRIPT>