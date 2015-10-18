<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="field.list" from="4">
<table id="tabMain" name="tabMain" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width="100%" onClick="Table.click()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_cname"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_ename"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_type"/></td>
		<td class="td_c" width=1% nowrap><$:I item="db_fields.field_length"/></td>
		<td class="td_c" width=1% nowrap>默认值</td>
		<td class="td_c" width=1% nowrap>是否空值</td>
		<td class="td_c" nowrap><$:I item="db_fields.field_desc"/></td>
		<td class="td_c" nowrap>界面提醒</td>
		<td class="td_c" nowrap>Tab键值</td>
		<td class="td_c" nowrap>状态</td>
	</tr>
	<$:A service="getTableFields" dynamic="true" pagesize="10">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="field" name="Fields" fieldNum="8">
	  <tr class="tr_c" <$:R item="field.FIELD_CNAME,FIELD_ENAME,FIELD_TYPE,FIELD_LENGTH,DEFAULT_VALUE,IS_NULL,FIELD_DESC,IS_KEY,TAG,REMIND,THETAB"/>>
		<td nowrap>&nbsp;<$:C item="field.FIELD_CNAME"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_ENAME"/>&nbsp;</td>
		<td nowrap>&nbsp;<$:C item="field.DISP_VIEW"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_LENGTH"/></td>
		<td nowrap>&nbsp;<$:C item="field.DEFAULT_VALUE"/></td>
		<td align="center" nowrap><$:C item="field.IS_NULL" replace="[1,不为空][0,可为空]"/></td>
		<td nowrap>&nbsp;<$:C item="field.FIELD_DESC" brsize="15"/></td>
		<td nowrap>&nbsp;<$:C item="field.REMIND" brsize="15"/></td>
		<td nowrap>&nbsp;<$:C item="field.THETAB"/></td>
		<td nowrap>&nbsp;<$:C item="field.TAG" replace="[4,删除未应用][3,修改未应用][2,添加未应用][1,已应用][0,未应用到数据库]"/></td>
	  </tr>
	</$:T>
	<tr bgcolor="#FFFFFF"> 
	<td colspan="10" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="10"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
