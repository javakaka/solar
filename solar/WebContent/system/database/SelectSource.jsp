<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<$:NE param="source" value="">
<$:A service="saveTableStyle" dynamic="false">
	<$:P name="table_ename"/>
	<$:P name="field_ename"/>
	<$:P name="source_type"/>
	<$:P name="open_page_url"/>
	<$:P name="source"/>
	<$:P name="paras"/>
	<$:P name="operate" value="2"/>
</$:A>
<$:M dtype="1"/>
</$:NE>
<%
String sSourceId =ServletUtil.get(request,"source_type") ==null?"1":ServletUtil.get(request,"source_type");
if(sSourceId.equals(""))
   sSourceId ="1";
%>
<script>
var source_type ='<%=sSourceId%>';
var db_source_type ="";
var db_source ="";
var open_page_url ="";
</script>
<TITLE>��ѡ���Ӧ���ֶκ���</TITLE>
<base target="_self">
<BODY>
<table border=0 cellpadding=0 cellspacing=0 width=100%><tr>
   <td align=center>��ѡ��
   <$:A service="getFieldInfo" dynamic="true">
      <$:P name="table_ename"/>
      <$:P name="field_ename"/>
   </$:A>
   <$:M dtype="1"/>
   <$:T var="field" name="FieldInfo">
      <font color=red><b><$:C item="field.FIELD_CNAME"/></b></font>
      <script>
         db_source_type ='<$:C item="field.SOURCE_TYPE"/>';
         open_page_url ='<$:C item="field.OPEN_PAGE_URL"/>';
         <%if(! sSourceId.equals("4")){%>
            db_source ='<$:C item="field.SOURCE" filter="true"/>';
         <%}%>
      </script>
   </$:T>
����Ӧ���ֶκ���</td></tr></table>

<table width=100% border=1 cellspacing=0 cellpadding=0>
 <tr>
  <td valign=top width=120 nowrap>
   <input type="radio" class="radio" name='source_type_tmp' value='1'  id='source1' onClick="onSelect(1)"><label for='source1' style="cursor:hand">��̬����</label><br>
   <input type="radio" class="radio" name='source_type_tmp' value='2'  id='source2' onClick="onSelect(2)"><label for='source2' style="cursor:hand">����</label><br>
   <input type="radio" class="radio" name='source_type_tmp' value='3'  id='source3' onClick="onSelect(3)"><label for='source3' style="cursor:hand">��̬����</label><br>
   <input type="radio" class="radio" name='source_type_tmp' value='4'  id='source4' onClick="onSelect(4)"><label for='source4' style="cursor:hand">ö������</label><br>
   <input type="radio" class="radio" name='source_type_tmp' value='5'  id='source5' onClick="onSelect(5)"><label for='source5' style="cursor:hand">��ҳ������</label><br>
	</td>
   <td valign=top>
      <%
      if(sSourceId.equals("1"))
      {
      %>
         ѡ��ϵͳ��̬����<br>
         <$:A service="getSysDictoryTree" dynamic="false"/>
         <$:M dtype="1"/>
         <$:L name="source_tmp" rs="DictoryItem" valueField="FIELD_NAME" value="1" 	textField="ITEM_TITLE" props="size=10"/>
      <%  
      }
      else if(sSourceId.equals("2"))
      {
      %>
         �˷��񷵻ص����ݼ����ƹ̶�ΪListValue�������д��������ֶ�TEXT��VALUE<br>
         <$:A service="getFmServices" dynamic="true">
            <$:P name="service_name" default="" from="request"/>
            <$:P name="service_desc" default="" from="request"/>
         </$:A>
         <$:M dtype="1"/>
         <$:L name="source_tmp" rs="Services" valueField="SERVICE_NAME" value="1" 	textField="SERVICE_NAME" props="size=8" firstText="��ѡ��..."/></td><td valign=top>�����б�����֮��";"������:<br>
   <$:T var="field" name="FieldInfo" pagesize="1">
      <TEXTAREA NAME="paras_tmp" ROWS="10" COLS="20"><$:C item="field.PARAS"/></TEXTAREA>
   </$:T>
      <%  
      }
      else if(sSourceId.equals("3"))
      {
      %>
         �˷��񷵻ص����ݼ����ƹ̶�ΪListValue�������д��������ֶ�TEXT��VALUE<br>
      <$:A service="getFmDynaServices" dynamic="true">
         <$:P name="action_id" default="" from="request"/>
         <$:P name="action_desc" default="" from="request"/>
      </$:A>
         <$:M dtype="1"/>
         <$:L name="source_tmp" rs="DynaServics" valueField="ACTION_ID" value="1" 	textField="ACTION_ID" props="size=8" firstText="��ѡ��..."/></td><td valign=top>�����б�����֮��";"������:<br>   <$:T var="field" name="FieldInfo" pagesize="1">
      <TEXTAREA NAME="paras_tmp" ROWS="10" COLS="20"><$:C item="field.PARAS"/></TEXTAREA>
   </$:T>

      <%  
      
      }
      else if(sSourceId.equals("4"))
      {
      %>
         ����ѡ���������֮��";"����[Example:10=�й�;20=����;30=�¹�]<br>
      <$:T var="field" name="FieldInfo" pagesize="1">
         <TEXTAREA NAME="source_tmp" ROWS="10" COLS="40"><$:C item="field.SOURCE"/></TEXTAREA>
      </$:T>
      <%
      }
      else if(sSourceId.equals("5"))
      {
      %>
         ����ҳ������.($WEB_PATH$:������վ����·��;$STAFF-NO$:��½�˱��;$SITE-NO$:��½�˲��ű��;$POSI-NO$:��½�˸�λ���)<br>
         <input type=text NAME="open_page_url_tmp" size="40"><br>
         ����ת�����񣨶�̬����ǰ�ԡ�D-�����������ϣ�<br><input type=text NAME="source_tmp" size="40">
      <%
      }
      %>  
	</td>
 </tr>
