<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="JavaScript">
function onChangePassword(form){
	if(! checkForm(form))
		return false;
	if(form.password.value!=form.repassword.value){
		$E.message("���һ��");
		form.password.focus();
		return false;
		}
	if(form.old_pword.value==""||form.old_pword.value==null){
		$E.message("������ԭ���룡");
		form.text.focus();
		return false;
	}	
	if(form.password.value==""||form.password.value==null){
		$E.message("�����Ϊ�գ�");
		form.password.focus();
		return false;
	}
	var s=new Server("changeStaffPassword");
	s.setParam("old_pword", $V("old_pword"));
	s.setParam("password", $V("password"));
	s.setParam("repassword", $V("repassword"));
	s.send(s, false, function(){
		$E.message("�����޸ĳɹ��������ƹ�������������룡");
	}
	);
}
</script>
</head>
<body>
<form>
<$:G title="�޸��û�����">
  <table id="tabMain" name="tabMain" width=100% cellpadding="2" cellspacing="1" class="table_c">
    <tr class="tr_c"> 
      <td  class="td_c" width="30%" nowrap align="right">ԭ����</td>
      <td><input name="old_pword" type="password" style="width:100%"></td>
    </tr>
    <tr class="tr_c"> 
      <td class="td_c" align="right">������</td>
      <td><input name="password" type="password" maxlength="16"  style="width:100%"></td>
    </tr>
    <tr class="tr_c"> 
      <td  class="td_c" align="right">ȷ&nbsp;&nbsp;��</td>
      <td><input name="repassword" type="password" maxlength="16"  style="width:100%"></td>
    </tr>
    <tr class="tr_c">
		<td colspan=2>&nbsp;</td>
	 </tr>
    <tr class="tr_c"> 
      <td align="right" colspan=2>
         <input type="button" onClick="onChangePassword(this.form)" value=<$:I item="html.button.save"/> ><input type="button" value=<$:I item="html.button.close"/>  onClick="window.close()">
      </td>
    </tr>
  </table>
</$:G>
</form>
</body>
</html>
