<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<%session.setAttribute("ikeyRandom","1234");%>
<script src="<%=GlobalNames.WEB_PATH%>/res/js/string.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=GlobalNames.WEB_PATH%>/res/js/ProBar.js"></script>
<LINK href="new/expand.css" type=text/css rel=stylesheet>
<LINK href="new/css.css" type=text/css rel=stylesheet>
<!-- IKEY的客户端检测控件，用于检测最终用户是否安装了客户端 -->
    <OBJECT ID="IkeyCheckClient" CLASSID="CLSID:0C9D30AB-1840-463F-BD45-E4BB5AAD4342" codebase="<%=GlobalNames.WEB_PATH%>/ikey/ikChkClient.dll#version=1,0,0,5" width=0 height=0></OBJECT>

<!-- 检测客户端是否存在，如存在则只引入网页证证控件，否则引入整个客户端控件 -->
    <script language="javascript">
    var haveClient = IkeyCheckClient.CheckClient();
    if( haveClient==true )
        document.write("<OBJECT ID=iKeyClient CLASSID=clsid:2669C745-AF54-4B50-B97C-7683123FEBA2 codebase='<%=GlobalNames.WEB_PATH%>/ikey/ikeyclient.dll#version=1,0,0,6' events='true' width=0 height=0></OBJECT>");
    else
	 {
		  document.write("<OBJECT ID=iKeyClient CLASSID=clsid:2669C745-AF54-4B50-B97C-7683123FEBA2 codebase='<%=GlobalNames.WEB_PATH%>/ikey/ikeyclient.cab#version=1,0,0,6' events='true' width=0 height=0></OBJECT>");
	 }
    </script>

<!-- 下面的SCRIPT程序段用于响应IKEY插拨动作，并显示相应的提示 -->
<SCRIPT FOR=iKeyClient EVENT=Insert language="javascript">OnInsert();</script>
<SCRIPT FOR=iKeyClient EVENT=Remove language="javascript">OnRemove();</script>
<SCRIPT language="VBScript">
Function IKeyRun(Pin)
    Dim username, ikeyDigest, chlng, succeed

    succeed = 0
    on error resume next

    ' 打开iKey设备
    iKeyClient.Open
    if Err then
      MsgBox "打开iKey设备失败。返回码 0x" & hex(Err.number)
    else
      ' Verify PIN
      iKeyClient.VerifyPin Pin
      if Err then
        MsgBox "校验PIN失败。返回码 0x" & hex(Err.number)
      else

        ' Change Dir to special directory, by name
        iKeyClient.ChangeDirByName "Web Office"
        if Err then
          MsgBox "改变目录失败。返回码 0x" & hex(Err.number)
        else

          ' Get User Name
          username = ikeyclient.GetUsername(2)	'打开存储用户名的数据文件
          if Err then
            MsgBox "获取用户名失败。返回码 0x" & hex(Err.number)
          else

            '获取挑战随机数
            chlng = "<%=session.getAttribute("ikeyRandom")%>" '获取服务器端产生的挑战数据

				' 得到客户端IKEY对挑战数据的哈希结果
            ikeyDigest = iKeyClient.Authenticate(3, 4, chlng)
            if Err then
              MsgBox "哈希运算失败。返回码 0x" & hex(Err.number)
            else
              succeed = 1
            end if '哈希运算

          end if '获取用户名

        end if '改变目录

      end if '校验PIN

    end if '打开设备

    iKeyClient.Close		'关闭设备

    if succeed=0 then           '未成功，刷新本页
        self.location.reload
    else
        self.location="<%=GlobalNames.WEB_PATH%>/main/login/LoginDispatcher.jsp?ikey_digest=" & ikeyDigest & "&staff_name=" & username &"&login_type=ikey"
    end if

End Function
</SCRIPT>
<SCRIPT language=javascript>
<!--
function login(){
	form =document.forms["loginForm"];
	if(form.login_type.value =="ikey")
	{
		if(form.PIN.value =="")
		{
			message("请输入PIN码！");
			form.PIN.focus();
			return false;
		}
		else
		{
			IKeyRun(form.PIN.value);
			return false;
		}
	}
	else
	{
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
		<%
		if(GlobalNames.UNION_FORUM && GlobalNames.FORUM_URL !=null)
		{//与论坛统一身份登陆
		%>
			forum.document.all.MemberName.value =form.staff_name.value;
			forum.document.all.MemberMatkhau.value =form.password.value;
			//forum.document.submitform.submit();
		<%}%>
		form.submit();
		openPopProcessBar();
	}
}
function login2(){
  if(event.keyCode == 13) login();
}

