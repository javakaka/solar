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
	Tabs.add("Base", "������Ϣ", "WorkerBase.jsp?<%=request.getQueryString()%>");
	<%
	if(ServletUtil.contain(request, "extend"))
	{
	%>
	Tabs.add("Extend", "��ϸ��Ϣ", "WorkerExtend.jsp?<%=request.getQueryString()%>");
	<%
	}
	if(ServletUtil.contain(request, "pword"))
	{
		%>
		Tabs.add("Password", "�����޸�", WEB_PATH+"/system/premission/ChangePassword.jsp");
		<%
	}
	%>
	Tabs.add("Preview", "���", "WorkerView.jsp?<%=request.getQueryString()%>");
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