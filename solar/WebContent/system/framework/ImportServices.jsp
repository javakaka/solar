<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<body>
<table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" width="100%" cellpadding="2" cellspacing="1" class="table_c">	
<tr class="tr_c">
	<td width="1%" nowrap class="td_c">����ģ��</td>
	<td>
		<$:A service="queryMoudleList" dynamic="true"/>
		<$:M dtype="1"/>
		<$:L name="moudle_id" rs="ListValue" valueField="value" textField="text" firstText="��ѡ��..."
			props=" notnull desc='����ģ��'"
		/>
	</td>
</tr>
<tr class="tr_c">
	<td class="td_c">���񼯺�</td>
	<td>
		<textarea name="import" rows="20" notnull desc="���񼯺�" style="width:100%"></textarea>
		�������ݣ���ʽΪÿһ��Ϊһ����̬����<br>
		һ�����ݰ�������Ԫ�أ������� classȫ·�� ����������Ԫ����Ԫ��֮���ð�Ƕ���","������<br/>
		���磺<br/>
		<I>editCatalog,com.lux.emenu.menu.Catalog,�༭����</br>
getCatalogTree,com.lux.emenu.menu.Catalog,��ȡ������</I>
	</td>
</tr>
<tr class="tr_c">
	<td colspan="2" align="center" valign="top">
		<input type="button" value="����" onClick="onImportServices()">
		<br/>
		<span id="idSpanMsg"></span>
	</td>
</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
/*������*/
function onImportServices()
{
	if(!checkForm())
		return;
	idSpanMsg.innerHTML ="";
	var s =new Server("importService");
	s.setParam("moudle_id", $V("moudle_id"));
	s.setParam("import", $V("import"));
	s.send(s, false, function()
	{
		var msg =s.getDefaultParamValue("msg");
		idSpanMsg.innerHTML =msg;
		$S("moudle_id", "");
		$S("import", "");
	}
	);
}
//-->
</script>