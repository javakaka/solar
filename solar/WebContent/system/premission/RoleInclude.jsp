<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<form name="grantrole">
<$:G title="role.list" from="4">
<div align=right><span id='spanTip'></span><input type="button" value=<$:I item="html.grantrole"/> onClick="grantRole(this.form)"><$:Shutcut shutcut="角色授权" url="/system/premission/GrantRole.jsp" icon="/images/icons/103.gif">快捷进入</$:Shutcut></div>
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
   if(use_role_names =='') use_role_names="不授任何权限";
   if(assign_role_names =='') assign_role_names="不授任何权限";
	var sPosiName =$E.getParameter("posi_name");
	var sStaffName =$E.getParameter("staff_name");
   if(sPosiName !='')
   {
      if(confirm("对[ "+sPosiName+" ]岗位进行授权,授权角色如下:\n可使用角色:\n    "+use_role_names+"\n可授权角色:\n    "+assign_role_names))
		var s=new Server("grantSystemPromission");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("保存成功！");
			}
		);
      // form.submit();
   }
   else if(sStaffName !='')
   {
      if(confirm("对[ "+sStaffName+" ] 人员进行授权,授权角色如下:\n使用角色:\n    "+use_role_names+"\n可授权角色:\n    "+assign_role_names))
         //form.submit();
		var s=new Server("grantSystemPromission");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("保存成功！");
			}
		);
   }
   else
      $E.message("没有选择岗位或员工,不能进行授权操作");
}
if($E.getParameter("posi_name") !="")
	spanTip.innerHTML ="<b>对岗位<font color=red>"+$E.getParameter("posi_name")+"</font>进行授权</b>";
else if($E.getParameter("staff_name") !="")
	spanTip.innerHTML ="<b>对人员<font color=red>"+$E.getParameter("staff_name")+"</font>进行授权</b>";
</script>