<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/CookieClass.js"></script>
<LINK href="new/expand.css" type=text/css rel=stylesheet>
<LINK href="new/css.css" type=text/css rel=stylesheet>
<%
//ʹԭ����¼�û���ϢʧЧ
Identity oUser=(Identity)session.getAttribute("user");
if(oUser !=null)
{
	String sOffStaffNo =oUser.get("staff-no").toString();
	//���������Ա��Ϣ
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
      alert('�û�������Ϊ��');
      form.staff_name.focus();
      return false;
   }
   if(form.password.value=='')
   {
      alert('���벻��Ϊ��');
      form.password.focus();
      return false;
   }
	//�ж��Ƿ��ס����
	if(form.idCkSavePword.checked)
	{
		var o=new CookieClass();
		var date=new Date();
		o.expires =30;//һ������Ч
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
          <TD class=daohang vAlign=bottom  align=left>�汾 v 2.1</TD>
          <TD colSpan=4>&nbsp;</TD></TR>
		<TR>
          <TD colspan=10 align=right class=daohang2><%=SystemInfo._SOFTNAME%>(<%=SystemInfo._SOFTENAME%>)&nbsp;&nbsp;</TD></TR>
		<TR>
          <TD colspan=10 height=30>&nbsp;</TD></TR>
		<TR>
          <TD width=600></TD>
          <TD class=daohang vAlign=bottom align=right width=68 nowrap>��¼�ʺţ�</TD>
          <TD style="FONT-FAMILY: Arial" width=126><INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=1 maxLength=15 
            size=10 name="staff_name" value="system"></TD>
          <TD class=daohang align=left colSpan=4 nowrap>���룺<INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 
            type=password maxLength=30 size=10 value='123' name="password"><input type=checkbox id="idCkSavePword"><label style='cursor:hand' for='idCkSavePword'>��ס</label>
				</TD></TR>
        <TR>
          <TD></TD>
          <TD class=daohang vAlign=bottom align=right>��֤�룺</TD>
          <TD style="FONT-FAMILY: Arial"><INPUT class=textkuang 
            onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 
            type=text value='123' maxLength=30 size=4 name="yzm"><img border=0 src="<%=GlobalUtil._WEB_PATH%>/login/Image.jsp"></TD>
          <TD class=daohang align=left colSpan=3><input type=checkbox name="with_rtx" id='id_with_rtx'><label for='id_with_rtx' style='hand:cursor'>ͬʱ��½RTX</label></TD>
          <TD colSpan=2>
            <TABLE cellSpacing=0 cellPadding=0 width=60 border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=left width=5 height=19><IMG height=19 
                  src="new/anniu_1.gif" width=5></TD>
                <TD class=daohang vAlign=bottom align=middle width=50 
                background=new/anniu_di.gif><A 
                  class=daohang style="CURSOR: hand" onclick=login();>ȷ��</A> </TD>
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
                  onclick=loginForm.reset();>ȡ��</A> </TD>
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
          <TD class=daohang align=right>��Ȩ���� &copy; ���ھ��ƿƼ����޹�˾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD>
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
	//��ȡ��¼����
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
