<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>

<script>

function onDel()
{
	if(document.editerror.error_seq.value =="")
	{
		$E.message("û��ѡ����Ч�ļ�¼��");
	}else{
		if(confirm("ע�⣬�˲�����ɾ���ô���"))
		{
			document.editerror.operate.value="1";
			var s=new Server("dropError");
			s.setFormData(document.all.editerror);
			s.send(s, false, function(){
				alert("����ɹ���");
				$E.reload();
				}
			);
		}
	}
}

function row()
{
	//try
	{
		Table.click();
		var error_seq =Table.clickRow(document.all.tabMain).ERROR_ID;
		if(error_seq !="" && typeof error_seq !='undefined')
		{   
			document.editerror.error_seq.value =error_seq;
			document.editerror.error_log.value =Table.clickRow(document.all.tabMain).ERROR_LOG;
		}
		else
		{
			document.all.editerror.reset();
			
		}
	}
	//catch(e){}
}
function opens()
{
   if(document.all.error_seq.value =='')
   {
      $E.message("��ѡ��һ��������Ϣ");
   }
   else
      window.open('<%=GlobalUtil._WEB_PATH%>/system/log/Log.jsp?error_id='+document.all.error_seq.value, true, 600, 400);
}



function onDropAllErrors()
{
	if(confirm("ע�⣬�˲�����ɾ�����д���"))
	{
		document.editerror.operate.value="2";
			var s=new Server("dropError");
			s.setFormData(document.all.editerror);
			s.send(s, false, function(){
				alert("����ɹ���");
				$E.reload();
				}
			);	
	}
}


</script>
<$:G title="������־�б�">
<table  id="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="row()" onDblClick="opens()">	
	<tr class="tr_c">
		<td class="td_c" width=1% nowrap>�������</td>		
		<td class="td_c" width=1% nowrap>�����</td>
        <td class="td_c" width=1% nowrap>����ʱ��</td>
		<td class="td_c" width=1% nowrap>�����ն�</td>
		<td class="td_c" width=1% nowrap>����λ��</td>
		<td class="td_c" width=1% nowrap>������Ϣ</td>
			    
	</tr>

	<$:A service="getFmErrorLogs" dynamic="true" pagesize="15"/>
	<$:M dtype="1"/>
	<$:T var="services" name="Logs" fieldNum="6" pagesize="15" message="û�д�����־">
	  <tr class="tr_c" <$:R item="services.ERROR_ID,ERROR_CODE,ERROR_LOG"/>>
		<td nowrap>&nbsp;<$:C item="services.ERROR_ID"/></td>
		<td nowrap>&nbsp;<$:C item="services.ERROR_CODE"/></td>
		<td nowrap>&nbsp;<$:C item="services.OCCUR_TIME"/></td>
		<td nowrap>&nbsp;<$:C item="services.TERMINAL"/></td>
		<td nowrap>&nbsp;<$:C item="services.ERROR_POS"/></td>
		<td nowrap>&nbsp;<$:C item="services.ERROR_LOG" sub="40"/></td>
	  </tr>
	</$:T>
	<tr class="tr_c"> 
	<td colspan="6" height="1%" align="right">  
		<form name="formpage">
			<$:Page pagesize="15"/>
		</form>
	</td>
	</tr>
</table>
</$:G>
<div align=right>
<input type=button value='ɾ������'  onClick ="onDel()"   ><input type=button value='��մ���'  onClick ="onDropAllErrors()" ><input type=button value='��ϸ������Ϣ'  onClick ="opens()" >
<form name="editerror">
	<input type=hidden name="error_seq"></div>
	<input type=hidden name="operate"></div>
	<input name="error_log" type="hidden">
</form>




	
