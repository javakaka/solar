<%@ page contentType="text/html; charset=GBK"%>
<html lang="zh">
<head>
<title></title>
</head>
<frameset cols="*,15" name="bar" border=0 frameBorder=0 frameSpacing=0 >
<frameset name="layer" border=0 frameBorder=0 frameSpacing=0 rows=*,39 >
  <frame name="menubar" scrolling="no" src="MenuBar.jsp?<%=request.getQueryString()%>">
  <frame name="newsmgbar" scrolling="no" src="NewMsgBar.jsp">
</frameset>
  <frame name="split" scrolling="no" src="SplitPage.jsp?<%=request.getQueryString()%>" noresize>
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
  <p>
  Your web browser can not support FRAMES, please update you web browser!<br>
  You can contact SysManager!
  </p>
</body>
</noframes>
</html>
