<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<$:G title="�����м���Ȩ">
<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"  width="100%" onClick="onRow()" name="tabMain" id="tabMain">
   <tr bgcolor=#FFFFFF>
       <td class="td_c" width=1% nowrap>Ⱥ��</td>
       <td class="td_c" width=1% nowrap>�ɿ�����</td>
       <td class="td_c" width=1% nowrap>HtmlCode</td>
   </tr>
<$:A service="getFieldListPremission" dynamic="false">
	<$:P name="card" from="request"/>
</$:A>
<$:M dtype="1"/>
	<$:T var="prem" name="PREMISSION">
	  <tr bgcolor=#FFFFFF <$:R item="prem.LIST_NO"/>>
		<td width=1% nowrap><$:C item="prem.PREMISION_OBJECT"/></td>
		<td width=98%><$:C item="prem.FIELD_CNAMES"/>&nbsp;</td>
		<td align=center width=1% nowrap><input type=button value='�鿴' onClick="onViewHtmlCode('<$:C item="prem.LIST_NO"/>')">&nbsp;</td>
	  </tr>
	</$:T>
</table>
</$:G>
<div align=right>
   <input name="btAdd" type="button" value=<$:I item="html.button.add"/>  class="btFirst" onClick="onAdd()"><input name="btUpdate" type="button" value=<$:I item="html.button.update"/>  disabled onClick="alert('��ʱ������')"><input type="button" name="btDel" value=<$:I item="html.button.del"/>  onClick="onDel()" disabled><input type="button" name="btReload" value="ˢ��"  onClick="$E.reload()">
</div>
<input type=hidden name="list_no">
</body>
<script>
function onRow()
{
	Table.click();
	var list_no =Table.clickRow(document.all.tabMain).LIST_NO;
	if(list_no !='' && typeof list_no !='undefined')
	{
		document.all.btUpdate.disabled =false;
		document.all.btDel.disabled =false;
		document.all.list_no.value =list_no;
	}
	else
	{
		document.all.btUpdate.disabled =true;
		document.all.btDel.disabled =true;
		document.all.list_no.value ="";
	}
}
function onAdd()
{
	$E.runOpen("<%=GlobalUtil._WEB_PATH%>/system/database/SelectStaffAndListFields.jsp?table_ename="+$E.getParameter("card")+"&op=0", true, 600, 620);
}
function onDel()
{
	if(document.all.list_no.value =="")
	{
		message("��ѡ��һ����¼");
		return;
	}
	if(confirm("ȷʵҪɾ��������?"))
	{
		var s=new Server("editFieldListPremission");
		s.setParam("table_ename", $E.getParameter("card"));
		s.setParam("op", "2");
		s.setParam("list_no", $V("list_no"));
		s.send(s, false, function(){
			alert("ɾ���ɹ���");
			$E.reload();
			}
		);
	}
}

//�鿴HTML CODE
function onViewHtmlCode(sListNo)
{
	window.open("HtmlCode.jsp?card="+getParameter("card")+"&list_no="+sListNo+"&type=list");
}
</script>