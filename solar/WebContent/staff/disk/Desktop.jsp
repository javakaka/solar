<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<LINK href="<%=GlobalUtil._WEB_PATH%>/main/menu5/res/css.css" type=text/css rel=stylesheet><!-- Styles --><LINK 
href="<%=GlobalUtil._WEB_PATH%>/main/menu5/res/expand.css" type=text/css rel=stylesheet>
<%@ page import="Row"%>
<style>
.sidebarContent {
	PADDING-RIGHT: 7px; PADDING-LEFT: 7px; BACKGROUND: #e9e9e6; PADDING-BOTTOM: 6px; WIDTH: 165px; PADDING-TOP: 8px
}
.containerHeader {
	BACKGROUND: #C6EBFF;
	font-weight: bold;
	font-size:14px;
}
.containerFooter {
	BACKGROUND: #999999; MARGIN-BOTTOM: 12px
}
</style>
<SCRIPT language=javascript  src='<%=GlobalUtil._WEB_PATH%>/oa/msg/asmsn.js' type=text/javascript></SCRIPT>
<body topmargin="0">
<table id="tabMain" name="tabMain" cellpadding="0" cellSpacing=0 width="100%" height="100%" valign=top border=0>
<tr>
	<td valign="top" width=75%>
		<jsp:include page="/main/menu5/MainPage.jsp" flush="true"/>
	</td>
	<td valign=top>
<TABLE cellSpacing=0 cellPadding=0  border=0 width=100% align=right>
	<TBODY>
	<TR>
		<TD height=250>
      <DIV><!--Start CurvTable-->
      <TABLE  height="480" cellSpacing=0 cellPadding=0 width="100%" border=0><!--Start Curv Table Header-->
        <TBODY>
        <TR>
          <TD colSpan=3>
            <TABLE cellSpacing=0 cellPadding=0 width="100%">
              <TBODY>
              <TR>
                <TD vAlign=bottom align=left><IMG 
                  src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_1.gif"></TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left" 
                width="100%">系统公告</TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left">
                  <TABLE style="FONT-SIZE: 10pt" cellSpacing=0 cellPadding=0 
                  width=50>
                    <TBODY>
                    <TR>
                      <TD><A 
                        onmouseover="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_2.gif';" 
                        onclick="frmbulletin.location.reload();return false;" 
                        onmouseout="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif';" 
                        href=javascript:frmbulletin.src='<%=GlobalUtil._WEB_PATH%>/staff/disk/config/bulletin.jsp'><IMG 
                        alt=刷新 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif" 
                        name=refreshimg2></A></TD>
                      <TD><A 
                        onmouseover="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_2.gif';" 
                        onmouseout="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif';" 
                        href="<%=GlobalUtil._WEB_PATH%>/staff/disk/config/bulletin.jsp"><IMG 
                        src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif" 
                        name=gotoimg2></A></TD></TR></TBODY></TABLE></TD>
                <TD><IMG 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_1.gif"></TD></TR></TBODY></TABLE></TD></TR><!--End Curv Table Header--><!--Start Curv Table Body-->
        <TR>
          <TD vAlign=top align=left width=7 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif><IMG height=1 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif" width=7></TD>
          <TD width="100%" height="100%">
            <TABLE height="100%" width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=center align=middle width="100%"><IFRAME id=frmbulletin name=frmbulletin 
                  src="<%=GlobalUtil._WEB_PATH%>/staff/disk/config/bulletin.jsp" frameBorder=0 
                  width="100%" 
            height="100%">
	          </IFRAME></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=left width=10 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_y.gif><IMG height=1 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_y.gif" width=10></TD></TR><!--End Curv Table Body-->
        <TR>
          <TD vAlign=top align=left width=7 height=11><IMG height=11 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_l.gif" width=7></TD>
          <TD vAlign=top align=left width="100%" 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_bg.gif><IMG height=11 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_bg.gif"></TD>
          <TD vAlign=top align=left width=10 height=11><IMG height=11 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_2.gif" width=10></TD></TR></TBODY></TABLE><!--End Curv Table--></DIV>
		</TD>
	</TR>
	<TR>
</TABLE>
	</td>
</tr>
</table>
<table id="msgalert" border="0">
<tr>
<td>
</td>
</tr>
</table>
<!--右下角end-->
<script>
function msgAlert(msg)
{
	var oCells = new Array();
	oCells[0] = msg;
	runTableClear(msgalert);
	Table.Table.clear(msgalert, oCells);
}
//window.parent.window.onlinestaff.location="<%=GlobalUtil._WEB_PATH%>/main/online.jsp";
</script>
</body>
</html>
