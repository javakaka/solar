<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<HTML>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HEAD>
<TITLE>Untitled Document</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.2800.1515" name=GENERATOR>
<link type="text/css" rel="stylesheet" href="res/xtree2.css" />
<script src="res/xtree2.js"></script>
</HEAD>
<BODY onselectstart="return false" leftMargin=0 
background=images/helpbg1.gif topMargin=2 
>
<TABLE cellSpacing=0 cellPadding=0 width="90%" border=0 align=right>
  <TBODY>
  <TR>
    <TD><!-- Folder Tree Container -->
      <DIV id=folderTree 
style="PADDING-TOP: 8px">
			<cc:xtree treeData="${treeData}" head="帮助文档" pidF="PFAQ_NO" idF="FAQ_NO" pid="0" titleF="SUBJECT" hiddenF="FAQ_NO,SUBJECT " icon="aq.gif" />
</DIV></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript>
function action(){
   if(tree.getSelected().parentNode!= null)
   {
		var info =tree.getSelected().info;
		var node =info.split(",");
      parent.document.all.mainFrame.src ="Help.do?faq_no="+node[0];
   }
   else
      parent.document.all.mainFrame.src ="Help.do?fun_id=0";
}

var SELECTED_FUN_ID="";
function action(val){
   var url="";
   if(tree.getSelected().parentNode!= null)
   {
	   if(typeof val !="undefined" && val !=null && val !=""){
		var info =val;
		var node =info.split(",");
		parent.document.all.mainFrame.src ="Help.do?faq_no="+node[0];
		SELECTED_FUN_ID=node[1];
	   }
   }
   else
   {
	   parent.document.all.mainFrame.src ="Help.do?fun_id=0";
	  SELECTED_FUN_ID="";
   }
   
}
</SCRIPT>
</BODY></HTML>
