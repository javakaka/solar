<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<logic:present parameter="source">
   <logic:notEqual parameter="source" value="">
      <$:A service="saveTableStyle" dynamic="false">
         <$:P name="table_ename"/>
         <$:P name="field_ename"/>
         <$:P name="source"/>
         <$:P name="operate" value="3"/>
      </$:A>
      <$:M dtype="1"/>
		<script>window.close()</script>
   </logic:notEqual>
</logic:present>
<base target="_self">
<body onLoad="init()">
<$:G title="office套用模板(可以多选)">
<table cellpadding="2" cellspacing="1" class="table_c" width="100%">
<tr class="tr_c">
<td class="td_c" align=center width=30%>套<br>用<br>模<br>板</td>
<td>
<$:A service="getOfficeTemplate" dynamic="true">
	<$:P name="filetype" from="request"/>
</$:A>
<$:M dtype="1"/> 
<$:L name="template" rs="Template" valueField="TEMPLATEID" textField="FILENAME,FILETYPE" firstText="请选择..." props=" size=12 multiple style='width:100%'"/>
</td></tr>
</table>
</$:G>
<div align=center><input type="button" value=<$:I item="html.button.save"/>   onClick="onSelect2()"><input type="reset" value=<$:I item="html.button.close"/> onClick="window.close()"  > 
</div>
<form name="tmp2" action="SelectOfficeTemplate.jsp">
   <input type=hidden name="source">
   <input type=hidden name="table_ename" value='<$:W name="table_ename" from="request" default=""/>'>
   <input type=hidden name="field_ename" value='<$:W name="field_ename" from="request" default=""/>'>
</form>
</form>
<script>
function onSelect2()
{
   if(document.tmp2.table_ename.value ==""
      || document.tmp2.field_ename.value =="")
   {
      alert("数据不完整不能进行保存");
      window.close();
   }
	var source ="";
	for(i=0; i<document.all.template.length; i++)
	{
		if(document.all.template[i].selected)
			if(source =="")
				source =document.all.template[i].value;
			else
				source +=","+document.all.template[i].value;
	}
	document.tmp2.source.value =source;
   document.tmp2.submit();
}
</script>
<$:A service="getTableFieldSource" dynamic="true">
	<$:P name="table_ename" from="request"/>
	<$:P name="field_ename" from="request"/>
</$:A>
<$:M dtype="1"/> 
<script>
function init()
{
	<$:T var="Source" name="Source">
	var source ='<$:C item="Source.SOURCE"/>';
	</$:T>
	var sources =source.split(",");
	document.all.template[0].selected =false;
	for(i=0; i<document.all.template.length; i++)
	{
		for(j=0; j<sources.length; j++)
			if(document.all.template[i].value ==sources[j])
				document.all.template[i].selected =true;
	}
}
</script>