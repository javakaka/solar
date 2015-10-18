<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%@ page import="java.util.*"%>
<HTML lang=zh>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><!-- Styles -->
<LINK href="res/expand.css" type=text/css rel=stylesheet>
<LINK href="res/outlookbar.css" type=text/css rel=stylesheet>
<STYLE>A {
	FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; TEXT-DECORATION: underline
}
A:hover {
	COLOR: #000000; TEXT-DECORATION: none
}
SPAN {
	VERTICAL-ALIGN: middle
}
</STYLE>
<%!
/*** 得到指定Pid下的菜单,不包括子菜单*/
DataSet getSubTree(String sPid, DataSet alPara)  {
	DataSet alTree =null;
	try 
	{
		if(alPara !=null)
		{
			for(int i=0; i<alPara.size(); i++)
			{
				HashMap tmp =(HashMap)alPara.get(i);
				if(tmp !=null && tmp.get("UP_FUN_ID") !=null && tmp.get("UP_FUN_ID").toString().equals(sPid))
				{
					if(alTree ==null)	alTree =new DataSet();
					alTree.add(tmp);
				}
			}
		}
		return alTree;
	}
	catch(Exception ex) {
		ex.printStackTrace();
		return null;
	}
}
%>
</HEAD>
<BODY text=#000000 leftMargin=0 topMargin=0 cellspacing="0" cellpadding="0" 
marginheight="0" marginwidth="0">
<TABLE height=10 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY></TBODY></TABLE>
<TABLE height=10 cellSpacing=0 cellPadding=0 width=154 border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=154 height=10><IMG height=10 
      src="images/jietu03.gif" width=153></TD></TR></TBODY></TABLE>
<TABLE height=22 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD style="FONT-SIZE: 8pt" align=middle width=65 
    background=images/candan_top1.gif>功能模块</TD>
    <TD align=left width=4><IMG height=21 src="images/candan_top2.gif" 
      width=4></TD>
    <TD align=middle width=65 background=images/candan_top3.gif>&nbsp;</TD></TR></TBODY></TABLE>
<TABLE class=bar 
style="FONT-SIZE: 8pt; WIDTH: 100%; HEIGHT: 100%; align: center" height="100%" 
cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TD style="BORDER-RIGHT: #c5cbd7 0px solid" vAlign=top width="100%" 
    colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD align=middle>
            <SCRIPT src="res/outlookbar.js"></SCRIPT>
          </TD></TR>
        <TR>
          <TD>
            <DIV class=favMenu id=aMenu>
				<%
					String sUpFunId =request.getParameter("fun_id")==null?"32":request.getParameter("fun_id");
					Identity oUser =(Identity)session.getAttribute("user");
					if(oUser ==null)
						return ;  

					DataSet alMenu = (DataSet)oUser.get("staff-fun");
					DataSet alTopTree =getSubTree(sUpFunId, alMenu);
					StringBuffer sbMenu =new StringBuffer();
					if(alTopTree !=null)
					{
						for(int i=0; i<alTopTree.size(); i++)
						{
							HashMap hmTmp =(HashMap)alTopTree.get(i);
							String sFunId =hmTmp.get("FUN_ID").toString();
							sbMenu.append("<DIV class=topFolder id=s"+sFunId+"  onclick=\"changeImg("+(i+1)+");return false;\"><IMG id=folderimg hspace=10 src=\"images/new_shrink.gif\" align=center vspace=3 valign=\"middle\"> <SPAN style=\"FONT-SIZE: 9pt\" align=\"center\" valign=\"top\">"+hmTmp.get("FUN_NAME")+"</SPAN></DIV>\n");
							DataSet alTmp =getSubTree(hmTmp.get("FUN_ID").toString(), alMenu);
							if(alTmp !=null)
							{
								sbMenu.append("<DIV class=sub id=s"+sFunId+"Sub>\n");
								for(int j=0; j<alTmp.size(); j++)
								{
									hmTmp =(HashMap)alTmp.get(j);
									sbMenu.append("<DIV class=subItem title=\"\"");
									String sWinMode =hmTmp.get("WIN_MODE")==null?"1":hmTmp.get("WIN_MODE").toString();
									String sWinTarget =hmTmp.get("WIN_TARGET")==null?"":hmTmp.get("WIN_TARGET").toString();
									if(sWinTarget.length() !=0)
									{
										if(sWinTarget.indexOf("////") ==-1)
											sWinTarget =GlobalUtil._WEB_PATH+sWinTarget;
										else
											sWinTarget =sWinTarget.substring(4);
									}

									if(sWinMode.equals("0"))//当前窗口打开
										sbMenu.append("href=javascript:parent.location=\""+sWinTarget+"\">");
									else if(sWinMode.equals("2"))//新开窗口
										sbMenu.append("href=javascript:openW(\""+sWinTarget+"\")>");
									else//当前窗口指定帧
										sbMenu.append("href=javascript:openF(\""+sWinTarget+"\")>");
								
									//sbMenu.append("href=\"/TDynastyOA2001/jsp/emailman/folderman/mainpage.jsp\">");
									sbMenu.append("<IMG src=\"");
									if(j%2 ==0)
										sbMenu.append("images/newdian.gif");
									else
										sbMenu.append("images/newdian_2.gif");
									sbMenu.append("\">&nbsp;&nbsp;<SPAN style=\"FONT-SIZE: 9pt\">"+hmTmp.get("FUN_NAME")+"</SPAN> 						</DIV>");
								}
								sbMenu.append("\n</DIV>");
							}
						}
					}
					%>
					<%=sbMenu.toString()%>
				<!-- for outer-->
            <DIV class=scrollButton id=aMenuUp>5</DIV><!-- These are the two -->
            <DIV class=scrollButton 
          id=aMenuDown>6</DIV><!-- scroll buttons --></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

<SCRIPT language=JavaScript>

<!--

var img_shrink = "images/new_shrink.gif";

var img_expand = "images/new_expand.gif";


function changeImg(index){
	
	var img = null;
	
	if(document.all['folderimg'][0] == null){
		
		img = document.all['folderimg'];
	
	}else{
		img = document.all['folderimg'][index-1];

	}

	if(img.src.indexOf(img_expand) >= 0){

		if(document.all['folderimg'][0] != null){
	
			for(i=0;i<document.all['folderimg'].length;i++){

				document.all['folderimg'][i].src = img_shrink;
	
	  	}

		}else{
	
	  	  img.src = img_shrink;
	
	}

	}else{
	
	if(document.all['folderimg'][0] != null){

			for(i=0;i<document.all['folderimg'].length;i++){
	
			if(i == index-1){
	
	  			document.all['folderimg'][i].src = img_expand;
	

			}else{

					document.all['folderimg'][i].src = img_shrink;
	
			}

			}

		}else{

		   img.src = img_expand;

		}

	}

}
function openF(url)
{
	if(url =="")
		url ="<%=GlobalUtil._WEB_PATH%>/include/Build.jsp";
	parent.parent.mainframe.location=url;
}

function openW(url){
	window.open(url);
}


-->

</SCRIPT>
</BODY></HTML>
