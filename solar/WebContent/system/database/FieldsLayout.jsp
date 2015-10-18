<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%
String sColor =ServletUtil._DEFAULT_TABLE_STYLE;
if(ServletUtil.get(request,"op").equals("1"))
{
   Row hmData =null;
   Enumeration en =request.getParameterNames();
   while(en.hasMoreElements()){
      if(hmData ==null) hmData =new Row();
      Object oPara =en.nextElement();
      hmData.put(oPara, request.getParameter(oPara.toString()));
   }
   if(hmData !=null)
   {
%>
	<$:A service="saveTableView" dynamic="false" condition="<%=hmData%>"/>
	<$:M dtype="1"/>
<%
   }
}
%>
<LINK href="js/def.css" rel=stylesheet>

<script language=JavaScript>

self.onError=null;
currentX = currentY = 0; 
relativeX = relativeY = 0;
whichIt = null;           
lastScrollX = 0; lastScrollY = 0;
NS = (document.layers) ? 1 : 0;
IE = (document.all) ? 1: 0;

function vok()
{
	if(event.keyCode==13)
	{
		oSave.click();
	}
	if(event.keyCode==27)
	{
		oCancel.click();
	}
}
	<!-- STALKER CODE -->
function heartBeat() 
{	if(IE) { diffY = this.document.body.scrollTop; diffX = this.document.body.scrollLeft; }
	if(NS) { diffY = self.pageYOffset; diffX = self.pageXOffset; }
	if(diffY != lastScrollY)
	{	percent = .1 * (diffY - lastScrollY);
	    if(percent > 0) percent = Math.ceil(percent);
	    	else percent = Math.floor(percent);
		
		if(NS) document.floater.top += percent; 
	    lastScrollY = lastScrollY + percent;
	}
	if(diffX != lastScrollX) 
	{	percent = .1 * (diffX - lastScrollX);
		if(percent > 0) percent = Math.ceil(percent);
		else percent = Math.floor(percent);
//		if(IE) document.floater.style.pixelLeft += percent;
//		if(NS) document.floater.left += percent;
		lastScrollX = lastScrollX + percent;
	}
}
	<!-- /STALKER CODE -->
	<!-- DRAG DROP CODE -->
function checkFocus(x,y) 
{	stalkerx = document.floater.pageX;
	stalkery = document.floater.pageY;
	stalkerwidth = document.floater.clip.width;
	stalkerheight = document.floater.clip.height;
	if( (x > stalkerx && x < (stalkerx+stalkerwidth)) && (y > stalkery && y < (stalkery+stalkerheight))) return true;
	       else return false;
}

function grabIt(e) 
{	if(IE) 
	{	whichIt = event.srcElement;
		while (whichIt.id.indexOf("floater") == -1) 
		{	whichIt = whichIt.parentElement;
			if (whichIt == null) { return true; }
		}
		whichIt.style.pixelLeft = whichIt.offsetLeft;
		whichIt.style.pixelTop = whichIt.offsetTop;
		relativeX = event.offsetX;
		relativeY = event.offsetY;
	} 
	else
	{	window.captureEvents(Event.MOUSEMOVE);
	    if(checkFocus (e.pageX,e.pageY)) 
	    {	whichIt = document.floater;
	        StalkerTouchedX = e.pageX-document.floater.pageX;
	        StalkerTouchedY = e.pageY-document.floater.pageY;
	    } 
	}
	return true;
}

function moveIt(e) 
{	if (whichIt == null) { return false; }
	if(IE)
	{	
		currentX=event.x+document.body.scrollLeft;
		currentY=event.y+document.body.scrollTop;

		if((currentX-relativeX-4)<0){
			whichIt.style.pixelLeft=0;
		}else{
			if((currentX-relativeX-4)>(document.all["ground"].offsetWidth-whichIt.style.pixelWidth))
				whichIt.style.pixelLeft = document.all["ground"].offsetWidth-whichIt.style.pixelWidth;
			else whichIt.style.pixelLeft = currentX-relativeX-4;
		}

		if((currentY-relativeY-6)<50){
			whichIt.style.pixelTop=50;
		}else{
			if((currentY-relativeY-4)>(document.all["ground"].offsetHeight-whichIt.style.pixelHeight))
				whichIt.style.pixelTop = document.all["ground"].offsetHeight-whichIt.style.pixelHeight;
			else whichIt.style.pixelTop = currentY-relativeY-4;
		}
		event.returnValue = false;
	}
	else 
	{	whichIt.moveTo(e.pageX-StalkerTouchedX,e.pageY-StalkerTouchedY);
	    if(whichIt.left < 0+self.pageXOffset) whichIt.left = 0+self.pageXOffset;
	    if(whichIt.top < 0+self.pageYOffset) whichIt.top = 0+self.pageYOffset;
	    if( (whichIt.left + whichIt.clip.width) >= (window.innerWidth+self.pageXOffset-17)) whichIt.left = ((window.innerWidth+self.pageXOffset)-whichIt.clip.width)-17;
	    if( (whichIt.top + whichIt.clip.height) >= (window.innerHeight+self.pageYOffset-17)) whichIt.top = ((window.innerHeight+self.pageYOffset)-whichIt.clip.height)-17;
	    return false;
	}
	
  	return false;
}

