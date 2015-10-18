<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<%
String sCard =ServletUtil.get(request,"table_ename");
String sPageCname =ServletUtil.get(request,"pagecname");
if(sPageCname.length() >0)
{
	%>
		<$:A service="saveCardInfoRefPage" dynamic="false">
			<$:P name="table_ename" value="<%=sCard%>"/>
			<$:P name="pagecname" value="<%=sPageCname%>"/>
			<$:P name="pageurl" from="request"/>
		</$:A>
	<%
}
%>
<$:G title="数据列及授权">
<table cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="onRow()" name="tabMain" id="tabMain">
   <tr class="tr_c">
       <td class="td_c" width=1% nowrap>群体</td>
       <td class="td_c" width=1% nowrap>可看到列</td>
   </tr>
<$:A service="getFieldPremission" dynamic="false">
	<$:P name="card" value="<%=sCard%>"/>
</$:A>
<$:M dtype="1"/>
	<$:T var="prem" name="PREMISSION">
	  <tr class="tr_c" <$:R item="prem.PREM_NO"/>>
		<td><$:C item="prem.PREMISION_OBJECT"/></td>
		<td><$:C item="prem.FIELD_CNAMES"/>&nbsp;</td>
	  </tr>
	</$:T>
</table>
</$:G>
<div align=right>
   <input name="btAdd" type="button" value=<$:I item="html.button.add"/>  class="btFirst" onClick="onAdd()"><!-- <input name="btUpdate" type="button" value=<$:I item="html.button.update"/>  class="btnoFirst" disabled> --><input type="button" name="btDel" value=<$:I item="html.button.del"/>  class="btNofirst" onClick="onDel()" disabled>
</div>
<input type=hidden name="prem_no">
<hr size=1 width=100% class="table_c">
<$:G title="详细信息包含页面">
<table cellpadding="2" cellspacing="1" class="table_c" width="100%">
   <tr class="tr_c">
       <td class="td_c" width=40% nowrap>页面中文名</td>
       <td class="td_c" width=60% nowrap>页面链接</td>
   </tr>
	<%
	String sWhere =" where table_ename='"+sCard+"'";
	%>
	<$:A service="queryCommonList" dynamic="true">
		<$:P name="textfield" value="page_cname"/>
		<$:P name="valuefield" value="page_url"/>
		<$:P name="table" value="db_cardinfo_include_pages"/>
		<$:P name="where" value="<%=sWhere%>"/>
	</$:A>
	<$:M dtype="1"/>
	<%
	DataSet alList =null;
	if(ServletUtil.getResult(request,"LISTVALUE") !=null)
	{
		alList =(DataSet)ServletUtil.getResult(request,"LISTVALUE");
	}
	for(int i=0; i<6; i++)
	{
		if(alList !=null && alList.size() >i)
		{
			Row hmTmp =(Row)alList.get(i);
			%>
			<tr class="tr_c">
				<td><input type=text name="page_cname" size="20" value='<%=hmTmp.get("TEXT")%>'></td>
				<td><input type=text name="page_url" size="70" value='<%=hmTmp.get("VALUE")%>'></td>
			</tr>
			<%
		}
		else
		{
			%>
			<tr class="tr_c">
				<td><input type=text name="page_cname" size="20"></td>
				<td><input type=text name="page_url" size="70"></td>
			</tr>
			<%
		}
	}
	%>
	<tr class="tr_c">
		<td class="td_c" colspan="2" height=100>
		注：<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当访问详细信息页面带参数disabled_rel_page时，就不显示包含的页面信息;
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在页面链接中出现<i>{参数名}</i>，这个表示从所在页面取参数然后传递给包含页面。
		</td>
	</tr>
	<tr class="tr_c">
		<td colspan=2 align=center>
		   <input name="btSave" type="button" value=<$:I item="html.button.submit"/>    onClick="onSave()">
		</td>
	</tr>
</table>	
</$:G>
</body>
<script>
function onRow()
{
	Table.click();
	var prem_no =Table.clickRow(document.all.tabMain).PREM_NO;
	if(prem_no !='' && typeof prem_no !='undefined')
	{
		document.all.btDel.disabled =false;
		document.all.prem_no.value =prem_no;
	}
	else
	{
		document.all.btDel.disabled =true;
		document.all.prem_no.value ="";
	}
}
function onAdd()
{
	//window.open("<%=GlobalUtil._WEB_PATH%>/system/database/select_staff_and_fields.jsp?table_ename=<%=sCard%>&op=0");
	$E.runOpen("<%=GlobalUtil._WEB_PATH%>/system/database/SelectStaffAndFields.jsp?table_ename=<%=sCard%>&op=0", true, 600, 620);
	$E.reload();
}
function onDel()
{
	if(document.all.prem_no.value =="")
	{
		$E.message("请选择一条记录");
		return;
	}
	if(confirm("确实要删除此配置?"))
	{
		//$E.runOpen(WEB_PATH+"/system/database/SelectStaffAndFields.jsp?table_ename="+$E.getParameter("table_ename")+"&op=2&save=1&prem_no="+document.all.prem_no.value, true, 600, 620);
		var s =new Server("editFieldPremission");
		s.setParam("table_ename", $E.getParameter("table_ename"));
		s.setParam("op", "2");
		s.setParam("prem_no", $V("prem_no"));
		s.send(s, false, function()
		{
			$E.reload();
		}
		);
	}
}
function onSave()
{
	var page_cname =document.all.page_cname;
	var page_url =document.all.page_url;
	var pagecname ="";
	var pageurl ="";
	for(i=0; i<page_cname.length; i++)
	{
		if(page_cname[i].value !='' && page_url[i].value !='')
		{
			if(pagecname =="")
			{
				pagecname =page_cname[i].value;
				pageurl =page_url[i].value;
			}
			else
			{
				pagecname +=","+page_cname[i].value;
				pageurl +=","+page_url[i].value;
			}
		}
	}
	if(pagecname.length >0)
	{
		var urls =pageurl.split("&");
		var url ="";
		for(i =0; i<urls.length; i++)
		{
			if(i>0)
				url +="$"+urls[i];
			else
				url =urls[i];
		}
		//location.href='FieldPremission.jsp?table_ename=<%=sCard%>&pagecname='+pagecname+"&pageurl="+url;
		 var s=new Server("saveCardInfoRefPage");
		 s.setParam("table_ename", $E.getParameter("table_ename"));
		 s.setParam("pagecname", pagecname);
		 s.setParam("pageurl", url);
		 s.send(s, false, function(){
				alert("保存成功！");
			}
		 );
	}
}
</script>