//-->
</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=130 bgcolor="#EFEFEF" onLoad="this_init()">
<FORM name=loginForm method=post action="<%=GlobalNames.WEB_PATH%>/main/login/LoginDispatcher.jsp">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=BOTTOM align=right width=928 background=new/denglu_2.jpg height=268>
				<TABLE WIDTH=600 HEIGHT=200 BORDER=0 cellSpacing=0 cellPadding=0>
					<TR>
						<TD VALIGN=TOP ALIGN=RIGHT class=daohang>版本 v 2.1</TD>
					</TR>
					<TR>
						<TD VALIGN=TOP ALIGN=RIGHT class=daohang2><%=GlobalNames.SOFTWARE_NAME%>(<%=GlobalNames.SOFTWARE_ENAME%>)&nbsp;&nbsp;</TD>
					</TR>
					<TR>
						<TD VALIGN=TOP HEIGHT=22 ALIGN=RIGHT class=daohang>&nbsp;</TD>
					</TR>
					<TR>
						<TD VALIGN=TOP ALIGN=CENTER>
							<TABLE height="80">
								<TR>
									<TD BGCOLOR="#FFFFFF"></TD>
									<TD width=200>
										<DIV id="pword" style="position:absolute; width:100%; height:95%;">
											<TABLE>
												<TR>
													<TD class=daohang vAlign=bottom align=right width=68 nowrap>登录帐号：</TD>
													<TD><INPUT class=textkuang onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=1 maxLength=15 size=16 name="staff_name"></TD>
												</TR>
												<TR>
													<TD class=daohang vAlign=bottom align=right width=68 nowrap>密码：</TD>
													<TD><INPUT class=textkuang onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 type=password maxLength=30 size=16 name="password"></TD>
												</TR>
												<TR>
													<TD class=daohang vAlign=bottom align=right width=68 nowrap>验证码：</TD>
													<TD><INPUT class=textkuang onkeydown=login2(); style="FONT-FAMILY: Arial" tabIndex=2 type=text maxLength=30 size=4 name="yzm"><img border=0 src="<%=GlobalNames.WEB_PATH%>/main/login/image.jsp"></TD>
												</TR>
											</TABLE>
										</DIV>
										<DIV id="ikey" style="position:absolute; width:100%; height:95%; visibility: hidden">
											<TABLE VALIGN=MIDDLE>
												<TR>
													<TD VALIGN=MIDDLE ALIGN=LEFT class="daohang">请输入PIN码：</TD>
												</TR>
												<TR>
													<TD VALIGN=MIDDLE><INPUT id=_default style='LEFT: 3px; WIDTH: 165px; TOP: 1px; HEIGHT: 22px' type=password name=PIN maxlength='64' ></TD>
												</TR>
											</TABLE>
										</DIV>
										<DIV id="down" style="position:absolute; width:100%; height:95%; visibility: hidden">
											<TABLE VALIGN=MIDDLE>
												<TR>
													<TD VALIGN=MIDDLE ALIGN=LEFT class="daohang">没有发现IKEY客户端，请首先安装客户端然后再访问本系统<br>下载客户端程序RAR压缩版，请点击<a href='<%=GlobalNames.WEB_PATH%>/ikey/ikeyall.rar'>这里</a><br>安装完成后请<a href='javascript:location.reload()' target='_self'>刷新</a>本页，继续使用过程<br>
													</TD>
												</TR>
											</TABLE>
										</DIV>
									</TD>
									<TD VALIGN=MIDDLE>
										<TABLE>
											<TR>
												<TD>
													<TABLE cellSpacing=0 cellPadding=0 width=60 border=0>
													  <TBODY>
													  <TR>
														 <TD vAlign=top align=left width=5 height=19><IMG height=19 
															src="new/anniu_1.gif" width=5></TD>
														 <TD class=daohang vAlign=bottom align=middle width=50 background=new/anniu_di.gif><A class=daohang style="CURSOR: hand" onclick=login();>确定</A> </TD>
														 <TD vAlign=top align=right width=5><IMG height=19 src="new/anniu_1a.gif" width=5></TD>
														</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD>
													<TABLE cellSpacing=0 cellPadding=0 width=60 border=0>
													<TBODY>
														<TR>
															<TD vAlign=top align=left width=5 height=19><IMG height=19 src="new/anniu_1.gif" width=5></TD>
															<TD class=daohang vAlign=bottom align=middle width=50 background=new/anniu_di.gif><A class=daohang style="CURSOR: hand" onclick=loginForm.reset();>取消</A> </TD><TD vAlign=top align=right width=5><IMG height=19 src="new/anniu_1a.gif" width=5></TD>
														</TR>
													</TBODY>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
									<TD BGCOLOR="#FFFFFF"></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD VALIGN=TOP ALIGN=RIGHT class=daohang HEIGHT=100%>&nbsp;&nbsp;</TD>
					</TR>
				</TABLE>
			</TD>
			<TD background=new/denglu_1a.gif>&nbsp;</TD>
		</TR>
	</TBODY>
	</TABLE>
	<input type=hidden name="login_type">
	<input type=hidden name="tmp">
