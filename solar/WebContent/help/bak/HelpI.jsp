<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<HTML><HEAD><TITLE>Untitled Document</TITLE><LINK href="res/tree.css" 
type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY onselectstart="return false" leftMargin=0 
background=images/helpbg1.gif topMargin=2 
>
<TABLE cellSpacing=0 cellPadding=0 width="90%" border=0 align=right>
  <TBODY>
  <TR>
    <TD><!-- Folder Tree Container -->
      <DIV id=folderTree 
style="PADDING-TOP: 8px">
	<link type="text/css" rel="stylesheet" href="res/xtree.css">
	<script src="res/xtree.js"></script>
			<$:A service="GetFaqTree" dynamic="true"/>
			<$:M dtype="1"/>
			<%
				if(ServletUtil.getResult(request,"FaqTree") !=null)
				{
					DataSet alTree =(DataSet)ServletUtil.getResult(request,"FaqTree");
					%>
	               <$:Tree treeData="<%=alTree%>" head="系统帮助文档" pidF="PFAQ_NO" idF="FAQ_NO" pid="0" titleF="SUBJECT" hiddenF="FAQ_NO,SUBJECT" icon="aq.gif"/>
					<%
				}
			%>
</DIV></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript>
function action(){
   if(tree.getSelected().parentNode!= null)
   {
		var info =tree.getSelected().info;
		var node =info.split(",");
      parent.document.all.mainFrame.src ="Help.jsp?faq_no="+node[0];
   }
   else
      parent.document.all.mainFrame.src ="Help.jsp?fun_id=0";
}
</SCRIPT>
</BODY></HTML>
