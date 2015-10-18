<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
<title>模态窗口</title>
</head>
<%
String sFile =request.getParameter("file");
sFile +="?"+request.getQueryString();
%>
<frameset name="main" cols="*" rows="100%,*" frameborder="no" border="0" framespacing="0">
  <body>
    <frame id="dialog" noresize target="top" src="<%=sFile%>">
  </body>
</frameset>
<!-- 当浏览器不支持框架的情况下所作的处理 -->

<noframes>
<body>
  <p>你的浏览器不支持框架,无法正确显示</p>
</body>
</noframes>
</html>
