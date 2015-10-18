<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="JavaScript">
//取消
function OnBtnCancel_Click()
{
  parent.window.close();
  return(true);
}
//-->
</script>
</head>
<body bgcolor="buttonface">
<input type="hidden" name="mode" value="1">
<input type="hidden" name="boname" value="">
<$:G title="服务参数列表">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" valign=top>
  <tr> 
    <td valign=top>
      <table width="100%"  class="table_c" cellpadding="2" cellspacing="1" width="100%">
		<tr class="tr_c">
		<td colspan=2 valign=top>
				  <TABLE id="table1" class="table_c" cellpadding="2" cellspacing="1" width="100%" onClick="Table.click()">
					<TR style="COLOR: white;"  valign=top> 
					  <TD width=5% class="td_c"><$:I item="fm_dyna_action_args.arg_seq"/></TD>
					  <TD width=25% class="td_c"><$:I item="fm_dyna_action_args.arg_name"/>[$开始表示从数据库得到的序列号]</TD>
					  <TD width=15% class="td_c"><$:I item="fm_dyna_action_args.arg_data_type"/></TD>
					  <TD width=10% class="td_c"><$:I item="fm_dyna_action_args.arg_length"/></TD>
					  <TD width=3% class="td_c"><$:I item="fm_dyna_action_args.isnull"/>?</TD>
					  <TD width=18% class="td_c"><$:I item="fm_dyna_action_args.default_value"/>[$代表空串]</TD>
					  <TD width=50% class="td_c"><$:I item="fm_dyna_action_args.arg_desc"/></TD>
					</TR>	
				<$:A service="getFmDynaServiceArgs" dynamic="true">
					<$:P name="action_id" from="request"/>
					<$:P name="seq" from="request" default="1"/>
					<$:P name="compare" from="request" default="0"/>
					<$:P name="auth_level" from="request" default="0"/>
				</$:A>
				<$:M dtype="1"/>
				<$:T var="params" name="DynaServiceArgs" fieldNum="8">
				  <tr class="tr_c">
					<td nowrap><input name='arg_seq' size=3 value='<$:C item="params.ARG_SEQ"/>' datatype='number' min='1' desc='参数序号'></td>
					<td nowrap><input name='arg_name' size=10 value='<$:C item="params.ARG_NAME"/>' datatype='String' desc='参数名称'></td>
					<td nowrap><input name='arg_data_type' size=3 value='<$:C item="params.ARG_DATA_TYPE"/>' datatype='number' desc='参数类型'></td>
					<td nowrap><input name='arg_length' size=3 value='<$:C item="params.ARG_LENGTH"/>' datatype='number' desc='参数长度'></td>
					<td nowrap><input type='checkbox' name='isnull' <$:C item="params.ISNULL" replace="[1,checked]"/>></td>
					<td nowrap><input name='default_value' size=10 value='<$:C item="params.DEFAULT_VALUE" replace="[$,]"/>'></td>
					<td nowrap><input name='arg_desc' size=30 value='<$:C item="params.ARG_DESC"/>'></td>
				  </tr>
				</$:T>
			</TABLE>
		</td>
		</tr></table>
    </td>
  </tr>
  <tr> 
    <td height="1%" align="center">
      <input type="button" name="BtnOK" value="删除" onclick="delRow()" class="btnofirst"><input type="button" name="BtnOK" value="新增" onclick="addRow()" class="btnofirst"><input type="button" name="BtnOK" value="确定" onclick="OnBtnOK_Click()" class="btnofirst"><input type="button" name="BtnCancel" value="关闭" onclick="OnBtnCancel_Click()" class="btnofirst">
    </td>
  </tr>
</table>
</$:G>
<script language="javascript">
function OnBtnOK_Click(){
	var arg_seqs=document.getElementsByName("arg_seq");
	var len =arg_seqs.length;
	if(len>0){
		for(var i=0; i<len-1; i++){
			for(var j=i+1; j<len; j++){
				if(arg_seqs[j].value== arg_seqs[i].value){
					alert("存在两个或两个以上的同序列参数,其参数值为:"+arg_seqs[i].value);
					arg_seqs[j].focus();
					return false;
				}
			}
		}
	}
		var argNames =document.getElementsByName("arg_name");
		var argDataTypes =document.getElementsByName("arg_data_type");
		var argLengths =document.getElementsByName("arg_length");
		var isNulls =document.getElementsByName("isnull");
		var defaultValues =document.getElementsByName("default_value");
		var argDescs =document.getElementsByName("arg_desc");
		var argSeq='',argName='',argDataType='',isNull='',defaultValue='',argDesc='',argLength ='';
		for(var i=0; i<len-1; i++)
		{
			argSeq				+=arg_seqs[i].value+',';
			argName			+=argNames[i].value+',';
			argLength		+=argLengths[i].value+',';
			argDataType		+=argDataTypes[i].value+',';
			if(isNulls[i].checked)
				isNull +='1'+',';
			else
				isNull			+='0'+',';
			defaultValue	+=defaultValues[i].value+',';
			argDesc			+=argDescs[i].value+',';
		}
		if(len >0)
		{
			argSeq				+=arg_seqs[len-1].value;
			argName			+=argNames[len-1].value;
			argLength		+=argLengths[len-1].value+',';
			argDataType		+=argDataTypes[len-1].value;
			if(isNulls[len-1].checked)
				isNull +='1';
			else
				isNull +='0';
			defaultValue	+=defaultValues[len-1].value;
			argDesc			+=argDescs[len-1].value;
		}
		var s=new Server("setDynamicServiceArgs");
		s.setParam("action_id", $E.getParameter("action_id"));
		s.setParam("seq", $E.getParameter("seq"));
		s.setParam("arg_seq", argSeq);
		s.setParam("arg_name", argName);
		s.setParam("arg_data_type", argDataType);
		s.setParam("is_null", isNull);
		s.setParam("default_value", defaultValue);
		s.setParam("arg_length", argLength);
		s.setParam("arg_desc", argDesc);
		s.send(s, false, function(){
				alert("动态服务参数设置成功！");
			}
		);
}
function addRow(){
	var addCell = new Array();
	addCell[0] = "<input name='arg_seq' size=3 datatype='number' min='1' desc='参数序号'>";
	addCell[1] = "<input name='arg_name' size=10 datatype='String' desc='参数名称'> ";
	addCell[2] = "<input name='arg_data_type' size=3 datatype='number' desc='参数类型'> ";
	addCell[3] = "<input name='arg_length' size=3 datatype='number' desc='参数长度'> ";
	addCell[4] = "<input type='checkbox' name='isnull' class='txtSolid'> ";
	addCell[5] = "<input name='default_value' size=10 class='txtSolid'> ";
	addCell[6] = "<input name='arg_desc' size=30 class='txtSolid'> ";
	oRow =Table.runRowInsert(table1, addCell);
	oRow.className ="tr_c";
}
function delRow(){
	var oRow = Table.clickRow(table1);
	table1.deleteRow(oRow.rowIndex);
}
</script>
</body>
</html>
