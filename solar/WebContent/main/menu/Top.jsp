<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sPosiName ="";
String sStaffName ="";
String sRealName ="";
String sBgColor="";
if(session.getAttribute("user") !=null)
{
	Identity user =(Identity)session.getAttribute("user");
	sPosiName =user.get("posi-name","").toString();
	sStaffName =user.get("staff-name","").toString();
	sRealName =user.get("real-name","").toString();
	sBgColor =user.get("table-style","").toString()+"/";
}
%>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0"> 
<table width="100%"  border="0" cellspacing="0" cellpadding="0"  background="images/20046181127513746.gif"> 
  <tr> 
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" height=48> 
        <tr> 
          <td width=1% nowrap>&nbsp;&nbsp;</td> 
          <td align=center valign=top><table border="0" cellpadding="0" cellspacing="0"> 
              <tr> 
                <td  valign=top>
						
					</td> 
              </tr> 
            </table>
				</td> 
				 <td align="right" valign="top" nowrap><table  border="0" cellspacing="0" cellpadding="0"  bgcolor="#99CCCC"> 
					  <tr align="left" valign="middle"> 
						 <td height="24" nowrap><td height="24" nowrap><a style="CURSOR:hand" onClick="$E.runOpen('<%=GlobalUtil._WEB_PATH%>/system/premission/ChangePassword.jsp', false, 400,200);">&nbsp;<font style="font-size:12px; color:#000099 "><b>修改密码</a></b></font>&nbsp;|</td><td height="24" nowrap><a style="CURSOR:hand" onClick=window.parent.mainframe.location='<%=GlobalUtil._WEB_PATH%>/staff/portlet/StaffPortlet.jsp'>&nbsp;<font style="font-size:12px; color:#000099 "><b>工作台</a></b></font>&nbsp;|</td> 
						 <td height="24" nowrap ><a style="CURSOR: hand" onclick="relogon()"><font style="font-size:12px; color:#000099 "><b>重新登录</a></b></font></td> 
						 <td nowrap><a onClick="exitlogon()"><font style="font-size:12px; color:#000099 ">&nbsp;|<b>退出系统</a></b></font>&nbsp;|</td> 
					  </tr> 
					</table></td> 
			  </tr> 
			</table></td> 
  </tr> 
  <tr> <td height="21">    <table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0"> 
      <tr class="tr_c"> 
        <td align="center" valign="middle" nowrap width=1%><b><%=SystemInfo._SOFTNAME%></b>欢迎您:<%=sRealName%>;<a style="CURSOR:hand" onClick=window.parent.mainframe.location='<%=GlobalUtil._WEB_PATH%>/staff/disk/Online.jsp'><font color="red"><B>在线人员：<input type =text name="staffs" style="border-top-width=0px; border-right-width=0px;border-bottom-width=0px; border-left-width=0px" value='<%=com.juts.web.status.OnlineUsers.oOnlineUsers.size()%>' readonly size=3></B></font></a></td> 
        <td width="31"><img src="images/<%=sBgColor%>bg2.gif" width="31" height="21"></td> 
        <td align="left" valign="middle" nowrap background="images/<%=sBgColor%>bg3.gif"> 
        <%
   Identity oUser =(Identity)session.getAttribute("user");
   if(oUser !=null)
   {   
      DataSet alMenu = (DataSet)oUser.get("staff-fun");
		if(alMenu !=null){
			for(int i=0; i<alMenu.size(); i++)
			{
				HashMap hmRow =(HashMap)alMenu.get(i);
				if(hmRow !=null && hmRow.get("UP_FUN_ID") !=null 
					&& hmRow.get("UP_FUN_ID").toString().equals("0"))//ê×??2?μ￥
				{
					%> 
			  .<B><A href =javascript:go("<%=GlobalUtil._WEB_PATH%>/main/menu5/MenuPage.jsp?fun_id=<%=hmRow.get("FUN_ID")%>")><font style="font-size:12px; color:#ffffff "><%=hmRow.get("FUN_NAME")%></font></A></B>
			  <%
				}
			}
		}
   }%> 
      </td> 
       <td width="11"><img src="images/<%=sBgColor%>bg5.gif" width="11" height="21"></td> 
      </tr> </table> 
    </td> 
  </tr> 
  <tr> 
    <td height="14" background="images/<%=sBgColor%>bg4.gif">&nbsp;</td> 
  </tr> 
</table>
</body>
<SCRIPT>
function exitlogon()
{
	window.open('<%=GlobalUtil._WEB_PATH%>/login/Exit.jsp');
	parent.window.close();
}
function relogon()
{
	if(confirm("注意：要重新登陆系统吗？"))
	{
	   parent.window.location="<%=GlobalUtil._WEB_PATH%>/login/Index.jsp?offline=1";
      //parent.window.location="<%=GlobalUtil._WEB_PATH%>/demologin/login1.jsp";
	}
}
function doAction(type)
{
   if(type ==2)
   {
      window.parent.middle.location='<%=GlobalUtil._WEB_PATH%>/system/premission/StaffConf.jsp';
   }
   else
	   message("正在建设中......");
}
function go(tag)
{
   window.parent.menubarframe.location="<%=GlobalUtil._WEB_PATH%>/system/info/Left.jsp";
   //window.parent.middle.location="<%=GlobalUtil._WEB_PATH%>/system/info/right.jsp#"+tag;
}
function go(src)
{
	parent.document.all.menubarframe.src=src;
	return;	
}
function setOnlines(staffs)
{
	document.all.staffs.value =staffs;
}
function onForum()
{
	window.open("<!--%=GlobalNames.FORUM_URL%>/mvnforum/index");
}
function onProms()
{
	window.open('<%=GlobalUtil._WEB_PATH%>/oa/help/Problems.jsp');
}
</script>