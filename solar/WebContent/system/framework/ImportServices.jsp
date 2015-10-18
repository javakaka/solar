<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<body>
<table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" width="100%" cellpadding="2" cellspacing="1" class="table_c">	
<tr class="tr_c">
	<td width="1%" nowrap class="td_c">所属模块</td>
	<td>
		<$:A service="queryMoudleList" dynamic="true"/>
		<$:M dtype="1"/>
		<$:L name="moudle_id" rs="ListValue" valueField="value" textField="text" firstText="请选择..."
			props=" notnull desc='所属模块'"
		/>
	</td>
</tr>
<tr class="tr_c">
	<td class="td_c">服务集合</td>
	<td>
		<textarea name="import" rows="20" notnull desc="服务集合" style="width:100%"></textarea>
		导入数据，格式为每一行为一个静态服务；<br>
		一行数据包含三个元素：服务名 class全路径 服务描述，元素与元素之间用半角逗号","隔开；<br/>
		例如：<br/>
		<I>editCatalog,com.lux.emenu.menu.Catalog,编辑分类</br>
getCatalogTree,com.lux.emenu.menu.Catalog,获取分类树</I>
	</td>
</tr>
<tr class="tr_c">
	<td colspan="2" align="center" valign="top">
		<input type="button" value="导入" onClick="onImportServices()">
		<br/>
		<span id="idSpanMsg"></span>
	</td>
</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
/*服务导入*/
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