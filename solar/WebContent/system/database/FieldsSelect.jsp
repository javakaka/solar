<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<SCRIPT TYPE="text/javascript" SRC="js/moveloc.js"></SCRIPT>

<body>
<form name=frmjob method="POST">
<$:G title="选择字段">
<table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
  <tr bgcolor=#E8E8E8>
    <td width="100%">*选择字段</td>
  </tr>
	<tr bgcolor=#FFFFFF>
		<td align=center>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="45%" valign="top">
						 全部字段（按住Ctrl键点击可多选）
					</td>
					<td width=10%>&nbsp;
					</td>
					<td width="45%" valign="top">
						字段<FONT COLOR="red">*</FONT>
					</td>
				</tr>
				<tr>
					<td>
                  <$:A service="getTableFields" dynamic="true">
                     <$:P name="table_ename" default='<$:W name="table_ename" from="request"/>'/>
                  </$:A>
                  <$:M dtype="1"/>
                  <$:L name="source" rs="Fields" valueField="FIELD_ENAME" textField="FIELD_CNAME" props="size='13' multiple style='width:100%; border:1px #E8E8E8 solid' ondblclick='ondbclk_add(document.frmjob.source,document.frmjob.target);'"/>
					</td>
					<td align=center>
						<input type="button" class="button" name="cmdadd" value="> " onclick="addloc(document.frmjob.source,document.frmjob.target);"><br>
						<input type="button" class="button" name="cmdaddall"value=">>" onclick="onaddall(document.frmjob.source,document.frmjob.target);"><br><br>
						<input type="button" class="button" name="cmddel" value="< " onclick="delloc(document.frmjob.source,document.frmjob.target);"><br>
						<input type="button" class="button" value="<<" onclick="ondelall();">
					</td>
					<td valign=top>
                  <$:A service="getTableField" dynamic="true"/>
                  <$:M dtype="1"/>
                  <$:L name="target" rs="TableField" valueField="FIELD_ENAME" textField="FIELD_ENAME" props="size='13' multiple style='multiple style='width:100%' ondblclick='ondbclk_del(document.frmjob.source,document.frmjob.target);'"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</$:G>
<div align=center>
   <input type="button" value=<$:I item="html.button.save"/>   onClick="onSubmit(this.form)"><input type="button" value="关闭(C)"   onClick="window.close();" accessKey="C"></div>
<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request" default=""/>'>
</form>
</body>
</html>
<script>
function onSubmit(form)
{
   if(checkForm(form))
   {
      if(form.target.length ==0)
      {
         $E.message("请选择字段");
         return false;
      }
      var target ='';
      for(i=0; i<form.target.length-1; i++)
      {
         target +=form.target.options[i].value+",";
      }
      target +=form.target.options[form.target.length-1].value;

	  parent.window.returnValue =target;
	  parent.window.close();
   }
}
function onaddall(locs, mylocs)
{
	for(var i=0;i<document.all.source.options.length;i++)
	{
		var opt = locs.options[i];
		mylocs.options[mylocs.options.length] = new Option(opt.text, opt.value);
	}
}
function ondelall()
{
	for(var i=document.all.target.options.length-1;i>=0;i--)
		document.all.target.remove(i);
}
</script>