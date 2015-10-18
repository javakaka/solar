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
	<SCRIPT src="<%=basePath%>/res/js/Http.js"></SCRIPT>
	<SCRIPT src="<%=basePath%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=basePath%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onload="onPageLoad()" style="margin:0px;">
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
<SCRIPT type=text/javascript> 
var iType =request("type");
var iPNodeNo =request("upid");

function onPageLoad()
{
	var sSelectTab ="base";
	var base_url ="base.jsp";
	var detail_url ="detail.jsp";
	Tabs.add("base", "基本信息", base_url);
	Tabs.add("detail", "文件上传", detail_url,false);
	Tabs.write("添加版本", idTabFrame, idTab);
	Tabs.select(sSelectTab);
}

function enableTab(name,url)
{
	Tabs.changeurl(name,url);
	Tabs.abled(name);
}

function changeTabUrl(name,url)
{
	Tabs.changeurl(name,url);
}
</SCRIPT>
</BODY>
</HTML>
