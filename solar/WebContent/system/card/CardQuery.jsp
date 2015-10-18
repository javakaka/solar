<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Datetime.js"></script>
<base target="_self">
<%String sCard =request.getParameter("card")==null?"":request.getParameter("card");%>
<!--查询区域-->
<$:A service="getQueryFields" dynamic="true">
	<$:P name="table_ename" value="<%=sCard%>"/>
</$:A>
<$:M dtype="1"/>
<%
if(ServletUtil.getResult(request,"FIELDS") !=null)
{
%>
	<form name='query' method='POST'  action="<%=request.getRequestURI()%>">
	<input type=hidden name="card" value="<%=sCard%>">
	<table id="idTabQuery" border=0 width=100%  cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" >
<%
	DataSet alData =(DataSet)ServletUtil.getResult(request,"FIELDS");
	int iRow =0;
	if(alData.size() !=0)
	{	
		int i =0;
		for(i=0; i<alData.size(); i++)
		{
			Row hmTmp =(Row)alData.get(i);
			String sFieldCname =hmTmp.get("FIELD_CNAME").toString();
			String sFieldEname =hmTmp.get("FIELD_ENAME").toString();
			String sStyleId =hmTmp.get("STYLE_ID")==null?"":hmTmp.get("STYLE_ID").toString();
			String sValue =request.getParameter("_Q"+sFieldEname) ==null?"":StringUtil.isoToGBK(request.getParameter("_Q"+sFieldEname), true);
			if(i%2 ==0)
				if(i ==0)
					out.println("<tr class='tr_c'>");
				else
					out.println("</tr><tr class='tr_c'>");
			if(sStyleId.equals("005004"))
			{
				out.println("<td class='td_c' align=right>"+sFieldCname+"</td>");
				String sQFieldEname ="_Q"+sFieldEname;
			%>
					<td><$:A service="getSourceData" dynamic="false">
						<$:P name="table_ename" value="<%=sCard%>"/>
						<$:P name="field_ename" value="<%=sFieldEname%>"/>
					</$:A>
					<$:M dtype="1"/>
					<$:L name="<%=sQFieldEname%>" rs="SOURCE_DATA" valueField="VALUE" 	textField="TEXT" firstText="请选择..."/>
					<script>document.all._Q<%=sFieldEname%>.value='<%=sValue%>'</script>
					</td>
			<%
			}
			else if(sStyleId.equals("004001"))
			{
				out.println("<td class='td_c' align=right>"+sFieldCname+"</td><td><input type=text size=10 readonly name='_Q_B"+sFieldEname+"' value='' onClick='setDay(this)'>至<input type=text size=10 readonly name='_Q_E"+sFieldEname+"' value='' onClick='setDay(this)'></td>");
			}
			else if(sStyleId.equals("004002"))
			{
				out.println("<td class='td_c'  align=right>"+sFieldCname+"</td><td><input type=text size=20 readonly name='_Q_B"+sFieldEname+"' value='' onClick='setDay(this)'>至<input type=text size=20 readonly name='_Q_E"+sFieldEname+"' value='' onClick='setDay(this)'></td>");
			}
			else if(sStyleId.equals("001002"))
			{
				out.println("<td class='td_c'  align=right>"+sFieldCname+"</td><td><input type='text' size='20' readonly name='"+sFieldEname+"_TMP' value=''><input type=hidden name='_Q"+sFieldEname+"'><IMG SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' width='16' height='16' onClick='onSelectSite(document.query._Q"+sFieldEname+",document.query."+sFieldEname+"_TMP)' style='cursor=hand'></td>");
			}
			else if(sStyleId.equals("001005"))
			{
				out.println("<td class='td_c'  align=right>"+sFieldCname+"</td><td><input type='text' size='20' readonly name='"+sFieldEname+"_TMP' value=''><input type=hidden name='_Q"+sFieldEname+"'><IMG SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' width='16' height='16' onClick='onSelectStaff(document.query._Q"+sFieldEname+",document.query."+sFieldEname+"_TMP)' style='cursor=hand'></td>");
			}
			else if(sStyleId.equals("006001"))
			{//选人(单选)
				out.println("<td class='td_c'  align=right>"+sFieldCname+"</td><td><input type='text' size='20' readonly name='"+sFieldEname+"_TMP' value='点击请选择......' onClick='onSelectStaff(document.query._Q"+sFieldEname+",document.query."+sFieldEname+"_TMP)' style='cursor=hand'><input type=hidden name='_Q"+sFieldEname+"'>");
				//out.println("<IMG SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' onClick='onSelectStaff(document.all._Q"+sFieldEname+",document.all."+sFieldEname+"_TMP)' style='cursor=hand'></td>");
			}
			else if(sStyleId.equals("006003"))
			{//选部门
				out.println("<td class='td_c'  align=right>"+sFieldCname+"</td><td><input type='text' size='20' readonly name='"+sFieldEname+"_TMP' value=''><input type=hidden name='_Q"+sFieldEname+"'><IMG SRC='"+GlobalUtil._WEB_PATH+"/images/select.gif' width='16' height='16' onClick='onSelectSite(document.query._Q"+sFieldEname+",document.query."+sFieldEname+"_TMP)' style='cursor=hand'></td>");
			}
			else
			{
				out.println("<td class='td_c' align=right>"+sFieldCname+"</td><td><input type=text size=20 name='_Q"+sFieldEname+"'  value='"+sValue+"'><input type=checkbox class='radio' id='c"+sFieldEname+"'  onClick=onCheckThis(this,document.query.check"+sFieldEname+")><label for='c"+sFieldEname+"' style=\"cursor:hand\">模糊匹配</label>\n");
				out.println("<input type=hidden name='check"+sFieldEname+"' value=''></td>");
			}
		}
		if(i %2==1)
			out.println("<td colspan=2>");
	}
	request.removeAttribute(ServletUtil._SOFT_TAG+"FIELDS");
%>
</table>
<div align=center><input type=button value='查询' class='btSearch' onClick="onQuery(this.form)"><input type="button" value='隐藏' class="btnofirst" onclick="onHiddenQueryZone(this)" name="btHidden"></div>
</form>
<%
}
else
{
	%>
	<!--<div align=center><br><br><br><br><br><br>无查询区域<br><br><br><br><br><br><br><br><input type="button" value=<zz:I18n item="html.button.close"/> class="btnofirst" onclick="window.close()" name="btClose"></div>-->
	<%
}
%>
<!--查询区域-->
<script>
function onQuery(form)
{
	var sRet ="";
	for(i=0; i<document.query.length; i++)
	{
		if(document.query[i].name.indexOf("_Q") ==0 
			|| document.query[i].name.indexOf("check") ==0)
		{
			if(sRet =="")
				sRet =document.query[i].name+"="+document.query[i].value;
			else
				sRet +=";"+document.query[i].name+"="+document.query[i].value;
		}
	}
	//window.returnValue =sRet.split(";");
	//window.close();
	form.submit();
}
function onSelectStaff(handlevalue,handletext)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectStaff.jsp';
   var sel_staff_nos=window.showModalDialog(url,window, features);
   if(sel_staff_nos !="" && typeof sel_staff_nos !='undefined')
   {
      var staff =sel_staff_nos.split(".");
      handlevalue.value =staff[0];
      handletext.value =staff[1];
   }
}
function onSelectSite(handlevalue,handletext)
{
	var features ="dialogHeight = 500px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
   var url ='<%=GlobalUtil._WEB_PATH%>/system/card/SelectSite.jsp';
   var sel_site_nos=window.showModalDialog(url,window, features);
   if(sel_site_nos !="" && typeof sel_site_nos !='undefined')
   {
      var site =sel_site_nos.split(".");
      handlevalue.value =site[0];
      handletext.value =site[1];
   }
}
function onCheckThis(handle, hid)
{
   if(handle.checked)
      hid.value='1';
   else
      hid.value ='0';
}

function onHiddenQueryZone(handle)
{
	if(handle.value =='隐藏')
	{
		idTabQuery.style.display ='none';
		handle.value ="显示";
	}
	else
	{
		idTabQuery.style.display ='block';
		handle.value ="隐藏";
	}
}
</script>