function chkpoint(e)
{	if (IE)
	{	e.style.pixelLeft=Math.floor(e.style.pixelLeft /10 )*10;
		e.style.pixelTop=Math.floor(e.style.pixelTop /10)*10;
		
	}
};

function dropIt(e) 
{
	whichIt = null;
	
	if(NS) window.releaseEvents (Event.MOUSEMOVE);
	return true;
}

<!-- DRAG DROP CODE -->
if(NS) 
{	window.captureEvents(Event.MOUSEUP|Event.MOUSEDOWN);
	window.onmousedown = grabIt;
 	window.onmousemove = moveIt;
	window.onmouseup = dropIt;
}

if(IE)
{	document.onmousedown = grabIt;
 	document.onmousemove = moveIt;
	document.onmouseup = dropIt;
}
if(NS || IE) action = window.setInterval("heartBeat()",1);

function setfield(card,id,field,left,top,width,height){
	window.open('setfield.php3?card='+card+'&fieldid='+id+'&field='+field+'&left='+left+'&top='+top+'&width='+width+'&height='+height,'winSetting','menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=1,resizable=1,width=200,height=400')
}

function showstatus(card,id,field,left,top,width,height){
	document.layout.field.value=field
	document.layout.width.value=width
	document.layout.height.value=height
	document.layout.left.value=left
	document.layout.top.value=top
	document.layout.fieldid.value=id
}
function changePosition(){
	var id;
	var num;
	id=document.all.change_id.value;
	num=document.all.change_num.value;
	eval("document.all."+id+".style.pixelLeft=document.all.change_x.value");
	eval("document.all."+id+".style.pixelTop=document.all.change_y.value");
	eval("document.all."+id+".style.pixelWidth=document.all.change_w.value");
	eval("document.all."+id+".style.pixelHeight=document.all.change_h.value");
	eval("document.all.X"+num+".value=document.all.change_x.value");
	eval("document.all.Y"+num+".value=document.all.change_y.value");
	eval("document.all.W"+num+".value=document.all.change_w.value");
	eval("document.all.H"+num+".value=document.all.change_h.value");
	if(document.all.change_w.value>600){ 
		eval("document.all.W"+num+".value=600");
		eval("document.all.floater"+num+".style.pixelWidth=600");
	}
	document.all.change.style.visibility="hidden";
}
function showDiv(id,num){
	var leftMax=document.all["ground"].style.pixelWidth-document.all["change"].style.pixelWidth;
	var topMax=document.all["ground"].style.pixelHeight-document.all["change"].style.pixelHeight;
	var pointx=event.x+document.body.scrollLeft;
	var pointy=event.y+document.body.scrollTop;

	if(pointy>topMax) pointy=pointy-document.all["change"].style.pixelHeight;
	if(pointx>leftMax) pointx=pointx-document.all["change"].style.pixelWidth;

	document.all.change_id.value=id;
	document.all.change_num.value=num;
	document.all["change"].style.pixelTop=pointy;
	document.all["change"].style.pixelLeft=pointx;
	eval("document.all.change_x.value=document.all."+id+".style.pixelLeft");
	eval("document.all.change_y.value=document.all."+id+".style.pixelTop");
	eval("document.all.change_w.value=document.all."+id+".style.pixelWidth");
	eval("document.all.change_h.value=document.all."+id+".style.pixelHeight");
	document.all.change.style.visibility="visible";
	oWidth.focus();
	oWidth.select();
}
function closeDiv(){
	document.all.change.style.visibility="hidden";
}
function change_pos(){
	document.all["info"].style.pixelTop=document.body.scrollTop;
}
</script>

</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 width=800 height=1000 onscroll="change_pos();">
<div id="ground"  style="position: absolute; left=0px;top=0px;width=800px;height=2000px;visibility: visible; z-index:0"><table background="<%=GlobalUtil._WEB_PATH%>/images/sg.gif" width=100% height=100%><tr><td></td></tr></table></div>

