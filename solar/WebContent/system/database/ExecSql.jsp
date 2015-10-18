<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="query.list" from="4">
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="Table.click()">	
<form method=POST action="<%=request.getRequestURI()%>" onSubmit="return checkForm(this);">
	<tr class="tr_c">
		<td width=100% colspan=2><textarea name="SQL" rows="4" cols=80 desc="SQL Clause" datatype="string"><%=ServletUtil.get(request,"SQL")==null?"":ServletUtil.get(request,"SQL").trim()%></textarea>
   <SELECT NAME="SQLType">
			<option value=1><$:I item="System.db.SQLType1"/></option>
			<option value=0><$:I item="System.db.SQLType2"/></option></SELECT>
		<input type=submit value='<$:I item="System.db.ExecuteSQL"/>'></td>
	</tr>
</form>
<$:NE param="SQLType" value="">
	<$:A service="actioDBSql" dynamic="false" pagesize="8">
		<$:P name="SQLType" from="request"/>
		<$:P name="SQL" from="request"/>
	</$:A>
	<$:E param="SQLType" value="1">
	<tr class="tr_c">
		<td colspan=5>
		<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%">
				<%
					DataSet al =(DataSet)ServletUtil.getResult(request,"FIELDS");
					if(al !=null)
					{
						Object[] o =new Object[al.size()];
						for(int i=0; i<al.size(); i++)
						{
							o[i] =((Row)al.get(i)).get("FIELD").toString();
						}
					%>
					<tr class="tr_c">
						<td class="td_c" colspan="<%=o.length%>" nowrap><$:I item="common.query.list"/></td>
					</tr>
					<tr class="td_c">
						<%for(int i=0; i<o.length; i++){%>
							<td bgColor="silver"><%=o[i]%></td>
						<%}%>
					</tr>
					<$:T var="result" name="LIST">
					  <tr class="tr_c">
						<%for(int i=0; i<o.length; i++){%>
							<td nowrap>&nbsp;<$:C item='<%="result."+o[i]%>'/></td>
						<%}%>
					  </tr>
					</$:T>
					<tr class="tr_c"> 
					<td colspan="<%=o.length%>" height="1%" align="left">  
						<form name="formpage">
							<$:Page pagesize="8"/>
						</form>
					</td>
					</tr>
				<%}%>
		</table>
		</td>
	</tr>
	</$:E>
	<$:M dtype="1"/>
</$:NE>

</table>
</$:G>
