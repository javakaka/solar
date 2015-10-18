<script>
	
var widthSet = 138;
function showBar()
{
		parent.parent.layerTwo.cols=(widthSet+15)+",*";
	 
		hidebutton.style.display="block";
	  
		showbutton.style.display="none";
  
	
}
	
function hideBar()
{
		nowWidth = 138;
		if(nowWidth>0){
		
			widthSet = nowWidth;
	  
			parent.parent.layerTwo.cols="15,*";
	  
			hidebutton.style.display="none";
	  
			showbutton.style.display="block";
	
		}
	
}

</script>
<BODY 
style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
  <TR>
    <TD style="VERTICAL-ALIGN: top"><IMG src="images/jietu01.gif" 
      border=0></TD></TR>
  <TR>
    <TD 
    style="BACKGROUND-IMAGE: url(images/candan_right.gif); VERTICAL-ALIGN: middle; TEXT-ALIGN: left" 
    height="100%">
      <DIV id=hidebutton style="DISPLAY: none"><A onclick=hideBar(); 
      ><IMG 
      src="images/open.gif" border=0></A></DIV>
      <DIV id=showbutton ><A onclick=showBar(); 
      ><IMG 
      src="images/open2.gif" border=0></A></DIV></TD></TR>
  <TR>
    <TD style="VERTICAL-ALIGN: top"><IMG src="images/jietu02.gif" 
      border=0></TD></TR></TBODY></TABLE>
<SCRIPT language=javascript>
	<%if(request.getParameter("fun_id") ==null){%>
hideBar();<%} else{%>showBar();<%}%>

</SCRIPT>
</BODY></HTML>