<form method="POST" name='layout'>
<div id=info style="position:absolute; left:0; top:0; z-index:1000">
<table border=0 bgcolor="<%=sColor%>" width=800><tr><td>
<input type="submit" value="恢复原始布局" name="btreset" onClick="this.form.empty.value=1;">
字段名称&nbsp;<input type="text" name="field" size="20" value="" readonly>
宽度&nbsp;<input type="text" name="width" size="5" value="" readonly>px 
高度&nbsp;<input type="text" name="height" size="5" value="" readonly>px 
左距&nbsp;<input type="text" name="left" size="5" value="" readonly>px 
顶距&nbsp;<input type="text" name="top" size="5" value="" readonly>px 
<input type="submit" value=<$:I item="html.button.save"/> name="submit">
<hr>
</td></tr></table>
</div>
<input type=hidden name="op" value="1">
<input type=hidden name="card" size="7" value="83"><input type=hidden name="fieldid" size="7" value=""> 
	<$:A service="getTableLayOut" dynamic="false">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="layout" name="layout" fieldNum="5">
      <div id='floater<$:C item="layout.ROWID"/>'  onMouseOver="showstatus('<%=ServletUtil.get(request,"table_ename")%>','1049','<$:C item="layout.FIELD_CNAME"/>','<$:C item="layout.X"/>','<$:C item="layout.Y"/>','<$:C item="layout.W"/>','<$:C item="layout.H"/>')" ondblclick=showDiv('floater<$:C item="layout.ROWID"/>','<$:C item="layout.ROWID"/>')  style="position: absolute; left=<$:C item="layout.X"/>px;top=<$:C item="layout.Y"/>px;width=<$:C item="layout.W"/>px;height=<$:C item="layout.H"/>px;visibility: visible; z-index:1;" onmouseup="chkpoint(this);document.forms[0].X<$:C item="layout.ROWID"/>.value=floater<$:C item="layout.ROWID"/>.style.pixelLeft;document.forms[0].Y<$:C item="layout.ROWID"/>.value=floater<$:C item="layout.ROWID"/>.style.pixelTop;"> 
      <%

      if(session.getAttribute("user") !=null)
         {
            Identity oUser =(Identity)pageContext.getSession().getAttribute("user");
            if(oUser.get("table-style") !=null 
                  && !oUser.get("table-style").toString().equals(""))
               sColor =oUser.get("table-style").toString();
         }

      %>    
       <table border="1" width="100%" bgcolor="<%=sColor%>" height="100%" cellspacing="0" cellpadding="0">  
        <tr>  
          <td width="100%" style="font-size:9pt"><input type=hidden name='T<$:C item="layout.ROWID"/>' value='<$:C item="layout.FIELD_ENAME"/>' ><input type=hidden name='W<$:C item="layout.ROWID"/>' value='<$:C item="layout.W"/>'><input type=hidden name='H<$:C item="layout.ROWID"/>' value='<$:C item="layout.H"/>'>     
       <input type=hidden name='X<$:C item="layout.ROWID"/>' size="7" value='<$:C item="layout.X"/>' >  
       <input type=hidden name='Y<$:C item="layout.ROWID"/>' size="7" value='<$:C item="layout.Y"/>'>  
         <B><$:C item="layout.FIELD_CNAME"/></B>[<I><$:C item="layout.FIELD_STYLE"/></I>]
       </td>   
        </tr>   
       </table>   
      </div>   
	</$:T>  
   <input type="hidden" name="empty" value="0"> 
</form>
<input type=hidden name=change_id value=""><input type=hidden name=change_num value="">
<div id="change" style="position: absolute; left:0px; top:0px; width:130px; height:0px; visibility: hidden; border-left:1px #FFFFFF solid; border-top:1px #FFFFFF solid; border-right:1px #666666 solid; border-bottom:1px #666666 solid; background-color: #<%=sColor%>; z-index:200" align=center onkeyup="vok()">
<table border=0 cellpadding=0 cellspacing=6 width=100%>
	<tr><td align=center style="color:#000000">
		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; line-height: 150%" bordercolor="#111111" width="100%" id="AutoNumber1">
          <tr>
            <td width="100%" align="center">宽度&nbsp;<input type=text name=change_w id=oWidth value="" class=button1 size="20"></td>
          </tr>
          <tr>
            <td width="100%" align="center">
            <input type=button value="  1/1  " onclick="oWidth.value=600" class=bt style="font-family: Arial">
            <input type=button value="  1/2  " onclick="oWidth.value=300" class=bt style="font-family: Arial">
            <input type=button value="  1/3  " onclick="oWidth.value=200" class=bt style="font-family: Arial">
            <input type=button value="  1/4  " onclick="oWidth.value=150" class=bt style="font-family: Arial">
            <input type=button value="  1/5  " onclick="oWidth.value=120" class=bt style="font-family: Arial">
            <input type=button value="  1/6  " onclick="oWidth.value=100" class=bt style="font-family: Arial"></td>
          </tr>
          <tr>
            <td width="100%" align="center"><hr ></td>
          </tr>
          <tr>
            <td width="100%" align="center" valign=top>高度&nbsp;
               <Select name='change_h'>
                  <option value=50>50</option>
                  <option value=100>100</option>
                  <option value=150>150</option>
                  <option value=200>200</option>
                  <option value=250>250</option>
                  <option value=300>300</option>
                  <option value=350>350</option>
               </Select>
            </td>
          </tr>
          <tr style="display:none">
            <td width="100%" align="center"><font color="#FFFFFF">&nbsp;<input style='display:none' type=text name=change_x value="" class=button1 size="20"> 
            &nbsp;<input style='display:none' type=text name=change_y value="" class=button1 size="20"></font></td>
          </tr>
			<tr>
				<td width="100%" align="center" height='2'></td>
			</tr>
          <tr>
            <td width="100%" align="center">
		<input id=oSave type=button name=B1  value=<$:I item="html.button.save"/> onclick="changePosition();"><input id=oCancel type=button name=B2 value=<$:I item="html.button.close"/> onclick="closeDiv();">
            </td>
          </tr>
        </table>
	</td></tr>
</table>
</div>
</body>
</html>

