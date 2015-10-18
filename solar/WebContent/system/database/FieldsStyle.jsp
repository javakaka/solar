<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<$:G title="设置字段的显示方式">
<form method="POST" name=aa>
   <DIV onscroll="setRowFixed()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 400px"> 
  <table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" cellpadding="3" border="1" width="100%" 	bordercolor="white" bgcolor="#eeeeee">
    <tr class="tr_title">
      <td class="td_c">字段名</td>
      <td class="td_c" width=90%>显示方式</td>
      <td class="td_c">修改</td>
    </tr>
   <$:A service="getTableStyle" dynamic="true">
      <$:P name="table_ename" default=""/>
   </$:A>
   <$:M dtype="1"/>
   <$:T var="table" name="TableStyle">
      <tr>
         <td align=center nowrap width=20%><$:C item="table.FIELD_CNAME"/>.<$:C item="table.FIELD_ENAME"/></td>
         <td align=left nowrap>
         <input type=text size=15 name="txStyle" readOnly=true value='<$:C item="table.STYLE_TITLE"/>'>
         <input type=hidden name="source_type" value='<$:C item="table.SOURCE_TYPE"/>'>
         <input type=hidden name="idStyle" value='<$:C item="table.STYLE_ID"/>'>
         <input type=hidden name="field_ename" value='<$:C item="table.FIELD_ENAME"/>'>

         <input type=button value="选择" name="btSelect" onclick=onSelectStyle(<$:C item="table.ROWID"/>,'<$:C item="table.FIELD_ENAME"/>','<$:C item="table.STYLE_ID"/>')><input type=button name="btSource" value="数据源..." style="display:none" onclick=onSelectSource(<$:C item="table.ROWID"/>,'<$:C item="table.FIELD_ENAME"/>')><input type=button name="btDefineNo" value="自定义编号" style="display:none" onclick=onDefineNo(<$:C item="table.ROWID"/>,'<$:C item="table.FIELD_ENAME"/>')><input type=button name="btWordTemplate" value="word模板" style="display:none" onclick=onSelectOfficeTemplate(<$:C item="table.ROWID"/>,'<$:C item="table.FIELD_ENAME"/>','.doc')><input type=button name="btExcelTemplate" value="Excel模板" style="display:none" onclick=onSelectOfficeTemplate(<$:C item="table.ROWID"/>,'<$:C item="table.FIELD_ENAME"/>','.xls')>
         </td>
         <td><input type=button value="修改" onClick="onUpdate(<$:C item="table.ROWID"/>)"></td>
      </tr>
   </$:T>
  </table>
   </DIV>
   <input name="table_ename" type=hidden value='<$:W name="table_ename" from="request" default=""/>'>
