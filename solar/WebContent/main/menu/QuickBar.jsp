<%@ page contentType="text/html; charset=GBK"%>
<head> 
<title></title>
<!-- Styles -->
<link REL="stylesheet" TYPE="text/css" HREF="expand.css">
<script language="javascript">
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
</script>
<script language="JavaScript">
<!--
var img_expand = "images/jy_top.gif";
var img_shrink = "images/jy_bootn.gif";
var this_height = 185;
var allShrinked = true;

function setExpand(src,expand)
{
  if(expand){
    if(src.imgexpand.src.indexOf(img_expand) != -1)
    	src.imgexpand.src = img_shrink;
    src.expanded = true;

    if(allShrinked) this.parent.layer.rows = "*,"+this_height+",39";
    allShrinked = false;
}else{
    if(src.imgexpand.src.indexOf(img_shrink) != -1)
    	src.imgexpand.src = img_expand;
    src.expanded = false;
  }
}
function setImg(src,expand)
{
  if(expand){
    src.imgexpand.src = img_shrink;
  }else{
    src.imgexpand.src = img_expand;
  }
}
function shrinkAll(){
  setExpand(tasklist,false);
  setExpand(maillist,false);
  setExpand(msglist,false);


  this_height = window.parent.layer.children[1].height;
  this.allShrinked = true;
  this.parent.layer.rows="*,66,39";
  main.rows="22,22,22";
}
-->
</script>
</head>
<frameset id="main" name="main" border=0 frameBorder=0 frameSpacing=0 rows=*,22,22 >
  <frame id="tasklist" name="vote" scrolling="no" src="Vote.jsp" noresize >
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
  <p>
  Your web browser can not support FRAMES, please update you web browser!<br>
  You can contact SysManager!
  </p>
</body>
</noframes>

</html>