<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="<%=GlobalUtil._WEB_PATH%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=GlobalUtil._WEB_PATH%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onload=initTab()>
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
</BODY>
</HTML>
<script>
function initTab()
{
	Tabs.add("Language", "语言条目", "Language.jsp");
	Tabs.write("国际化", idTabFrame, idTab);
	Tabs.select("Language");
}
function setFrameHeight()
{
	dynIframeSize(document.all.idTabFrame);
}
</script>
</BODY>
</HTML>