</form>
</$:G>
</html>
<script>
for(i=0; i<document.all.idStyle.length; i++)
{
   if(document.all.idStyle[i].value.substring(0,3) =="005")
      document.all.btSource[i].style.display ="inline";
	else if(document.all.idStyle[i].value =="002007")
	{
      document.all.btWordTemplate[i].style.display ="inline";
	}
	else if(document.all.idStyle[i].value =="002008")
	{
      document.all.btExcelTemplate[i].style.display ="inline";
	}
}
function onDefineNo(row,field_ename)
{
	$E.runOpen('<%=GlobalUtil._WEB_PATH%>/system/database/DefineNo.jsp?table_ename='+document.all.table_ename.value+"&field_ename="+field_ename, false, 500,300);  
}
function onSelectStyle(row,field_ename,style_id)
{
	var features ="dialogHeight = 300px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
var selectStyle =window.showModalDialog('<%=GlobalUtil._WEB_PATH%>/system/database/SelectStyle.jsp?table_ename='+document.all.table_ename.value+"&field_ename="+field_ename+"&style_id="+style_id.substring(0,3), window, features);
   //runOpen('<%=GlobalUtil._WEB_PATH%>/system/database/select_style.jsp?table_ename='+document.all.table_ename.value+"&field_ename="+field_ename);
   if(typeof selectStyle !='undefined')
   {
      var t =selectStyle.split(",");
      document.all.txStyle[row-1].value =t[1];
      document.all.idStyle[row-1].value =t[0];
	  if(t[0] =="003003")
	  {//自定义编号规则
		 document.all.btDefineNo[row-1].style.display ="inline"; 
		 document.all.btSource[row-1].style.display ="none";
	    document.all.btOfficeTemplate[row-1].style.display ="none";
	  }
      else if(t[0].substring(0, 3) =="005")
	   {
         document.all.btSource[row-1].style.display ="inline";
			document.all.btDefineNo[row-1].style.display ="none"; 
 	      document.all.btWordTemplate[row-1].style.display ="none";
 	      document.all.btExcelTemplate[row-1].style.display ="none";
	   }
		else if(t[0] =="002007")
		{
         document.all.btSource[row-1].style.display ="none";
			document.all.btDefineNo[row-1].style.display ="none"; 
 	      document.all.btWordTemplate[row-1].style.display ="inline";
 	      document.all.btExcelTemplate[row-1].style.display ="none";
		}
		else if(t[0] =="002008")
		{
         document.all.btSource[row-1].style.display ="none";
			document.all.btDefineNo[row-1].style.display ="none"; 
 	      document.all.btWordTemplate[row-1].style.display ="none";
 	      document.all.btExcelTemplate[row-1].style.display ="inline";
		}
		else
	   {
			document.all.btDefineNo[row-1].style.display ="none"; 
         document.all.btSource[row-1].style.display ="none";
         document.all.btWordTemplate[row-1].style.display ="none";
 	      document.all.btExcelTemplate[row-1].style.display ="none";
	   }
   }   
}
function onSelectSource(row,field_ename)
{
	var features ="dialogHeight = 260px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
var selectStyle =window.showModalDialog('<%=GlobalUtil._WEB_PATH%>/system/database/SelectSource.jsp?table_ename='+document.all.table_ename.value+"&field_ename="+field_ename+"&source_type="+document.all.source_type[row-1].value, window, features);
   if(typeof selectStyle !='undefined')
   {
      var t =selectStyle.split(",");
      document.all.txStyle[row-1].value =t[1];
      document.all.idStyle[row-1].value =t[0];
      if(t[0].substring(0, 3) =="005")
         document.all.btSource[row-1].style.display ="inline";
      else
         document.all.btSource[row-1].style.display ="none";
   }   
}
function onSelectOfficeTemplate(row,field_ename,filetype)
{
	var features ="dialogHeight = 250px; dialogWidth = 500px; help: no; status: no;";//Modal Dialog 
var selectStyle =window.showModalDialog('<%=GlobalUtil._WEB_PATH%>/system/database/SelectOfficeTemplate.jsp?table_ename='+document.all.table_ename.value+"&field_ename="+field_ename+"&filetype="+filetype, window, features);
   if(typeof selectStyle !='undefined')
   {
      var t =selectStyle.split(",");
      document.all.txStyle[row-1].value =t[1];
      document.all.idStyle[row-1].value =t[0];
      if(t[0].substring(0, 3) =="005")
         document.all.btSource[row-1].style.display ="inline";
      else
         document.all.btSource[row-1].style.display ="none";
   }   
}
function onUpdate(row)
{
   //var src ="Save.jsp?operate=1&table_ename="+document.all.table_ename.value+"&field_ename="+document.all.field_ename[row-1].value+"&style_id="+;
   //document.all.sub.src =src;
		var s=new Server("saveTableStyle");
		s.setParam("table_ename", document.all.table_ename.value);
		s.setParam("field_ename", document.all.field_ename[row-1].value);
		s.setParam("style_id", document.all.idStyle[row-1].value);
		s.send(s, false, function(){
				alert("保存成功！");
				if(document.all.idStyle[row-1].value.substring(0, 3) =="005")
					alert("点击‘选择项数据源..’设定选择数据来源");
			}
		);

      
}
</script>