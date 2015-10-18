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
	Tabs.add("uploadPage", "字库上传", "Upload.jsp?deal_type=uploadSystemwords&deal_code=systemWords&edit=1");
	Tabs.add("importWords", "字库入库","lodaSystemWords.jsp?deal_type=uploadSystemwords&deal_code=systemWords");
	Tabs.write("系统字库入库", idTabFrame, idTab);
	Tabs.select("uploadPage");
}
function setFrameHeight()
{
	dynIframeSize(document.all.idTabFrame);
}
</script>
</BODY>
</HTML>