</table>
<div align=center>
   <input type="button" value="������Ԥ��"   onClick="onSeeData()"><input type="button" value=<$:I item="html.button.save"/>   onClick="onSelect2()"><input type="reset" value=<$:I item="html.button.close"/> onClick="window.close()"  > 
&nbsp;
</div>
<script language="javascript">
<!--
   for(i=0; i<document.all.source_type_tmp.length; i++)
   {
      if(document.all.source_type_tmp[i].value ==source_type)
      {
         document.all.source_type_tmp[i].checked =true;
         break;
      }
   }
   if(db_source_type !=source_type && ( document.all.paras_tmp !=null ))
   {
      document.all.source_tmp.value ="";
      document.all.paras_tmp.value ="";
   }
   if(db_source_type ==source_type && db_source_type !=4)
   {
      document.all.source_tmp.value =db_source;
   }
   if(document.all.open_page_url_tmp !=null)
	  document.all.open_page_url_tmp.value =open_page_url;
//-->
</script>
<form name="tmp">
   <input type=hidden name="source_type">
</form>
<form name="tmp2" action="SelectSource.jsp">
   <input type=hidden name="source_type">
   <input type=hidden name="open_page_url">
   <input type=hidden name="source">
   <input type=hidden name="paras">
   <input type=hidden name="table_ename" value='<$:W name="table_ename" from="request" default=""/>'>
   <input type=hidden name="field_ename" value='<$:W name="field_ename" from="request" default=""/>'>
</form>
</BODY>
</HTML>

<script>
function onSeeData()
{
   document.tmp2.source_type.value =source_type;
   document.tmp2.source.value =document.all.source_tmp.value;
   document.tmp2.action ="Data.jsp";
   document.tmp2.submit();
}
function onSelect(handle)
{
   if(document.tmp2.table_ename.value ==""
      || document.tmp2.field_ename.value =="")
   {
      alert("���ݲ��������ܽ��б���");
      window.close();
   }
   document.tmp2.source_type.value =handle;
   document.tmp2.submit();
}
function onSelect2()
{
   if(document.tmp2.table_ename.value ==""
      || document.tmp2.field_ename.value =="")
   {
      alert("���ݲ��������ܽ��б���");
      window.close();
   }
   document.tmp2.source_type.value =source_type;
   document.tmp2.source.value =document.all.source_tmp.value;
   if(document.all.open_page_url_tmp !=null)
	   document.tmp2.open_page_url.value =document.all.open_page_url_tmp.value;
   if(source_type ==2 || source_type ==3)
      document.tmp2.paras.value =document.all.paras_tmp.value;
   document.tmp2.submit();
}
</script>
