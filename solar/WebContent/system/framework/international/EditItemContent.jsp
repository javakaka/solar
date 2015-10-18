<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<HEAD>
</HEAD>
<BODY>
<$:G title="语言条目编辑">
<table width="100%" cellpadding="2" cellspacing="1" border=0 class="table_c">
<tr class="tr_c">
	<td class="td_c" width="10%" align="center" nowrap>资源类型</td>
	<td class="td_c" width="20%" align="center" nowrap>资源标识</td>
	<td class="td_c" width="70%" align="center" nowrap>资源值[<font color='red'>配置后，需要加载才能看到效果</font>]</td>
</tr>
<$:A service="getLanguageItems" dynamic="true">
	<$:P name="lan_no"/>
</$:A>
<$:M dtype="1"/>
<$:T var="Item" name="Items">
<tr class="tr_c">
	<td width="5%" nowrap align="center">
		<$:C item="Item.res_type" replace="[1,文本][2,文件]"/>
	</td>
	<td class="td_c" width="15%" style="cursor:hand" nowrap align="center">
		<label title='<$:C item="Item.res_position"/>'><$:C item="Item.res_item"/></label>
	</td>
	<td width="80%">
		<table cellpadding="0" cellspacing="0"><tr><td width="99%"><textarea rows="2" style="width:100%" id='idTextarea<$:C item="Item.ROWID"/>' onChange="onContentChanged(idBt<$:C item="Item.ROWID"/>)"><$:C item="Item.res"/></textarea></td><td width=1% nowrap><input type=button value="保存" id='idBt<$:C item="Item.ROWID"/>' onClick="onEditItemRes('<$:C item="Item.res_item"/>',idTextarea<$:C item="Item.ROWID"/>, this)" disabled></td></tr></table>
	</td>
</tr>
</$:T>
</table>
<input type="hidden" name="hres_item" value="">
</$:G>
</BODY>
</HTML>
<script>
function onEditItemRes(sResItem, idTextarea, idButton)
{
	var s=new Server("setLanguageItemRes");
	s.setParam("lan_no", $E.getParameter("lan_no"));
	s.setParam("res_item", sResItem);
	s.setParam("res", idTextarea.value);
	s.send(s, false, function()
		{
			idButton.disabled =true;
		}
	);
}

function onContentChanged(idButton)
{
	idButton.disabled =false;
}
</script>