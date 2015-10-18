<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="<%=GlobalUtil._WEB_PATH%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=GlobalUtil._WEB_PATH%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onload=initTab()>
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" height="330px" frameborder="0" src=""></iframe>
</BODY>
</HTML>
<script>
function initTab()
{
	Tabs.add("Base", "基本信息", "WorkerBase.jsp?<%=request.getQueryString()%>");
	<%
	if(ServletUtil.contain(request, "extend"))
	{
	%>
	Tabs.add("Extend", "详细信息", "WorkerExtend.jsp?<%=request.getQueryString()%>");
	<%
	}
	if(ServletUtil.contain(request, "pword"))
	{
		%>
		Tabs.add("Password", "密码修改", WEB_PATH+"/system/premission/ChangePassword.jsp");
		<%
	}
	%>
	Tabs.add("Preview", "浏览", "WorkerView.jsp?<%=request.getQueryString()%>");
	Tabs.write("", idTabFrame, idTab);
	Tabs.select("Base");
}
function setFrameHeight()
{
	dynIframeSize(document.all.idTabFrame);
}
</script>
</BODY>
</HTML>