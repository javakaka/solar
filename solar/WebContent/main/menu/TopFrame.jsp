<%@ page contentType="text/html; charset=GBK"%>
<HTML><HEAD><TITLE></TITLE>
<LINK href="res/expand.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="res/css.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=363 background=images/top_di.gif 
    height=49><IMG height=49 src="images/logo_1a.gif" width=363></TD>
    <TD width=214 background=images/top_di.gif>
      <TABLE class=shijian cellSpacing=0 cellPadding=0 width=214 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=13><IMG height=31 
            src="images/shijian_1.gif" width=13></TD>
          <TD vAlign=bottom align=left width=21 
          background=images/shijian_di.gif><IMG height=16 
            src="images/colok.gif" width=17 vspace=7></TD>
          <TD vAlign=bottom width=168 
background=images/shijian_di.gif>&nbsp;
            <SCRIPT language=JavaScript>
   var enabled = 0;
   var today = new Date();
   var date;
   var centry ;
   var year;
   if(today.getDay()==0)     date2 = "" +  '星期'+'日';
   if(today.getDay()==1)     date2 = "" +  '星期'+'一';
   if(today.getDay()==2)     date2 = "" +  '星期'+'二';
   if(today.getDay()==3)     date2 = "" +  '星期'+'三';
   if(today.getDay()==4)     date2 = "" +  '星期'+'四';
   if(today.getDay()==5)     date2 = "" +  '星期'+'五';
   if(today.getDay()==6)     date2 = "" +  '星期'+'六';
   document.fgColor = " 000000";
      centry="";
      if  (today.getYear()<2000 )  year=today.getYear()+1900;  // centry = "1900" ;
           else year=today.getYear()
      date1 = year  + '年' + (today.getMonth() + 1 ) + '月' + today.getDate() + '日'+"  " ;

   document.write( date1+date2);
</SCRIPT>
             </TD>
          <TD vAlign=top align=right width=12><IMG height=31 
            src="images/shijian_2.gif" width=12></TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top align=right background=images/top_di.gif>
      <TABLE cellSpacing=0 cellPadding=0 width="70%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=39><A 
            onmouseover="document.home.src='/TDynastyOA2001/images/home_2.gif';" 
            onmouseout="document.home.src='/TDynastyOA2001/images/home_1.gif';" 
            href="http://show.extract.com.cn/TDynastyOA2001/jsp/MainPage.jsp" 
            target=mainframe><IMG height=44 alt=首页 
            src="images/home_1.gif" width=39 border=0 name=home></A></TD>
          <TD>&nbsp;</TD>
          <TD vAlign=top align=left width=39><A 
            onmouseover="document.huyuan.src='/TDynastyOA2001/images/huyuan_2.gif';" 
            onclick="showOnlineUser();return false;" 
            onmouseout="document.huyuan.src='/TDynastyOA2001/images/huyuan_1.gif';" 
            href="http://show.extract.com.cn/TDynastyOA2001/jsp/TopFrame.jsp#"><IMG 
            height=44 alt=在线用户 src="images/huyuan_1.gif" width=39 
            border=0 name=huyuan></A></TD>
          <TD>&nbsp;</TD>
          <TD vAlign=top align=left width=39><A 
            onmouseover="document.denglu.src='/TDynastyOA2001/images/denglu_2.gif';" 
            onclick="login();return false;" 
            onmouseout="document.denglu.src='/TDynastyOA2001/images/denglu_1.gif';" 
            href="http://show.extract.com.cn/TDynastyOA2001/jsp/TopFrame.jsp#"><IMG 
            height=44 alt=重新登陆 src="images/denglu_1.gif" width=39 
            border=0 name=denglu></A></TD>
          <TD>&nbsp;</TD>
          <TD vAlign=top align=left width=39><A 
            onmouseover="document.tuichu.src='/TDynastyOA2001/images/tuichu_2.gif';" 
            onclick="logout();return false;" 
            onmouseout="document.tuichu.src='/TDynastyOA2001/images/tuichu_1.gif';" 
            href="http://show.extract.com.cn/TDynastyOA2001/jsp/TopFrame.jsp#"><IMG 
            height=44 alt=退出系统 src="images/tuichu_1.gif" width=39 
            border=0 name=tuichu></A></TD>
          <TD>&nbsp;</TD>
          <TD vAlign=top align=left width=39><A 
            onmouseover="document.help.src='/TDynastyOA2001/images/help_2.gif';" 
            onclick="help2();return false;" 
            onmouseout="document.help.src='/TDynastyOA2001/images/help_1.gif';" 
            href="http://show.extract.com.cn/TDynastyOA2001/jsp/TopFrame.jsp#"><IMG 
            height=44 alt=帮助中心 src="images/help_1.gif" width=39 border=0 
            name=help></A></TD>
          <TD>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=363 background=images/danhang_di.gif 
    height=25><IMG height=25 src="images/logo_2a.gif" width=363></TD>
    <TD vAlign=top align=left width=8 
      background=images/danhang_1.gif><IMG height=25 src="" width=8></TD>
    <TD vAlign=bottom align=right background=images/danhang_di.gif>
      <TABLE class=daohang cellSpacing=3 cellPadding=0 width="100%" align=right 
      border=0>
        <TBODY>
        <TR>
          <TD noWrap align=left width=11><IMG height=14 
            src="images/dqyh.gif" width=11></TD>
          <TD vAlign=bottom noWrap width=130 height=18>当前用户:葛工程师</TD>
          <TD noWrap align=left width=13><IMG height=13 
            src="images/ssbm.gif" width=13></TD>
          <TD vAlign=bottom noWrap width=160>隶属部门:开发部</TD>
          <TD>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD 
    style="BACKGROUND-IMAGE: url(/TDynastyOA2001/images/danhang_yy.gif); BACKGROUND-REPEAT: repeat-x" 
    vAlign=top align=left colSpan=3 height=5></TD></TR></TBODY></TABLE><IFRAME 
id=newselect name=newselect src="images/infocenter.do" width=0 
height=0>
</IFRAME>
<SCRIPT language=javascript>
<!--
//download certificate
function init(){

  //open important info
  newselect.location.replace("/TDynastyOA2001/infocenter.do?action=openpopup");
}
function login(){
  newselect.location.replace("/TDynastyOA2001/globalinfoaction.do?action=logout");
  this.parent.location.replace("Index.jsp");
}
function logout(){
  newselect.location.replace("/TDynastyOA2001/globalinfoaction.do?action=logout");
  this.parent.window.close();
}
function help2(){
  var url = "/TDynastyOA2001/jsp/help/MainPage.jsp";
  //openResizableMiniWin(url,'help',700,500);
}
function showOnlineUser(){
  var url = "/TDynastyOA2001/globalinfoaction.do?action=onlineuser";
  openResizableMiniWin(url,'onlineusers',350,350);
}
//-->
</SCRIPT>
</BODY></HTML>
