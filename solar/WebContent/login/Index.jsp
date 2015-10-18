<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/CookieClass.js"></script>
<LINK href="new/expand.css" type=text/css rel=stylesheet>
<LINK href="new/css.css" type=text/css rel=stylesheet>
<%
//使原来登录用户信息失效
Identity oUser=(Identity)session.getAttribute("user");
if(oUser !=null)
{
	String sOffStaffNo =oUser.get("staff-no").toString();
	//清除在线人员信息
	com.juts.web.status.OnlineUsers.removeUser(sOffStaffNo);
}
session.removeAttribute("user");
%>

<SCRIPT language=javascript>
<!--
function login(){
	form =document.forms["loginForm"];
   if(form.staff_name.value=='')
   {
      alert('用户名不能为空');
      form.staff_name.focus();
      return false;
   }
   if(form.password.value=='')
   {
      alert('密码不能为空');
      form.password.focus();
      return false;
   }
	//判断是否记住密码
	if(form.idCkSavePword.checked)
	{
		var o=new CookieClass();
		var date=new Date();
		o.expires =30;//一个月有效
		o.setCookie("_jutstaffname", form.staff_name.value);
		o.setCookie("_jutpassword", form.password.value);
	}
	else
	{
		var o=new CookieClass();
		o.deleteCookie("_jutstaffname");
		o.deleteCookie("_jutpassword");
	}
   if(form.with_rtx.checked)
	{
		form.rtx.value =1;
		form.action ="<%=GlobalUtil._WEB_PATH%>/login/RtxLoginDispatcher.jsp";
	}
   form.submit();
}
function login2(){
  if(event.keyCode == 13) login();
}

//-->
</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=130 bgcolor="#EFEFEF" onLoad="this_init()">
<DIV id=diverror style="RIGHT: 8pt; POSITION: absolute; align: right"></DIV>
<FORM name=loginForm method=post action="<%=GlobalUtil._WEB_PATH%>/login/LoginDispatcher.jsp">
<input type=hidden name="rtx" value="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=bottom align=right width=928 
    background=new/denglu_2.jpg height=268>
      <TABLE cellSpacing=0 cellPadding=0 width=850 border=0>
        <TBODY>
		<TR>
          <TD width=100></TD>
          <TD class=daohang vAlign=bottom  align=left>版本 v 2.1</TD>
          <TD colSpan=4>&nbsp;</TD></TR>
		<TR>
          <TD colspan=10 align=right class=daohang2><%=SystemInfo._SOFTNAME%>(<%=SystemInfo._SOFTENAME%>)&nbsp;&nbsp;</TD></TR>
		<TR>
          <TD colspan=10 height=30>&nbsp;</TD></TR>
		<TR>
          <TD width=600></TD>
          <TD class=daohang vAlign=bottom align=right width=68 nowrap>登录帐号：</TD>
          <TD style="FONT-FAMILY: Arial" width=126><INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=1 maxLength=15 
            size=10 name="staff_name" value="system"></TD>
          <TD class=daohang align=left colSpan=4 nowrap>密码：<INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 
            type=password maxLength=30 size=10 value='123' name="password"><input type=checkbox id="idCkSavePword"><label style='cursor:hand' for='idCkSavePword'>记住</label>
				</TD></TR>
        <TR>
          <TD></TD>
          <TD class=daohang vAlign=bottom align=right>验证码：</TD>
          <TD style="FONT-FAMILY: Arial"><INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 
            type=text value='123' maxLength=30 size=4 name="yzm"><img border=0 src="<%=GlobalUtil._WEB_PATH%>/login/Image.jsp"></TD>
          <TD class=daohang align=left colSpan=3><input type=checkbox name="with_rtx" id='id_with_rtx'><label for='id_with_rtx' style='hand:cursor'>同时登陆RTX</label></TD>
          <TD colSpan=2>
            <TABLE cellSpacing=0 cellPadding=0 width=60 border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left width=5 height=19><IMG height=19 
                  src="new/anniu_1.gif" width=5></TD>
                <TD class=daohang vAlign=bottom align=middle width=50 
                background=new/anniu_di.gif><A 
                  class=daohang style="CURSOR: hand" onclick=login();>确定</A> </TD>
                <TD vAlign=top align=right width=5><IMG height=19 
                  src="new/anniu_1a.gif" 
              width=5></TD></TR></TBODY></TABLE></TD>
          <TD width=70>
            <TABLE cellSpacing=0 cellPadding=0 width=60 border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left width=5 height=19><IMG height=19 
                  src="new/anniu_1.gif" width=5></TD>
                <TD class=daohang vAlign=bottom align=middle width=50 
                background=new/anniu_di.gif><A 
                  class=daohang style="CURSOR: hand" 
                  onclick=loginForm.reset();>取消</A> </TD>
                <TD vAlign=top align=right width=5><IMG height=19 
                  src="new/anniu_1a.gif" 
              width=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD height=30>&nbsp;</TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="85%" border=0>
        <TBODY>
        <TR>
          <TD class=daohang align=right>版权所有 &copy; 深圳巨唐科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD>
    <TD background=new/denglu_1a.gif>&nbsp;</TD></TR></TBODY></TABLE></FORM>
<SCRIPT language=JavaScript type=text/javascript>
  <!--
  var focusControl = document.forms["loginForm"].elements["staff_name"];

  if (focusControl.type != "hidden") {
     focusControl.focus();
  }
  // -->
</SCRIPT>
<script language="javascript">
<!--
function this_init(){
 <$:A service="getPushBulletin" dynamic="false">
	<$:P name="type" value="0"/>
</$:A>
<$:M dtype="1"/>
<%
if(ServletUtil.getResult(request,"BULLETIN") !=null)
{
	%>
	$E.runOpen("<%=GlobalUtil._WEB_PATH%>/oa/bulletin/ViewBulletin.jsp", false, 600, 500);
	<%
}
%>
  $E.focus("staff_name");
	//获取登录记忆
	var cook = new CookieClass();
	if(cook.getCookie("_jutstaffname") !="")
	{
		document.all.idCkSavePword.checked =true;
		$S("staff_name", cook.getCookie("_jutstaffname"));
		$S("password", cook.getCookie("_jutpassword"));
	}
}

 </script>
</BODY>
</HTML>
