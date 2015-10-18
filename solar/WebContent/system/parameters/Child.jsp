<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<%String sTitle=ServletUtil.get(request,"field_ename")+"静态字段清单";%>
<$:G title="<%=sTitle%>" width="100%">
<table id="tabMain" onClick="row()" cellpadding="2" cellspacing="1" class="table_c">
  <tr class="tr_c"> 
    <td height="1" align=right colspan=5>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="btnadd" value=<$:I item="html.button.add"/> onclick="modify(0)"><input type="button" name="btndel" value=<$:I item="html.button.del"/> td_c onclick="modify(2);" disabled><input type="button" name="btnupdate" value=<$:I item="html.button.update"/> td_c onclick="modify(1);" disabled></td>
  </tr>
  <tr class="tr_c"> 
	<td class="td_c" width=1% nowrap>静态参数</td>
	<td class="td_c" width=1% nowrap>字段使用值</td>
	<td class="td_c" width=1% nowrap>显示值</td>
	<td class="td_c" width=1% nowrap>显示顺序</td>
	<td class="td_c" nowrap>描述</td>
  </tr>
<%
String sItem =ServletUtil.get(request, "field_ename");
%>
 <$:A service="getSysDictoryItems" dynamic="false">
	<$:P name="item" value="<%=sItem%>"/>
 </$:A>
 <$:M dtype="1"/>
	<$:T var="field" name="<%=sItem%>" fieldNum="5">
	   <tr class="tr_c" <$:R item="field.FIELD_ENAME,USED_VIEW2,DISP_VIEW,DISP_ORDER,NOTES"/>>
		<td nowrap><%=sItem%></td>
		<td nowrap>&nbsp;<$:C item="field.USED_VIEW2"/></td>
		<td nowrap>&nbsp;<$:C item="field.DISP_VIEW"/></td>
		<td nowrap>&nbsp;<$:C item="field.DISP_ORDER"/></td>
		<td nowrap>&nbsp;<$:C item="field.NOTES" brsize="15"/></td>
	   </tr>
	 </$:T>
</table>
</$:G> 
</body>
</html>
<script>
function modify(type)
{
   var field_ename='<$:W name="field_ename" from="request"/>';
   if(type=='0')
   {
		$E.runOpen(WEB_PATH+'/system/parameters/ValueAdd.jsp?field_ename='+field_ename+'&type='+type, true, 400, 190);
		$E.reload();
   }
   else if(type =="1")
   {
		var used_view =Table.clickRow(document.all.tabMain).USED_VIEW2;
		var disp_view =Table.clickRow(document.all.tabMain).DISP_VIEW;
		var disp_order =Table.clickRow(document.all.tabMain).DISP_ORDER;
		var notes =Table.clickRow(document.all.tabMain).NOTES;
		if(field_ename !="" && typeof field_ename !='undefined')
      {
         $E.runOpen('<%=GlobalUtil._WEB_PATH%>/system/parameters/ValueAdd.jsp?field_ename='+field_ename+'&used_view='+used_view+'&disp_view='+disp_view+'&disp_order='+disp_order+'&dispdisp_order='+disp_order+'&notes='+notes+'&type='+type, true, 400, 190);
			$E.reload();
      }
      else
         $E.message("请选择一条要修改的记录");
   }
	else if(type =='2')
	{
		var used_view =Table.clickRow(document.all.tabMain).USED_VIEW2;
		if(field_ename !="" && typeof field_ename !='undefined')
      {
			if(confirm("确实要删除此静态参数的值吗?"))
			{
				var s=new Server("editSysDictory");
				s.setParam("field_ename", field_ename);
				s.setParam("used_view", used_view);
				s.setParam("operate", type);
				s.send(s, false, function(){
					alert("删除成功！");
					$E.reload();
				}
				);
			}
      }
      else
         $E.message("请选择一条要修改的记录");
	}
}
function row()
{
   Table.click();
   try
   {
      var field_ename =Table.clickRow(document.all.tabMain).FIELD_ENAME;
         if(field_ename !="" && typeof field_ename !='undefined')
         {
            document.all.btndel.disabled=false;
            document.all.btnupdate.disabled=false;
         }
         else
         {
            document.all.btndel.disabled=true;document.all.btnupdate.disabled=true;
         }
   }catch(e){}
}
</script>