<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="dyservice.list" from="4">
<div align=left>
<table>
<form>
   <tr>
      <td align=left>&nbsp;��̬�����ѯ &raquo;&nbsp;<$:I item="fm_dyna_action.action_id"/>&raquo;&nbsp;<input type=text name="action_id" value=''><$:I item="fm_dyna_action.action_desc"/><input type=text name="action_desc" value=''>SQL���<input type=text name="action_sql" value=''>����ģ��:<$:A service="queryMoudleList" dynamic="true"/>
						<$:M dtype="1"/>
						<$:L name="moudle" rs="ListValue" valueField="value" textField="text" firstText="��ѡ��..."/><input type=submit value=<$:I item="html.button.query"/> ><input type=button onClick="document.location.href='<%=GlobalUtil._WEB_PATH%>/system/card/CardList.jsp?card=FM_SERVICES'" value="��̬����ά��">
      <script>
         $S("moudle", $E.getParameter("moudle"));
         $S("action_id", $E.getParameter("action_id"));
         $S("action_desc", $E.getParameter("action_desc"));
         $S("action_sql", $E.getParameter("action_sql"));
      </script></td>
   </tr>
</form>
</table>
</div>
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" onClick="row()" onDblClick="dbClick()" >	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap><$:I item="fm_dyna_action.action_id"/></td>
		<td class="td_c" width=1% nowrap><$:I item="fm_dyna_action.seq"/></td>
		<td class="td_c" width=1% nowrap><$:I item="fm_dyna_action.action_type"/></td>
		<td class="td_c" width=1% nowrap><$:I item="fm_dyna_action.rsname"/></td>
		<td class="td_c" width=1% nowrap>�ȽϷ�</td>
		<td class="td_c" width=1% nowrap>Ȩ�޵ȼ�</td>
		<td class="td_c" width=1% nowrap><$:I item="fm_dyna_action.db_type"/></td>
		<td class="td_c" nowrap><$:I item="fm_dyna_action.action_desc"/>&nbsp;&nbsp;(<$:I item="System.dyna_service.doubleclick"/>)
	</tr>
	<$:A service="getDynaServices" dynamic="false" pagesize="8">
		<$:P name="action_id" from="request"/>
		<$:P name="action_desc" from="request"/>
		<$:P name="moudle" from="request"/>
		<$:P name="action_sql" from="request"/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="dyna_service" name="Actions" fieldNum="8" pagesize="8" message="û�в�ѯ����¼">
	  <tr  class="tr_c" <$:R item="dyna_service.ACTION_ID,SEQ,COMPARE,AUTH_LEVEL,MOUDLE_ID,DB_TYPE,ACTION_TYPE"/>>
		<td nowrap>&nbsp;<$:C item="dyna_service.ACTION_ID"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.SEQ"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.ACTION_TYPE" replace="[0,��ѯ][1,ɾ�����޸ġ����][2,����ɾ�����޸�ʵ��(�����е�)]"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.RSNAME"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.COMPARE" replace="[0,����][1,=][12,<][3,>][4,<=][5,>=]"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.AUTH_LEVEL" replace="[0,����][1,һ�����Ա][2,���Ź���Ա][3,��ϵͳ����Ա][4,ϵͳ����Ա][5,ϵͳ������]"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.DB_TYPE" replace="[0,����][1,Oracle][2,Mysql]"/></td>
		<td nowrap>&nbsp;<$:C item="dyna_service.ACTION_DESC"/></td>
	  </tr>
	</$:T>
	<tr class="tr_c"> 
	<td colspan="8" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="8"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<!--��̬�����б�-->
<$:G title="dyservice.edit" from="4">
<iframe id="sub" width="100%" height="170" onload="javascript:{dynIframeSize(this)}"   frameborder="0" scrolling="no" src="./DynaServices_01.jsp"></iframe>
</$:G>
<script>
function url(page)
{
	document.all.sub.src =page;
}
function row()
{
	try
	{
		Table.click();
		var action_id=Table.clickRow("tabMain").ACTION_ID;
		var seq=Table.clickRow("tabMain").SEQ;
		var compare=Table.clickRow("tabMain").COMPARE;
		var auth_level=Table.clickRow("tabMain").AUTH_LEVEL;
		var moudle_id=Table.clickRow("tabMain").MOUDLE_ID;
		var db_type=Table.clickRow("tabMain").DB_TYPE;
		var action_type=Table.clickRow("tabMain").ACTION_TYPE;
		if(action_id)
		{
			 var src ="DynaServices_01.jsp?action_id="+action_id+"&seq="+seq
				+"&auth_level="+auth_level+"&compare="+compare;
			 if(moudle_id)
				src +="&moudle_id="+moudle_id;
			 if(db_type)
				src +="&db_type="+db_type;
			 if(action_type)
				src +="&action_type="+action_type;
			document.all.sub.src =src;
		}
	}
	catch(e){}
}
function dbClick()
{
	var action_id =Table.clickRow("tabMain").ACTION_ID;
	if(!action_id) return;
	var seq =Table.clickRow("tabMain").SEQ;
	var compare =Table.clickRow("tabMain").COMPARE;
	var auth_level =Table.clickRow("tabMain").AUTH_LEVEL;
	var features ="dialogHeight = 260px; dialogWidth = 700px; help: no; status: no;";//Modal Dialog Window feature
	var sQueryString ="?file="+WEB_PATH+"/system/framework/DynaServiceParams.jsp";
	sQueryString +="&action_id="+action_id+"&seq="+seq+"&compare="+compare+"&auth_level="+auth_level;
	var arrOutArgs = window.showModalDialog("../../common/DialogFram.jsp"+sQueryString, null, features);
}
</script>