</FORM>
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
 <zz:Run service="getPushBulletin" dynamic="false">
	<zz:Arg name="type" value="0"/>
</zz:Run>
<zz:Error dtype="1"/>
<%
if(request.getAttribute(GlobalNames.BEGING_TAG+"BULLETIN") !=null)
{
	%>
	runOpen("<%=GlobalNames.WEB_PATH%>/oa/bulletin/view_bulletin.jsp", false, 600, 500);
	<%
}
%>
  /*
  if(window.screen.width==1024){
    document.body.style.backgroundImage="url('/TDynastyOA2001/img/main/login_bg2.gif')";
    divInput.style.left=520;
    divInput.style.top=425;
    diverror.style.left=100;
    diverror.style.top=120;
  }
  
  var user = GetCookie('staff_name');
  if(user != null && user.length > 0){
    document.loginForm.staff_name.value = user;
    document.loginForm.password.focus();
  }else{
    document.loginForm.staff_name.focus();
  }*/
  if(document.all.login_type.value =="")
  {
	  document.loginForm.staff_name.focus();
  }
  else
	;
}

function GetCookie (name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
      var j = i + alen;
      if (document.cookie.substring(i, j) == arg)
           return getCookieVal (j);
           i = document.cookie.indexOf(" ", i) + 1;
           if (i == 0){
               break;
           }
       }
     return "";
 }
	//	IKEY插拨处理函数
	function OnInsert()
	{
		history.go(0);
	}

	function OnRemove()
	{
		document.location.reload();
	}
	//if explorer (4.x)
	if (document.all) {
		layerRef='document.all'
		styleRef='.style.'
	}
	//else if netscape (4.x)
	else if (document.layers) {
		layerRef='document.layers'
		styleRef='.'
	} 
	else{
		alert("你使用的浏览器可能看不到效果。")
	}
	// 如果依然没有发现IKEY客户端，则提示最终用户直接下载
	if( haveClient==false && IkeyCheckClient.CheckClient()==false )
	{
		if(confirm("为了使你的系统支持USB KEY认证方式登录，系统将下载USB KEY的客户端驱动程序，请点击‘是’进行下载安装！"))
			window.open("<%=GlobalNames.WEB_PATH%>/ikey/iKeyClient.cab");
	}
	else
	{
		//如果没有插入IKEY，则提示插入
		document.all.tmp.value =iKeyClient.CheckToken();
		if( iKeyClient.CheckToken()==false )
		{
			document.all.login_type.value ="";
			eval(layerRef+'["pword"]'+styleRef+'visibility="visible"');
			eval(layerRef+'["ikey"]'+styleRef+'visibility="hidden"');
		}
		else
		{
			document.all.login_type.value ="ikey";
			eval(layerRef+'["pword"]'+styleRef+'visibility="hidden"');
			eval(layerRef+'["ikey"]'+styleRef+'visibility="visible"');
		}
	}
</script>
<%
if(GlobalNames.UNION_FORUM && GlobalNames.FORUM_URL !=null)
{//与论坛统一身份登陆
%>
<iframe name="forum" id="forum" scrolling="no" width=0 height=0 src='<%=GlobalNames.FORUM_URL%>/mvnforum/login'/>
<%}%>
</BODY>
</HTML>

