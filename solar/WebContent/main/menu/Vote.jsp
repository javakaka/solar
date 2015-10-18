<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HTML lang=zh><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><!-- Styles --><LINK 
href="res/expand.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript>
<!-- disable the right click-->
//document.oncontextmenu = function(){return false}
//if(document.layers) 
//{
//    window.captureEvents(Event.MOUSEDOWN);
//    window.onmousedown = function(e)
//    { if(e.target==document)return false; }
//}
//else 
//{
//    document.onmousedown = function(){return false}
//}
</SCRIPT>

<SCRIPT language=Javascript src="images/expand.js"></SCRIPT>

<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY 
style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px" 
text=#000000 onload=refresh();>
<TABLE class=bar 
style="BORDER-RIGHT: #bbbbbb 0px solid; FONT-SIZE: 8pt; align: center" 
cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR 
  style="BORDER-RIGHT: medium none; BACKGROUND: url(images/candan_2di.gif); BORDER-LEFT: medium none" 
  height=25>
    <TD class=quickbartitle noWrap width="100%">待办工作 </TD>
    <TD class=quickbartitle2><A onclick="refresh();return false;" 
      href="http://show.extract.com.cn/TDynastyOA2001/jsp/workflow/TaskBar.jsp#"><IMG 
      alt=刷新 src="images/sxa.gif"> </A></TD>
    <TD class=quickbartitle2 width=10><IMG src="images/stretch.gif"> 
</TD>
    <TD class=quickbartitle2><A onclick="expand();return false;"><IMG 
      id=imgexpand src="images/jy_top.gif"> </A></TD>
    <TD class=quickbartitle2 width=10><IMG src="images/stretch.gif"> 
  </TD></TR>
  <TR>
    <TD vAlign=top background=images/candan_di.gif colSpan=3>
      <DIV id=taskdiv></DIV></TD></TR></TBODY></TABLE>
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
</style><table>

	<TR><TD colspan=2  valign=top>
	<TABLE dir=ltr cellSpacing=0 cellPadding=0 width=100% border=0>
		<TBODY>
		<TR>
		<TD align=left height=20 class=containerFooter></TD></TR>
		<TR>
			<TD class="containerHeader" height=30 align=center valign=middle>投票</TD>
		</TR>
		<TR>
		<TD align=left height=2 class=containerFooter></TD></TR>
		</TBODY>
	</TABLE>
	<DIV>
		<DIV>
		<table width=100%>
<%
String sCurTime=FormatUtil.dateToStr(new Date(),"yyyy-MM-dd");
%>
<zz:Run service="VoteList3" dynamic="true">
	<zz:Arg name="curdate" value='<%=sCurTime%>'/>
</zz:Run>
<zz:Error dtype="1"/>
<%
String vote_id="";
HashMap hmOneUnit=null;
if(ServletUtil.getResult(request,"VOTELIST") !=null)
{
	DataSet alVoteList =(DataSet)ServletUtil.getResult(request,"VOTELIST");
	for(int i=0;i<alVoteList.size();i++)
	{
		hmOneUnit=(HashMap)alVoteList.get(i);
		vote_id=(String)hmOneUnit.get("VOTE_ID");
	%>
	<tr><td>
	<table width="164" border="0" cellspacing="0" cellpadding="0" align="left">
	<zz:Run service="VoteDetail" dynamic="true">
		<zz:Arg name="vote_id" value='<%=vote_id%>'/>
	</zz:Run>
	<zz:Error dtype="1"/>
	<zz:Run service="VoteSubject" dynamic="true" >
		<zz:Arg name="vote_id" value='<%=vote_id%>'/>
	</zz:Run>
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td><zz:Result var="vote" name="VoteDetail">
				<zz:Field item="vote.CONTENT"/>
			</zz:Result></td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td style="padding-left:10px;padding-right:10px">
				<zz:Result var="subject" name="VoteSubject">
				<input type=radio id='answerid<zz:Field item="subject.SUBJECT_ID"/>' name='answer<%=vote_id%>' style="border:none none none" value='<zz:Field item="subject.SUBJECT_ID"/>'><label for='answerid<zz:Field item="subject.SUBJECT_ID"/>' style="cursor:hand"><zz:Field item="subject.CONTENT" brsize="50"/></label></input><br>
				</zz:Result>
			</td>
		</tr>
		<tr>
			<td align="center" height="40" valign="middle"><img src='<%=GlobalUtil._WEB_PATH%>/staff/disk/images/vote_vote.gif' border="0"  onClick="vote(<%=vote_id%>)" style="cursor:hand">&nbsp;<img src='<%=GlobalUtil._WEB_PATH%>/staff/disk/images/vote_view.gif' border="0" onClick='viewvote(<%=vote_id%>)' style="cursor:hand"></td>
		</tr>
		<tr>
			<td height="1" align="right" background='<%=GlobalUtil._WEB_PATH%>/website/1000/images/bg_hlineblack.gif'></td>
		</tr>
	</table>
	</td></tr>
	<tr><td height="2" bgcolor="#e9e9e6"></td><tr>
	<%
		}
	%>
	</table>
<script>
function vote(id)
{
  var vote_id =id;
  var url ="";
  var checkboxes = document.getElementsByName("answer"+id);
  var i=0;
  var subject_id =-1;
  for (; i < checkboxes.length; i++) 
  {
	 if (checkboxes[i].checked)
	 {
		subject_id =checkboxes[i].value;
		break;
	 }
  }
  if(i ==checkboxes.length)
  {
	 alert("请选择一项进行投票！");
	 return;
  }
  url="<%=GlobalUtil._WEB_PATH%>/chart/PieChart.jsp?vote_id="+vote_id+"&subject_id="+subject_id;
  runOpen(url, true, 600,450);
}

function viewvote(id)
{
  var vote_id =id;
  var url ="";
  url ="<%=GlobalUtil._WEB_PATH%>/chart/PieChart.jsp?vote_id="+vote_id;
  runOpen(url, true, 600,450);
}
</script>
<%}%>
</DIV>
	</DIV>
	</TD></TR>
</table>
<SCRIPT language=JavaScript>
<!--
function refresh(){
/*
  var url = "/TDynastyOA2001/humaninterface.do?action=refreshtaskbardiv";
  newselect.location.replace(url);
  
  var delaytime = 120;
  if(delaytime > 60)
    setTimeout("refresh()",delaytime*1000);
	*/
}

var expanded = false;
function expand()
{
  if(!expanded){
	this.parent.setExpand(window,true);
    this.parent.setExpand(this.parent.tasklist,false);
    this.parent.setExpand(this.parent.maillist,false);
    this.parent.main.rows="22,22,*";
  }
  else this.parent.shrinkAll();
}
-->
</SCRIPT>
</BODY></HTML>
