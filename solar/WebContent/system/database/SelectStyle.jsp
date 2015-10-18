<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<TITLE>请选择对应的字段函数</TITLE>
<base target="_self">
<script>
var style_id ='';
</script>
<BODY>
<center>
<table border=0 cellpadding=0 cellspacing=0><tr>
   <td><b>请选择 <font color='#FF0000'>

   <$:A service="getFieldInfo" dynamic="true">
      <$:P name="table_ename"/>
      <$:P name="field_ename"/>
   </$:A>
   <$:M dtype="1"/>
   <$:T var="field" name="FieldInfo">
      <$:C item="field.FIELD_CNAME"/>
      <script>
         style_id ='<$:C item="field.STYLE_ID"/>';
      </script>
   </$:T>

</font> 所对应的字段函数</b></td></tr></table>
<table width=100% border=1 cellspacing=0 cellpadding=0 height=220>
 <tr>
  <td valign=top width=200 nowrap>
      <$:A service="getFieldStyle" dynamic="true">
   		<$:P name="style_id" default="005"/>
      </$:A>
      <$:M dtype="1"/>
      <$:T var="style" name="FieldStyle" fieldNum="4">
         <input type="radio" class="radio" name='fieldfunc' value='<$:C item="style.STYLE_ID"/>'  id='fieldfunc<$:C item="style.ROWID"/>' onClick="onSelect(this)"><label for='fieldfunc<$:C item="style.ROWID"/>' style="cursor:hand"><$:C item="style.STYLE_TITLE"/></label><br>
      </$:T>
	</td>
  <td valign=top>
      <$:T var="style" name="FieldSubStyle" fieldNum="4">
         <input type="radio" class="radio" name='fieldsubfunc' value='<$:C item="style.STYLE_ID"/>,<$:C item="style.STYLE_TITLE"/>' id='fieldfunc9<$:C item="style.ROWID"/>'><label for='fieldfunc9<$:C item="style.ROWID"/>' style="cursor:hand"><$:C item="style.STYLE_TITLE"/></label><br>
      </$:T>
	</td>
 </tr>
</table>
<div align=center>
   <input type="button" value=<$:I item="html.button.save"/>   onClick="onSelect2()"><input type="reset" value=<$:I item="html.button.close"/> onClick="window.close()"  ></div>
<script language="javascript">
<!--
   stytleId ='<$:W name="style_id" from="request" default="005"/>';
   for(i=0; i<document.all.fieldfunc.length; i++)
   {
      if(document.all.fieldfunc[i].value ==stytleId)
      {
         document.all.fieldfunc[i].checked =true;
         break;
      }
   }
   if(style_id.length >0)
   {
      for(i=0; i<document.all.fieldfunc.length; i++)
      {
         if(document.all.fieldfunc[i].value ==style_id.substring(0,3))
         {
            document.all.fieldfunc[i].checked =true;
            break;
         }
      }
      try
      {
         for(i=0; i<document.all.fieldsubfunc.length; i++)
         {
            fieldsubfuncids =document.all.fieldsubfunc[i].value.split(",");
            if(fieldsubfuncids[0] ==style_id)
            {
               document.all.fieldsubfunc[i].checked =true;
               break;
            }
         }
      }catch(e){}
   }
//-->
</script>
<form name="tmp">
   <input type=hidden name="style_id">
</form>
</BODY>
</HTML>

<script>
function onSelect(handle)
{
   document.tmp.style_id.value =handle.value;
   document.tmp.submit();
}
function onSelect2()
{
   if(typeof document.all.fieldsubfunc.length=='undefined')
   {
      if(document.all.fieldsubfunc.checked)
      {
         window.returnValue =document.all.fieldsubfunc.value;
         window.close();
      }
   }
   try
   {
      for(i=0; i<document.all.fieldsubfunc.length; i++)
      {
         if(document.all.fieldsubfunc[i].checked)
         {
            window.returnValue =document.all.fieldsubfunc[i].value;
            window.close();
         }   
      }
   }
   catch(e){};
}
</script>
