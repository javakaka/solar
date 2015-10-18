<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<SCRIPT TYPE="text/javascript" SRC="js/moveloc.js"></SCRIPT>
<SCRIPT	>
<!--
function up()
{	
	var i;
	var temp;
	i=document.frmjob.target.selectedIndex;
	if(i>0)
	{	
      temp=document.frmjob.target[i].text;
      value =document.frmjob.target[i].value;
		document.frmjob.target[i].text=document.frmjob.target[i-1].text;
		document.frmjob.target[i].value=document.frmjob.target[i-1].value;
		document.frmjob.target[i-1].text=temp;
		document.frmjob.target[i-1].value=value;
		document.frmjob.target.selectedIndex=i-1;
	}
}

function down()
{	
	var len;
	var i;
	var temp;
	len=document.frmjob.target.length;
	i=document.frmjob.target.selectedIndex;
	if((i>=0)&&(i<len-1))
	{	temp=document.frmjob.target[i].text;
      value =document.frmjob.target[i].value;
		document.frmjob.target[i].text=document.frmjob.target[i+1].text;
		document.frmjob.target[i].value=document.frmjob.target[i+1].value;
		document.frmjob.target[i+1].text=temp;
		document.frmjob.target[i+1].value=value;
		document.frmjob.target.selectedIndex=i+1;
	}
}

function selectlist()
{	
	var i=0;
	var len;
	document.frmjob.string.value="";
	len=document.frmjob.target.length;
	while(i<len)
	{	document.frmjob.string.value+=document.frmjob.target[i].text+"|";
		i++;
	}
	document.frmjob.submit();
}
-->
</SCRIPT>
</head>
<%
String sTableEname =ServletUtil.get(request,"table_ename");
%>

<body>
<form name=frmjob method="POST">
<$:G title="列表显示字段、顺序、排序的设置">
<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
	<tr class="tr_c">
		<td colspan="2"> 
			<iframe id="myTestFrameID" 
onload="javascript:{dynIframeSize('myTestFrameID');}" 
marginwidth=0 marginheight=0 frameborder=0 
scrolling=no src="ListPremission.jsp?card=<%=sTableEname%>" 
width=100% height=100></iframe>
		</td>
	</tr>
	<tr class="tr_c">
		<td width=1% nowrap class="td_c"><B>*列表数据行：</B></td>
		<td align=left nowrap>行数：<input type=text name="rows" size=3 value=10 datatype="string" desc="列表显示行数">
      </td>
	</tr>
	<tr class="tr_c">
		<td colspan=2 class="td_c"><B>*列表查询字段：</B></td>
	</tr>
	<tr class="tr_c">
		<td align=left width=1% nowrap class="td_c">查询字段字段：</td>
      <td>
			<$:A service="getTableFields" dynamic="true">
				<$:P name="table_ename" default=""/>
			</$:A>
         <$:L name="query" rs="Fields" valueField="FIELD_ENAME" textField="FIELD_CNAME" props="size='5' multiple style='width:100%; border:1px #E8E8E8 solid'"/>
      </td>
	</tr>
	<tr  class="tr_c">
		<td colspan=4  class="td_c"><B>*列表默认排序设置：</B></td>
	</tr>
	<tr  class="tr_c">
		<td align=right width=80 class="td_c"><input type=hidden name=cardkindid value=83>排序字段1：</td>
      <td><$:L name="order1" rs="Fields" valueField="FIELD_ENAME" textField="FIELD_CNAME" firstText="请选择..."/>&nbsp;排序方式：&nbsp;<input type=radio class="radio" name='orderby1' value='asc' id="radio_orderby_11" ><label for="radio_orderby_11"><b>升序</b></label>&nbsp;&nbsp;<input type=radio class="radio" name='orderby1' value='desc' checked id="radio_orderby_12" ><label for="radio_orderby_12"><b>降序</b></label>&nbsp;&nbsp;</td>
	</tr>
	<tr  class="tr_c">
		<td align=right width=80 class="td_c"><input type=hidden name=cardkindid value=83>排序字段2：</td>
      <td><$:L name="order2" rs="Fields" valueField="FIELD_ENAME" textField="FIELD_CNAME" firstText="请选择..."/>&nbsp;排序方式：&nbsp;<input type=radio class="radio" name='orderby2' value='asc' id="radio_orderby_21" ><label for="radio_orderby_21"><b>升序</b></label>&nbsp;&nbsp;<input type=radio class="radio" name='orderby2' value='desc' checked id="radio_orderby_22" ><label for="radio_orderby_22"><b>降序</b></label>&nbsp;&nbsp;</td>
	</tr>
	<tr  class="tr_c">
		<td align=right class="td_c" width=80><input type=hidden name=cardkindid value=83>排序字段3：</td>
      <td><$:L name="order3" rs="Fields" valueField="FIELD_ENAME" textField="FIELD_CNAME" firstText="请选择..."/>&nbsp;排序方式：&nbsp;<input type=radio class="radio" name='orderby3' value='asc' id="radio_orderby_31" ><label for="radio_orderby_31"><b>升序</b></label>&nbsp;&nbsp;<input type=radio class="radio" name='orderby3' value='desc' checked id="radio_orderby_32" ><label for="radio_orderby_32"><b>降序</b></label>&nbsp;&nbsp;</td>
	</tr>
