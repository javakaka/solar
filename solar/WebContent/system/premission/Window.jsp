<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body onLoad="loadNew()">
<$:G title="窗口列表">		
<TABLE WIDTH="100%" cellpadding="2" cellspacing="1" class="table_c">
	<TR>
	<TD COLSPAN=2 VALIGN=TOP>
	<DIV onscroll="Table.fixRow()" class="Shadow" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 400px"> 
		<table id="tabMain" name="tabMain" style="BORDER-COLLAPSE: collapse" cellpadding="3" border="1" width="100%" 	bordercolor="white" bgcolor="#eeeeee" onClick="Table.click()">	
			<tr style="COLOR: white; POSITION: relative">
				<td class="td_c" width=1% nowrap><$:I item="sm_window.win_id"/></td>
				<!-- <td class="td_c" width=1% nowrap><$:I item="sm_window.win_target"/></td> -->
				<td class="td_c" nowrap><$:I item="sm_window.win_desc"/></td>
			</tr>
			<$:A service="getSysWindows" dynamic="true"/>
			<$:M dtype="1"/>
			<$:T var="window" name="Windows" fieldNum="3">
			  <tr class="tr_c" <$:R item="window.WIN_ID"/>>
				<td nowrap><$:C item="window.WIN_ID"/></td>
				<!-- <td nowrap>&nbsp;<$:C item="window.WIN_TARGET"/></a></td> -->
				<td nowrap>&nbsp;<$:C item="window.WIN_DESC"/></td>
			  </tr>
			</$:T>
		</table>
	</DIV>
	</TD>
	</TR>
</TABLE>
</$:G>
<div align=center>
   <input type="button" value=<$:I item="html.button.ok"/>   onClick="onMe()"><input type="button" value=<$:I item="html.button.close"/> onClick="onCloseWindow()">
</div>
</body>
<script>
function onMe()
{
	var win_id =Table.clickRow("tabMain").WIN_ID;
	if(win_id !="" && typeof win_id !='undefined')
	{
		parent.window.returnValue =win_id.split(",");
		parent.window.close();
		return true;
	}
	else
	{
		$E.message("请选择一条有效记录");
		return false;
	}
}
function onCloseWindow()
{
	//返回执行结果并关闭窗口
	parent.window.returnValue = null;
	parent.window.close();
	return(true);
}
function loadNew(){
	var win_id='<$:W name="win_id" from="request"/>';
	if(win_id !='')
		for (var i = 0; i < tabMain.rows.length;i++){
			if (tabMain.rows(i).cells(0).innerText ==win_id ){
				var iRowIndexs = new Array();
				iRowIndexs[0]= i;
				Table.selectedRow(tabMain, iRowIndexs);
				break;
			}
		}
}

</script>