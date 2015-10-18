<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HTML lang=zh><HEAD><TITLE></TITLE>
<LINK href="res/expand.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY text=#000000 bgColor=#f2f5f8 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=left background=images/jietu04.gif>
      <TABLE cellSpacing=3 cellPadding=0 width="93%" border=0>
        <TBODY>
        <TR>
          <TD align=right width=28>&nbsp;</TD>
          <TD align=middle width=24><A 
            onmouseover="document.email.src='images/emaila.gif';" 
            onclick="newmail();return false;" 
            onmouseout="document.email.src='images/email.gif';"><IMG 
            height=24 alt=新建邮件 src="images/email.gif" width=24 border=0 
            name=email></A> </TD>
          <TD align=middle width=24><A 
            onmouseover="document.notation.src='images/liuyana.gif';" 
            onclick="newannotation();return false;" 
            onmouseout="document.notation.src='images/liuyan.gif';"><IMG 
            height=24 alt=新建便笺 src="images/liuyan.gif" width=24 
            border=0 name=notation></A> </TD>
          <TD align=middle width=24><A 
            onmouseover="document.schedule.src='images/rizhia.gif';" 
            onclick="newschedule();return false;" 
            onmouseout="document.schedule.src='images/rizhi.gif';"><IMG 
            height=24 alt=新建日程安排 src="images/rizhi.gif" width=24 
            border=0 name=schedule></A> </TD>
          <TD align=middle width=24><A 
            onmouseover="document.doc.src='images/liuyan_2a.gif';" 
            onclick="newRichDoc();return false;" 
            onmouseout="document.doc.src='images/liuyan_2.gif';"><IMG 
            height=24 alt=新建文档 src="images/liuyan_2.gif" width=24 
            border=0 name=doc></A> </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<SCRIPT language=JavaScript>
<!--
function newmessage()
{
}
function newmail()
{
	url =_WEBPATH+"/mail/inner/Inner.jsp?type=1";
	parent.parent.mainframe.location=url;
}
function newannotation()
{
	url =_WEBPATH+"/oa/note/Note.jsp";
	parent.parent.mainframe.location =url;
}
function newschedule()
{
	url =_WEBPATH+"/oa/arrange/Index.jsp";
	parent.parent.mainframe.location =url;
}
function newRichDoc()
{
	url =_WEBPATH+"/oa/document/StaffDoc.jsp";
	parent.parent.mainframe.location =url;
}

-->
</SCRIPT>
</BODY></HTML>
