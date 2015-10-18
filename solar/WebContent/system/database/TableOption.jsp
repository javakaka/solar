<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<FRAMESET COLS="150,*"  FRAMESPACING="1" FRAMEBORDER="YES" BORDERCOLOR="#000000">
   <FRAME src="Left.jsp?<%=request.getQueryString()%>" name="left" frameborder="no" scrolling="no">
   <FRAME SRC='FieldsInclude.jsp?table_ename=<%=ServletUtil.get(request,"table_ename")%>' name="main" frameborder="0" scrolling="yes">
</frameset>
<noframes><body>

</body></noframes>
</html>
