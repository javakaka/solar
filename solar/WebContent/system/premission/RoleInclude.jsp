<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<form name="grantrole">
<$:G title="role.list" from="4">
<div align=right><span id='spanTip'></span><input type="button" value=<$:I item="html.grantrole"/> onClick="grantRole(this.form)"><$:Shutcut shutcut="��ɫ��Ȩ" url="/system/premission/GrantRole.jsp" icon="/images/icons/103.gif">��ݽ���</$:Shutcut></div>
<DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%;HEIGHT:420"> 
 <table id="tabMain" name="tabMain" width="100%" cellpadding="2" cellspacing="1" class="table_c">	
    <$:A service="getSystemPromission" dynamic="false">
		<$:P name="posi_no" from="request"/>
		<$:P name="staff_no" from="request"/>
	</$:A>
    <$:M dtype="1"/>
    <tr class="tr_c">
       <td class="td_c" valign=middle width=1% nowrap><input type=checkbox class="radio" onClick="if(this.checked) checkAll('use_state', true); else checkAll('use_state', false)"><$:I item="System.premission.userole"/></td>
       <td class="td_c" valign=middle width=1% nowrap><input type=checkbox class="radio" onClick="if(this.checked) checkAll('assign_state', true); else checkAll('assign_state', false)"><$:I item="System.premission.assignrole"/></td>
       <!-- <td class="td_c" valign=middle width=1% nowrap><$:I item="sm_role.role_id"/></td> -->
       <td class="td_c" valign=middle width=1% nowrap><$:I item="sm_role.role_name"/></td>
       <td class="td_c" valign=middle width=1% nowrap><$:I item="sm_role.role_begintime"/></td>
       <td class="td_c" valign=middle width=1% nowrap><$:I item="sm_role.role_endtime"/></td>
       <td class="td_c" valign=middle width=1% nowrap><$:I item="sm_role.role_desc"/></td>
    </tr>
    <$:T var="role" name="ROLE_LIST">
      <tr class="tr_c">
       <td nowrap><input type=checkbox name='use_state' class="radio" value='<$:C item="role.ROLE_ID"/>,<$:C item="role.ROLE_NAME"/>' <$:C item="role.USE_STATE" replace="[1,checked][0,]"/>></td>
       <td nowrap><input type=checkbox class="radio" name='assign_state' value='<$:C item="role.ROLE_ID"/>,<$:C item="role.ROLE_NAME"/>' <$:C item="role.ASSIGN_STATE" replace="[1,checked][0,]"/>></td>
       <!-- <td nowrap><$:C item="role.ROLE_ID"/>&nbsp</td> -->
       <td nowrap><$:C item="role.ROLE_NAME"/>&nbsp;</td>
       <td nowrap><$:C item="role.ROLE_BEGINTIME"/>&nbsp;</td>
       <td nowrap><$:C item="role.ROLE_ENDTIME"/>&nbsp;</td>
       <td nowrap><$:C item="role.ROLE_DESC" brsize="15"/>&nbsp;</td>
      </tr>
    </$:T>
 </table>
 </DIV>
</$:G>
   <input type=hidden name="posi_no" value='<$:W name="posi_no" from="request"/>'>
   <input type=hidden name="posi_name" value='<$:W name="posi_name" from="request"/>'>
   <input type=hidden name="staff_no" value='<$:W name="staff_no" from="request"/>'>
   <input type=hidden name="use_role_ids">
   <input type=hidden name="assign_role_ids">
   <input type=hidden name="operate" value="0">
</form>
<script>
function grantRole(form)
{
   var roleno_name ='';
   var use_role_ids ='';
   var use_role_names ='';
   var assign_role_ids ='';
   var assign_role_names ='';
   var handle =document.all.tags('input');
   for(i=0; i<handle.length; i++)
   {  
      if(handle[i].checked)
      {
         if(handle[i].name =="use_state")
         {
            if(use_role_ids !='')   use_role_ids +=',';
            roleno_name =handle[i].value;
            var node =roleno_name.split(",");
            use_role_ids +=node[0];
            use_role_names +="[ "+node[1]+" ]";
         }
         else if(handle[i].name =="assign_state")
         {
            if(assign_role_ids !='')   assign_role_ids +=',';
            roleno_name =handle[i].value;
            var node =roleno_name.split(",");
            assign_role_ids +=node[0];
            assign_role_names +="[ "+node[1]+" ]";
         }
      }
   }
   document.all.use_role_ids.value = use_role_ids;
   document.all.assign_role_ids.value =assign_role_ids;
   if(use_role_names =='') use_role_names="�����κ�Ȩ��";
   if(assign_role_names =='') assign_role_names="�����κ�Ȩ��";
	var sPosiName =$E.getParameter("posi_name");
	var sStaffName =$E.getParameter("staff_name");
   if(sPosiName !='')
   {
      if(confirm("��[ "+sPosiName+" ]��λ������Ȩ,��Ȩ��ɫ����:\n��ʹ�ý�ɫ:\n    "+use_role_names+"\n����Ȩ��ɫ:\n    "+assign_role_names))
		var s=new Server("grantSystemPromission");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("����ɹ���");
			}
		);
      // form.submit();
   }
   else if(sStaffName !='')
   {
      if(confirm("��[ "+sStaffName+" ] ��Ա������Ȩ,��Ȩ��ɫ����:\nʹ�ý�ɫ:\n    "+use_role_names+"\n����Ȩ��ɫ:\n    "+assign_role_names))
         //form.submit();
		var s=new Server("grantSystemPromission");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("����ɹ���");
			}
		);
   }
   else
      $E.message("û��ѡ���λ��Ա��,���ܽ�����Ȩ����");
}
if($E.getParameter("posi_name") !="")
	spanTip.innerHTML ="<b>�Ը�λ<font color=red>"+$E.getParameter("posi_name")+"</font>������Ȩ</b>";
else if($E.getParameter("staff_name") !="")
	spanTip.innerHTML ="<b>����Ա<font color=red>"+$E.getParameter("staff_name")+"</font>������Ȩ</b>";
</script>