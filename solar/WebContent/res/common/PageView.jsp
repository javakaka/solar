<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sViewUrl =request.getParameter("url");
%>
<jsp:include page="<%=sViewUrl%>" flush="true">
		<jsp:param name="PARAMS" value="<%=request.getQueryString()%>"/>
</jsp:include>
<script>
//设置页面为阅读页面
onPageView();
try{document.all.btReset.style.display ="none";}catch(e){}
try{document.all.btSave.style.display ="none";}catch(e){}
try{document.all.btDel.style.display ="none";}catch(e){}
var w = document.body.offsetWidth ;
var h = document.body.offsetHeight  + 20;
self.resizeTo(w,h); 
</script>
