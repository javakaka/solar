<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="JavaScript">
function onChangePassword(form){
	if(! checkForm(form))
		return false;
	if(form.password.value!=form.repassword.value){
		$E.message("口令不一致");
		form.password.focus();
		return false;
		}
	if(form.old_pword.value==""||form.old_pword.value==null){
		$E.message("请输入原密码！");
		form.text.focus();
		return false;
	}	
	if(form.password.value==""||form.password.value==null){
		$E.message("口令不能为空！");
		form.password.focus();
		return false;
	}
	var s=new Server("changeStaffPassword");
	s.setParam("old_pword", $V("old_pword"));
	s.setParam("password", $V("password"));
	s.setParam("repassword", $V("repassword"));
	s.send(s, false, function(){
		$E.message("密码修改成功，请妥善管理好您的新密码！");
	}
	);
}
</script>
</head>
<body>
<form>
<$:G title="修改用户密码">
  <table id="tabMain" name="tabMain" width=100% cellpadding="2" cellspacing="1" class="table_c">
    <tr class="tr_c"> 
      <td  class="td_c" width="30%" nowrap align="right">原密码</td>
      <td><input name="old_pword" type="password" style="width:100%"></td>
    </tr>
    <tr class="tr_c"> 
      <td class="td_c" align="right">新密码</td>
      <td><input name="password" type="password" maxlength="16"  style="width:100%"></td>
    </tr>
    <tr class="tr_c"> 
      <td  class="td_c" align="right">确&nbsp;&nbsp;认</td>
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
