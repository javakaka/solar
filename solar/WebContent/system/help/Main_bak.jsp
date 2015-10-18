<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body bgcolor="whitesmoke">
<table width="100%" height="95%" border="0" cellpadding="0" cellspacing="3">
  <tr> 
    <td width="25%" valign="top">
	<link type="text/css" rel="stylesheet" href="xtree.css">
	<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Tree.js"></script>
	<table width="100%" border="0" cellpadding="0" cellspacing="2">
	  <tr>
		<td valign="top" bordercolor="#FFFFFF" bgcolor="#eeeeee" class="Solid-ALL"> <input type="button" name="btnadd" value="ä¯ÀÀ°ïÖúÎÄµµ"  onclick="$E.open('<%=GlobalUtil._WEB_PATH%>/help/Index.jsp')">
			<$:A service="GetFaqTree" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request,"FaqTree") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request,"FaqTree");
					%>
	               <$:Tree treeData="<%=alTree%>" head="<%=com.juts.framework.license.SystemInfo._SOFTNAME+"°ïÖúÎÄµµ"%>" pidF="PFAQ_NO" idF="FAQ_NO" pid="0" titleF="SUBJECT" hiddenF="FAQ_NO,SUBJECT " icon="aq.gif"/>
					<%
				}
			%>
		</td>
	  </tr>
	</table>
	</td>
    <td valign="top">
		<iframe src="Child.jsp" id="DIFRAME" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
	</td>
  </tr>
</table>
</body>
</html>
<script>
function selectChange(handle)
{
	if(handle.value !='')
	{
		ftmp.moudle_id.value =handle.value;
		ftmp.submit();
	}
}
function action(){
  if(tree.getSelected().parentNode!= null){
      var info =tree.getSelected().info;
      var node =info.split(",");
      document.all.DIFRAME.src ="Child.jsp?pfaq_no="+node[0];
   }
   else{
      document.all.DIFRAME.src ="Child.jsp";
   }
}

</script>
