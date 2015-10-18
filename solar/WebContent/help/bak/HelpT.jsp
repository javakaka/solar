<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head2.jsp"%>
<HTML><HEAD><TITLE>Untitled Document</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<SCRIPT language=JavaScript type=text/JavaScript>
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</SCRIPT>

<META content="MSHTML 6.00.2800.1515" name=GENERATOR></HEAD>
<BODY leftMargin=0 background=images/helpbg.gif topMargin=0 
onload="top.focus();MM_preloadImages('images/help03a.gif','images/help03.gif','images/help02a.gif','images/help02.gif','images/help01a.gif','images/help01.gif','images/help04a.gif','images/help04.gif','images/help05a.gif','images/help05.gif')">
<TABLE cellSpacing=0 cellPadding=0 border=0>
  <TBODY>
  <TR>
    <TD width=16>&nbsp;</TD>
    <TD width=50><A 
      onmouseover="MM_nbGroup('over','help03a','images/help03.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help03a','images/help03a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="javascript:window.history.back(-1);" 
      target=_top><IMG height=40 src="images/help03a.gif" width=55 
      border=0 name=help03a></A></TD>
    <TD width=55><A 
      onmouseover="MM_nbGroup('over','help02a','images/help02.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help02a','images/help02a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="javascript:window.history.go(1);" 
      target=_top><IMG height=40 src="images/help02a.gif" width=55 
      border=0 name=help02a></A></TD>
    <TD width=55><A 
      onmouseover="MM_nbGroup('over','help04a','images/help04.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help04a','images/help04a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="javascript:top.mainFrame.print();" 
      target=_top><IMG height=39 src="images/help04a.gif" width=55 
      border=0 name=help04a></A></TD>
    <TD width=55><A 
      onmouseover="MM_nbGroup('over','help05a','images/help05.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help05a','images/help05a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="<%=GlobalUtil._WEB_PATH%>" 
      target=_blank><IMG height=39 src="images/help05a.gif" width=55 
      border=0 name=help05a></A></TD>
    <TD width=55><A 
      onmouseover="MM_nbGroup('over','help06a','images/help06.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help06a','images/help06a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="javascript:$E.message('暂没实现！');" 
      target=_top><IMG height=40 src="images/help06a.gif" width=55 
      border=0 name=help06a></A></TD>
    <TD width=55><A 
      onmouseover="MM_nbGroup('over','help01a','images/help01.gif','',1)" 
      onclick="MM_nbGroup('down','group1','help01a','images/help01a.gif',1)" 
      onmouseout="MM_nbGroup('out')" href="javascript:window.close();" 
      target=_top><IMG height=40 src="images/help01a.gif" width=55 
      border=0 name=help01a></A></TD>
    <TD width=55>&nbsp;</TD></TR></TBODY></TABLE></BODY></HTML>
