<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:G title="�ؼ����б�" width="100%">
<div align=right>
	<input name="btApply" type="button" value="Ӧ�õ���(A)" onClick="onApplyToTable()" accesskey="A" class="bttopfirst">
</div>
<table id="tabMain" name="tabMain" cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width="100%" onClick="row()">	
	<tr bgcolor=#FFFFFF>
		<td class="td_c" width=1% nowrap>�ؼ�����</td>
		<td class="td_c" width=1% nowrap>����</td>
		<td class="td_c" width=1% nowrap>״̬</td>
	</tr>
	<$:A service="getDBKeys" dynamic="true" pagesize="5">
		<$:P name="table_ename" default=""/>
	</$:A>
	<$:M dtype="1"/>
	<$:T var="keys" name="Keys" fieldNum="6">
	  <tr bgcolor=#FFFFFF <$:R item="keys.TABLE_ENAME,KEY_ID,NAME,COLUMNS_NAME,REF_TABLE,REF_COLUMNS,ENABLED,TYPE,TAG"/>>
		<td nowrap>&nbsp;<$:C item="keys.NAME"/></td>
		<td nowrap><$:C item="keys.COLUMNS_NAME"/></td>
		<td nowrap><$:C item="keys.TAG" replace="[1,��Ӧ��][0,δӦ��]"/></td>
	  </tr>
	</$:T>
	<tr bgcolor=#FFFFFF> 
	<td colspan="6" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="5"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<$:G title="�ؼ��ֱ༭">
<table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
	<form name="key">
	<tr bgcolor=#FFFFFF><td colspan="4" height=30 valign=bottom align=center><input type=button value='��ӹؼ���' class="bttopnofirst" onClick="add(this.form);"><input type=button value='ɾ���ؼ���' class="bttopnofirst" onClick ="onDel()" name="del" disabled></td></tr>
	<tr bgcolor=#FFFFFF>
		<td  width=1% nowrap>
			�ؼ�����<font color="red">*</font>
		</td>
		<td><input name="name_tmp" value="PK_<%=ServletUtil.get(request, "table_ename")%>" desc='�ؼ�����' datatype="string" size=20></td>
		<td  width=1% nowrap>
			����<font color="red">*</font>
		</td>
		<td><input name="columns_name" desc='����' datatype="string" size=20 readonly><input name="btSelColumn" type="button" value="..." class="button" onClick="onSelColumns()" ></td>
	</tr>
	<tr bgcolor=#FFFFFF>
		<td align=center colspan=4 valign=top height=30><input type="button" value=<$:I item="html.button.reset"/>    onClick="this.form.reset();document.all.del.disabled=true;"><input type="button" value=<$:I item="html.button.save"/>   onClick="submitMe(this.form)"></td>
	</tr>

			</table>
			<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request"/>'>
			<input name="key_id" type=hidden>
			<input name="name" type=hidden>
			<input name="tag" type=hidden>
			<input type=hidden name="table" value="db_keys">
			<input type=hidden name="operate" value="0">
		</td>
	</tr>
	</form>
</table>
</$:G>
<script>
function onDel()
{
	if(document.key.name.value =="")
	{
		alert("û��ѡ����Ч�ļ�¼��");
	}else{
		if(confirm("ע�⣬�˲�����ɾ���˹ؼ�����Ϣ��"))
		{	
			var tag =Table.clickRow(document.all.tabMain).TAG;
			document.key.operate.value="2";
			document.key.tag.value =tag;
			 var s=new Server("editDbMoudelData");
			 s.setFormData();
			 s.send(s, false, function(){
					alert("�ɹ�ɾ����");
					document.location.reload();
				}
			 );
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
	if(confirm('ȷ��Ҫ�������ݿ��ؼ���?'))
   {
		var s =new Server("applyKey");
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
			document.key.key_id.value =Table.clickRow(document.all.tabMain).KEY_ID;
			document.key.name.value=name;
			document.key.name_tmp.value=name;

		 if(typeof Table.clickRow(document.all.tabMain).COLUMNS_NAME !="undefined")
			document.key.columns_name.value =Table.clickRow(document.all.tabMain).COLUMNS_NAME;
		 else
			document.key.columns_name.value ="";

		 document.key.name_tmp.disabled =true;
		 document.key.operate.value="1";
         document.key.del.disabled=false;
		}
		else
		{
			document.key.key_id.value ='';
			document.key.table_ename.value ='';
			document.key.name_tmp.value='';
			document.key.columns_name.value ='';
			document.key.name_tmp.disabled =false;
			document.key.operate.value="0";
			document.key.del.disabled=true;
		}
	} catch(e){}
}
function submitMe(form)
{
	if(checkForm(form))
	{
		if(document.key.name_tmp.value =="PK_")
		{
			$E.message("��ָ��Ӣ�Ĺؼ�����������Ϊ'PK_'��");
			document.key.name_tmp.focus();
			return;
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
function selTable(k)
{
	message("ѡ���" +k);
}
</script>