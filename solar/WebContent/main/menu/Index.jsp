<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
</head>
<frameset name="layerOne" border=0 frameBorder=0 frameSpacing=0 rows=90,*>
	<frameset border=0 frameBorder=0 frameSpacing=0 cols=0,*>
	  <frame name="onlinestaff" id="onlinestaff" scrolling=no src="<%=GlobalUtil._WEB_PATH%>/main/Online.jsp">
	  <frame name="topframe" scrolling=no src="<%=GlobalUtil._WEB_PATH%>/main/menu5/Top.jsp">
	</frameset>
	<frameset name="layerTwo" border=0 frameBorder=0 frameSpacing=0 cols=153,*>
	  <frame name="menubarframe" id="menubarframe" src="<%=GlobalUtil._WEB_PATH%>/main/menu5/MenuPage.jsp?fun_id=32">
	  <frame name="mainframe" id="mainframe" scrolling="yes" src='<%=GlobalUtil._WEB_PATH%>/staff/portlet/StaffPortlet.jsp'>
	</frameset>
</frameset>
<noframes>
  <body>
  <p>
  Your web browser can not support FRAMES, please update you web browser!<br>
  You can contact SysManager!
  </p>
  </body>
</noframes>
</html>
