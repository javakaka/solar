<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HEAD>
	<SCRIPT src="<%=basePath%>/res/js/web.js"></SCRIPT>
	<SCRIPT src="<%=basePath%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=basePath%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onLoad="initTab()" style="margin:0px;">
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
</BODY>
</HTML>
<script>
function initTab()
{
	Tabs.add("SITE", "部门视图", "NewFile1.jsp");
	Tabs.add("NAME", "岗位视图", "NewFile2.jsp");
	Tabs.add("Common", "岗位视图", "NewFile3.jsp");
	Tabs.write("组织机构视图", idTabFrame, idTab);
	Tabs.select("SITE");
}
</script>