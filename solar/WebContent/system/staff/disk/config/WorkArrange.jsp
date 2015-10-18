<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body style="BACKGROUND: url(<%=GlobalUtil._WEB_PATH%>/images/email.gif) fixed no-repeat" onLoad="onInitArrange()">
<table cellSpacing=0 cellPadding=0 border=0 width=100%>
	<tr>
		<td align=right nowrap width=180 valign=top>
			<jsp:include page="/oa/worktime/Lunar.jsp" flush="false"/> 
		</td>
		<td bgcolor='#9999CC' width=2>
		</td>
		<td valign=top>
		<input type=button value="新安排" onClick="onWorkArrange()">
		<!--日程安排-->
		<table width=100% height=100% id="tabArrange">
			<tr><td height=10></td></tr>
		</table>
		</td>
	</tr>
</table>
</body>
<script>
function onInitArrange()
{
	<%
	java.util.Date dNow =new java.util.Date();
	String sYear =DateUtil.toString(dNow, "yyyy");
	String sMonth =DateUtil.toString(dNow, "M");
	String sDay =DateUtil.toString(dNow, "d");
	%>
	var sYear ="<%=sYear%>"
	var sMonth ="<%=sMonth%>"
	var sDay ="<%=sDay%>"
	getDayArrange(sYear, sMonth, sDay);
}
function onDay(year, month, day)
{
	getDayArrange(year, month, day);
}

function getDayArrange(year, month, day)
{
	if(month <10)
		month ="0"+month;
	if(day <10)
		day ="0"+day;
	var s =new Server("getStaffArrange");
	s.setParamValue("default", "year", year);
	s.setParamValue("default", "month", month);
	s.setParamValue("default", "day", day);
	s.setParamValue("default", "view_type", "1");
	Table.clear(tabArrange);
	if(s.send(s, true))
	{
		var oData =s.getDataSet("ARRANGES");
		if(oData !=null)
		{
			var o$D =new $D(oData);
			var rows =o$D.getRows();
			for(i =1; i<=rows; i++)
			{
				oTr =tabArrange.insertRow();
				oTr.className ="tr_c";
				oTd =oTr.insertCell();
				oTd.innerHTML ="<li><a id='href_"+o$D.getFieldValue(i, "ARRANGE_ID")+"' href=javascript:onViewArrange('"+o$D.getFieldValue(i, "ARRANGE_ID")+"')>"+o$D.getFieldValue(i, "SUBJECT")+"("+o$D.getFieldValue(i, "START_HOUR")+":"+o$D.getFieldValue(i, "START_MINUTE")+"分 开始)</a>";
			}
		}
		else
		{
			oTr =tabArrange.insertRow();
			oTd =oTr.insertCell();
			oTd.innerHTML ="今天没有日程安排"; 
		}
	}
}

//查看日程安排
function onViewArrange(sArrangeId)
{
	$E.runOpen(WEB_PATH+"/common/PageView.jsp?url=/oa/arrange/EditArrange.jsp&arrange_id="+sArrangeId, true, 650, 500);	
	//var sUrl =_WEBPATH+"/common/page_view.jsp?url=/oa/arrange/edit_arrange.jsp&arrange_id="+sArrangeId;
	//var sId =randomChar(12);
	//createDiv(sId, '窗口名称',sUrl);//窗口链接是web虚拟路径
	//openLayer(sId);
}

//新日程安排
function onWorkArrange()
{
	var sUrl =WEB_PATH+"/oa/arrange/edit_arrange.jsp";
	$E.runOpen(sUrl, true, 650, 500);	
}
</script>