<%
String sTable =ServletUtil.get(request,"CARD");
if(sTable !=null)
{
	if(sTable.equals("TPT_NEWS"))
	{
		%>
		<script>location.href='<%=GlobalUtil._WEB_PATH%>/portal/EditNews.jsp?<%=request.getQueryString()%>';</script>
		<%
		return;
	}
}
%>