</table>
<$:A service="getTableQueryFields" dynamic="true">
   <$:P name="table_ename" default=""/>
</$:A>
<$:M dtype="1"/>
<script>
   <$:T var="field" name="Fields">
      field ='<$:C item="field.FIELD_ENAME"/>';
      for(i=0; i<document.all.query.options.length; i++)
         if(document.all.query.options[i].value ==field)
            document.all.query.options[i].selected =true;
   </$:T>
</script>
</$:G>
<$:A service="getTableIndex" dynamic="true">
   <$:P name="table_ename" default=""/>
</$:A>
<$:M dtype="1"/>
<script>
   <$:T var="field" name="Index">
      field ='<$:C item="field.FIELD_ENAME"/>';
      rows ='<$:C item="field.LIST_ROWS"/>';
      by ='<$:C item="field.ORDER_TYPE"/>';
		fields =field.split(",");
		bys =by.split(",");
		if(fields.length>0)
		{
			document.all.order1.value =fields[0];
			for(i=0; i<document.all.orderby1.length; i++)
			{
				if(document.all.orderby1[i].value ==bys[0])
				{
					document.all.orderby1[i].checked =true;
					break;
				}
			}
			if(fields.length >1)
			{
				document.all.order2.value =fields[1];
				for(i=0; i<document.all.orderby2.length; i++)
				{
					if(document.all.orderby2[i].value ==bys[1])
					{
						document.all.orderby2[i].checked =true;
						break;
					}
				}
				if(fields.length >2)
				{
					document.all.order3.value =fields[2];
					for(i=0; i<document.all.orderby3.length; i++)
					{
						if(document.all.orderby3[i].value ==bys[2])
						{
							document.all.orderby3[i].checked =true;
							break;
						}
					}
				}
			}
		}
      document.all.rows.value =rows;
   </$:T>
</script>

<div align=right>
   <input type="button" value=<$:I item="html.button.save"/> class="btfirst" onClick="onSubmit(this.form)">
</div>

<input name="table_ename" type=hidden value='<$:W name="table_ename" from="request" default=""/>'>
</form>
</body>
</html>
<script>
<!--
function onSubmit(form)
{
   if(checkForm(form))
   {
		if(document.all.order1.value ==''
			&& document.all.order2.value ==''
			&& document.all.order3.value =='')
		{
         alert("请至少指定一个排序字段及排序方式");
         form.order1.focus();
         return false;
      }
      var query ='', order ='', orderby ='', rows;
		if(document.all.order1.value !='')
		{
			c =0;
			for(i=0; i<document.all.orderby1.length; i++)
			{
				if(document.all.orderby1[i].checked)
				{
					c =1;
					orderby =document.all.orderby1[i].value;
					break;
				}
			}
			if(c ==0)
			{
				alert("请指定字段排序方式");
				return;
			}
			order =document.all.order1.value;
		}
		if(document.all.order2.value !='')
		{
			c =0;
			for(i=0; i<document.all.orderby2.length; i++)
			{
				if(document.all.orderby2[i].checked)
				{
					c =1;
					if(orderby =='')
						orderby =document.all.orderby2[i].value;
					else
						orderby +=","+document.all.orderby2[i].value;

					break;
				}
			}
			if(c ==0)
			{
				alert("请指定字段排序方式");
				return;
			}
			if(order =='')
				order =document.all.order2.value;
			else
				order +=","+document.all.order2.value;
		}
		if(document.all.order3.value !='')
		{
			c =0;
			for(i=0; i<document.all.orderby3.length; i++)
			{
				if(document.all.orderby3[i].checked)
				{
					c =1;
					if(orderby =='')
						orderby =document.all.orderby3[i].value;
					else
						orderby +=","+document.all.orderby3[i].value;

					break;
				}
			}
			if(c ==0)
			{
				alert("请指定字段排序方式");
				return;
			}
			if(order =='')
				order =document.all.order3.value;
			else
				order +=","+document.all.order3.value;
		}

		
		for(i=0; i<form.query.length; i++)
      {
         if(form.query.options[i].selected)
         {
            query +=","+form.query.options[i].value;
         }
      }
      if(query !="")
         query =query.substring(1, query.length);
      
      //order =form.order.value;
      rows =form.rows.value;
      //var src ="Save.jsp?operate=3&table_ename="+document.all.table_ename.value+"&query_fields="+query+"&order="+order+"&orderby="+orderby+"&rows="+rows;
		//alert(src);
		var s=new Server("saveTableListView");
		s.setParam("table_ename", $V("table_ename"));
		s.setParam("query_fields", query);
		s.setParam("order", order);
		s.setParam("orderby", orderby);
		s.setParam("rows", rows);
		s.send(s, false, function(){
			alert("设置成功！");
			}
		);

		//document.all.savelist.src =src;
   }
}
//-->
</script>