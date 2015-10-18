<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<LINK href="<%=GlobalUtil._WEB_PATH%>/main/menu5/res/css.css" type=text/css rel=stylesheet><!-- Styles --><LINK 
href="<%=GlobalUtil._WEB_PATH%>/main/menu5/res/expand.css" type=text/css rel=stylesheet>

<STYLE>A {
	FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; TEXT-DECORATION: none
}
</STYLE>
</HEAD>
<BODY style="PADDING-RIGHT: 0pt; PADDING-LEFT: 0pt; PADDING-BOTTOM: 0pt; MARGIN: 0pt; PADDING-TOP: 0pt">
<CENTER>
<TABLE height="100%" border=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR><!--info window-->
    <TD width="100%" colspan=2 height=120>
      <DIV><!--Start CurvTable-->
      <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0><!--Start Curv Table Header-->
        <TBODY>
        <TR>
          <TD colSpan=3>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=bottom align=left><IMG 
                  src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_1.gif"></TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left" 
                width="100%">最新信息</TD>
					 <TD style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left" 
                width="100%"><input type=button value="上班" name="btGoWork"><input type=button value="下班" name="btDownWork"></TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left">
                  <TABLE style="FONT-SIZE: 10pt" cellSpacing=0 cellPadding=0 
                  width=50>
                    <TBODY>
                    <TR>
                      <TD><A 
                        onmouseover="document.refreshimg1.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_2.gif';" 
                        onclick="frminfo.location.reload();return false;" 
                        onmouseout="document.refreshimg1.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif';" 
                        href=javascript:frminfo.src='<%=GlobalUtil._WEB_PATH%>/staff/disk/config/FirstNews.jsp'><IMG 
                        alt=刷新 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif" 
                        name=refreshimg1></A></TD>
                      <TD><A 
                        onmouseover="document.gotoimg1.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_2.gif';" 
                        onmouseout="document.gotoimg1.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif';" 
                        href="<%=GlobalUtil._WEB_PATH%>/staff/disk/config/JutsNews.jsp"><IMG 
                        alt=信息看台 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif" 
                        name=gotoimg1></A></TD></TR></TBODY></TABLE></TD>
                <TD><IMG 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_1.gif"></TD></TR></TBODY></TABLE></TD></TR><!--End Curv Table Header--><!--Start Curv Table Body-->
        <TR>
          <TD vAlign=top align=left width=7 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif><IMG height=1 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif" width=7></TD>
          <TD width="100%" height="100%">
            <TABLE height="100%" width="100%">
              <TBODY>
              <TR>
                <TD vAlign=center align=middle width="100%" 
                  height="100%"><IFRAME id=frminfo name=frminfo 
                  src="<%=GlobalUtil._WEB_PATH%>/staff/disk/config/FirstNews.jsp" frameBorder=0 width="100%" 
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
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_2.gif" width=10></TD></TR></TBODY></TABLE><!--End Curv Table--></DIV></TD>
</TR>
  <TR><!--schedule window-->
    <TD width="60%">
      <DIV><!--Start CurvTable-->
      <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0><!--Start Curv Table Header-->
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
                width="100%">待办工作</TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left">
                  <TABLE style="FONT-SIZE: 10pt" cellSpacing=0 cellPadding=0 
                  width=50>
                    <TBODY>
                    <TR>
                      <TD><A 
                        onmouseover="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_2.gif';" 
                        onclick="frmtask.location.reload();return false;" 
                        onmouseout="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif';" 
                        href=javascript:frmtask.src='<%=GlobalUtil._WEB_PATH%>/oa/task/Tasks.jsp'><IMG 
                        alt=刷新 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif" 
                        name=refreshimg2></A></TD>
                      <TD><A 
                        onmouseover="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_2.gif';" 
                        onmouseout="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif';" 
                        href="<%=GlobalUtil._WEB_PATH%>/oa/task/Tasks.jsp"><IMG 
                        alt=待办工作 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif" 
                        name=gotoimg2></A></TD></TR></TBODY></TABLE></TD>
                <TD><IMG 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_1.gif"></TD></TR></TBODY></TABLE></TD></TR><!--End Curv Table Header--><!--Start Curv Table Body-->
        <TR>
          <TD vAlign=top align=left width=7 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif><IMG height=1 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif" width=7></TD>
          <TD width="100%" height="100%">
            <TABLE height="100%" width="100%">
              <TBODY>
              <TR>
                <TD vAlign=center align=middle width="100%" 
                  height="100%"><IFRAME id=frmtask name=frmtask 
                  src="<%=GlobalUtil._WEB_PATH%>/oa/task/Tasks.jsp" frameBorder=0 
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
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_bottom_2.gif" width=10></TD></TR></TBODY></TABLE><!--End Curv Table--></DIV></TD>
    <TD width="40%" height="50%">
		<DIV><!--Start CurvTable-->
      <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0><!--Start Curv Table Header-->
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
                width="100%">邮件</TD>
                <TD 
                style="FONT-SIZE: 10pt; BACKGROUND-IMAGE: url(<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_center_bg.gif); BACKGROUND-REPEAT: repeat-x; align: left">
                  <TABLE style="FONT-SIZE: 10pt" cellSpacing=0 cellPadding=0 
                  width=50>
                    <TBODY>
                    <TR>
                      <TD><A 
                        onmouseover="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_2.gif';" 
                        onclick="frmmail.location.reload();return false;" 
                        onmouseout="document.refreshimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif';" 
                        href=javascript:frmmail.src='<%=GlobalUtil._WEB_PATH%>/staff/disk/config/Mails.jsp'><IMG 
                        alt=刷新 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/refresh_1.gif" 
                        name=refreshimg2></A></TD>
                      <TD><A 
                        onmouseover="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_2.gif';" 
                        onmouseout="document.gotoimg2.src='<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif';" 
                        href="<%=GlobalUtil._WEB_PATH%>/mail/inner/Inner.jsp"><IMG 
                        alt=邮件 src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/goto_1.gif" 
                        name=gotoimg2></A></TD></TR></TBODY></TABLE></TD>
                <TD><IMG 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_right_1.gif"></TD></TR></TBODY></TABLE></TD></TR><!--End Curv Table Header--><!--Start Curv Table Body-->
        <TR>
          <TD vAlign=top align=left width=7 
          background=<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif><IMG height=1 
            src="<%=GlobalUtil._WEB_PATH%>/main/menu5/images/curv_left_y.gif" width=7></TD>
          <TD width="100%" height="100%">
            <TABLE height="100%" width="100%">
              <TBODY>
              <TR>
                <TD vAlign=center align=middle width="100%" 
                  height="100%"><IFRAME id=frmmail name=frmmail 
                  src="<%=GlobalUtil._WEB_PATH%>/staff/disk/config/Mails.jsp" frameBorder=0 
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
</TD></TR></TBODY></TABLE></CENTER>
</BODY></HTML>
<script>
var o$S =null;
function onPageInit()
{
	//判断是否进行上班登记
	o$S =new $S("checkRegistWorkStatus");
	o$S.callService(o$S, false, onAction);		
}

function onAction()
{
	var isReg =o$S.getDefaultParamValue("REGISTER");
	if(isReg !="true")
	{
		//if(confirm("你今天没有登记上班，是否立即登记？"))
		{
		}
	}
}
onPageInit();
</script>