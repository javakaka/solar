<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
function onLoadParam()
{
	$S("used_view", $E.getParameter("used_view"));
	$S("disp_view", $E.getParameter("disp_view"));
	$S("disp_order", $E.getParameter("disp_order"));
	$S("notes", $E.getParameter("notes"));
}
//-->
</SCRIPT>
<body onLoad="onLoadParam()">
<input type="hidden" name="Action_Flag" value="2">
<table width="100%" border="0"  bordercolor="3B87D1" bordercolorlight="#FFFFFF" cellpadding="0" cellspacing="0">
   <tr> 
      <td valign="top"> 
        <table width="100%" cellpadding="2" cellspacing="1" class="table_c">
          <tr class="tr_c"> 
            <td width="1%" nowrap>静态参数字段名</td>
          <td><$:W name="field_ename" from="request" desc="字段名" warn="true" alerttype="1" window="Dialog"/></td>
        </tr>
         <tr class="tr_c"> 
            <td nowrap>静态参数字段使用值</td>
          <td><input name="used_view" type="text" style="width: 100%;" datatype="string" desc="静态参数字段使用值" max="40"></td>
        </tr>
        <tr class="tr_c"> 
            <td nowrap>静态参数显示值</td>
          <td><input name="disp_view" type="text" style="width: 100%;" datatype="string" desc="静态参数显示值</" max="40"></td>
        </tr>
        <tr class="tr_c">
            <td nowrap>显示顺序</td>
          <td><input name="disp_order" type="text" style="width: 100%;" datatype="number" desc="显示顺序" maxlength="100"></td>
        </tr>
        <tr class="tr_c">
            <td nowrap>描&nbsp;&nbsp;&nbsp;&nbsp;述</td>
          <td><input name="notes" type="text" style="width: 100%;" max="200"></td>
        </tr>
      </table>
      </td>
  </tr>
  <tr align="center">
      <td height="1" colspan="6"> 
      <input type="button" onClick=save('<$:W name="type" from="request" default="-1"/>') value=<$:I item="html.button.save"/> ><input type="button" value=<$:I item="html.button.close"/>  onclick="window.close()">
   </td>
  </tr>
</table>
</body>
<script>
function save(type)
{
   var src ='SaveParams.jsp';
   var table_ename='<$:W name="table_ename" from="request"/>';
   var field_ename='<$:W name="field_ename" from="request"/>';
   var used_view  =document.all.used_view.value;
	if(type =='1' || type=='0')
   {
      if(!checkForm(document))
         return;
      var disp_order =document.all.disp_order.value;
      var disp_view  =document.all.disp_view.value
      var note       =document.all.notes.value;
			var s=new Server("editSysDictory");
			s.setParam("table_ename", table_ename);
			s.setParam("field_ename", field_ename);
			s.setParam("used_view", used_view);
			s.setParam("disp_order", disp_order);
			s.setParam("disp_view", disp_view);
			s.setParam("note", note);
			s.setParam("operate", type);
			s.send(s, false, function(){
				alert("保存成功！");
			}
			);
   }
}
</script>

