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
	Tabs.add("uploadPage", "�ֿ��ϴ�", "Upload.jsp?deal_type=uploadSystemwords&deal_code=systemWords&edit=1");
	Tabs.add("importWords", "�ֿ����","lodaSystemWords.jsp?deal_type=uploadSystemwords&deal_code=systemWords");
	Tabs.write("ϵͳ�ֿ����", idTabFrame, idTab);
	Tabs.select("uploadPage");
}
function setFrameHeight()
{
	dynIframeSize(document.all.idTabFrame);
}
</script>
</BODY>
</HTML>