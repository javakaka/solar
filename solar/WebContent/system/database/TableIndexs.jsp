<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="�����б�" width="100%">
<div align=right>
	<input name="btApply" type="button" value="Ӧ�õ���(A)" onClick="onApplyToTable()" accesskey="A" class="bttopfirst">
</div>
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" 	onClick="row()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap>������</td>
		<td class="td_c" width=1% nowrap>����</td>
		<td class="td_c" width=1% nowrap>����</td>
		<td class="td_c" width=1% nowrap>״̬</td>
	</tr>
	<$:A service="getDBIndexs" dynamic="true">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="indexs" name="Indexs">
	  <tr class="tr_c" <$:R item="indexs.TABLE_ENAME,INDEX_ID,NAME,TYPE,COLUMNS_NAME,INDEX_ORDER,TAG"/>>
		<td nowrap>&nbsp;<$:C item="indexs.NAME"/></td>
		<td nowrap><$:C item="indexs.COLUMNS_NAME"/></td>
		<td nowrap><$:C item="indexs.TYPE" replace="[1,Ψһ][0,��ͨ]"/>&nbsp;</td>
		<td nowrap><$:C item="indexs.TAG" replace="[1,��Ӧ��][0,δӦ��]"/></td>
	  </tr>
	</$:T>
</table>
</$:G>
<$:G title="�����༭">
<table width=100%>
	<form name="index">
	<tr><td colspan="3" height=30 align=center valign=bottom><input type=button value='�������' class="bttopnofirst" onClick="add(this.form);"><input type=button value='ɾ������' class="bttopnofirst" onClick ="onDel()" name="del" disabled></td></tr>
	<tr>
		<td colspan=3 valign=top>
			<table name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" align=center>	
				<tr class="tr_c">
					<td  width=40% nowrap align=right class="td_c">
						������<font color="red">*</font>
					</td>
					<td><input name="name_tmp" value="INX_" desc='������' datatype="string" size=20></td>
				</tr>
				<tr class="tr_c">
					<td  width=1% nowrap align=right class="td_c">
						����<font color="red">*</font>
					</td>
					<td><input name="columns_name" desc='����' datatype="string" size=20 readonly><input name="btSelColumn" type="button" value="..." class="button" onClick="onSelColumns()"></td>
				</tr>
				<tr class="tr_c">
					<td  width=1% nowrap align=right class="td_c">
						����<font color="red">*</font>
					</td>
					<td>
								<$:A service="getSysDictoryItems" dynamic="false">
									<$:P name="item" value="DB_INDEX_TYPE"/>
								 </$:A>
								<$:M dtype="1"/>
								<$:L name="type" rs="DB_INDEX_TYPE" valueField="used_view" textField="disp_view" value="2" firstText="��ѡ��..."/>
					</td>
				</tr>
				<tr class="tr_c">
					<td align=center colspan=2 ><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"></td>
				</tr>

			</table>
			<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request"/>'>
			<input name="name" type=hidden>
			<input name="tag" type=hidden>
			<input type=hidden name="table" value="db_indexs">
			<input type=hidden name="operate" value="0">
			<input type=hidden name="index_id">
		</td>
	</tr>
	</form>
</table>
</$:G>
<script>
function onDel()
{
	if(document.index.name.value =="")
	{
		alert("û��ѡ����Ч�ļ�¼��");
	}else{
		if(confirm("ע�⣬�˲�����ɾ����������Ϣ��"))
		{
			var tag =Table.clickRow(document.all.tabMain).TAG;
			document.index.operate.value="2";
			document.index.tag.value =tag;
			document.index.submit();
		}
	}
}
function add(form)
{
   form.reset();
   form.name_tmp.disabled =false;
   form.name_tmp.focus();
}
function onSelColumns()
{
	var table_ename ='<$:W name="table_ename" from="request"/>';
	var features ="dialogHeight = 320px; dialogWidth = 550px; help: no; status: no;";//Modal Dialog Window 
    var arrOutArgs = window.showModalDialog("<%=GlobalUtil._WEB_PATH%>/system/database/FieldsSelect.jsp?table_ename=" +table_ename, null, features);
	
	if (arrOutArgs != null){
		document.all.columns_name.value =arrOutArgs;
	}
}
function onApplyToTable()
{
	if(confirm('ȷ��ҪӦ�ô����������ݱ����ݴ�С������Ҫ���ѽϳ�ʱ�䡣'))
   {
		var s =new Server("applyIndex");
		s.setParamValue("default", "table_ename", $E.getParameter("table_ename"));
		if(s.send(s, true))
		{
			alert("�ؼ���Ӧ�õ����ݱ�ɹ�");
			document.location.reload();
		}
	}
}
function row()
{
	try	{
		Table.click();
		var name =Table.clickRow(document.all.tabMain).NAME;
		if(name !="" && typeof name !='undefined')
		{
			document.index.index_id.value =Table.clickRow(document.all.tabMain).INDEX_ID;
			document.index.name.value=name;
			document.index.name_tmp.value=name;
			document.index.type.value =Table.clickRow(document.all.tabMain).TYPE;

		 if(typeof Table.clickRow(document.all.tabMain).COLUMNS_NAME !="undefined")
			document.index.columns_name.value =Table.clickRow(document.all.tabMain).COLUMNS_NAME;
		 else
			document.index.columns_name.value ="";

		 document.index.name_tmp.disabled =true;
		 document.index.operate.value="1";
         document.index.del.disabled=false;
		}
		else
		{
			document.index.index_id.value ='';
			document.index.table_ename.value ='';
			document.index.name_tmp.value='';
			document.index.columns_name.value ='';
			document.index.name_tmp.disabled =false;
			document.index.operate.value="0";
			document.index.del.disabled=true;
		}
	} catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
      if(form.type.value =="")
      {
         message("��ѡ����������");
         form.type.focus();
         return false;
      }
	  form.name.value=form.name_tmp.value;
		var s=new Server("editDbMoudelData");
		s.setFormData();
		s.send(s, false, function(){
			alert("����ɹ���");
			document.location.reload();
		}
		);
	}
}
</script>