<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
	<SCRIPT src="<%=GlobalUtil._WEB_PATH%>/res/tab/Tab.js"></SCRIPT>
	<link href="<%=GlobalUtil._WEB_PATH%>/res/tab/Style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY onLoad="initTab()">
<div id="idTab">
</div>
<iframe id="idTabFrame" width="100%" frameborder="0" src="" onLoad="dynIframeSize(this)"></iframe>
</BODY>
</HTML>
<script>
function initTab()
{
	Tabs.add("SITE", "部门视图", "Org.jsp?view_type=site&has_script=0");
	Tabs.add("NAME", "岗位视图", "Org.jsp?view_type=position&has_script=0");
	Tabs.write("组织机构", idTabFrame, idTab);
	Tabs.select("SITE");
}
</script>