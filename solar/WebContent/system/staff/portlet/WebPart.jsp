<%
/**
* �û�ѡ��ϵͳ�����webpart
*/
%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<body onLoad="loadStaffWebPart()">
<$:G title="���涨��">
<table id="idTbWebPart" cellpadding="2" cellspacing="1" class="table_c" width="100%">
<tr class="tr_c">
	<td class="td_c" align="center" width="10%" nowrap>����</td><td class="td_c">����</td><td class="td_c" width="5%" nowrap>ѡ��</td>
</tr>
</table>
<div align="center">
	<input type="button" value="��������" onClick="onSetDesktop()">
</div>
</$:G>
</body>
</html>
<script language="javascript">
<!--
var iRows =0;
function loadStaffWebPart()
{
	var s =new Server("getStaffPortlet");
	s.send(s, false, function()
	{
		var oRs =s.getResult("WebParts");
		if(oRs !=null)
		{
			iRows =oRs.getRows();
			for(var i=1; i<=iRows; i++)
			{
				var oRow =idTbWebPart.insertRow();
				oRow.className ="tr_c";
				oTd =oRow.insertCell();
				oTd.innerHTML =oRs.get(i,"webpart_title");
				oTd.i =i;
				oTd.onclick=function()
				{
					var oCk =document.getElementById("idCk"+this.i);
					if(oCk !=null)
						oCk.checked =!oCk.checked;
					Table.click();
				};
				oTd.noWrap =true;
				oTd =oRow.insertCell();
				oTd.innerHTML =oRs.get(i,"webpart_note");
				oTd.i =i;
				oTd.onclick=function()
				{
					var oCk =document.getElementById("idCk"+this.i);
					if(oCk !=null && !oCk.disabled)
						oCk.checked =!oCk.checked;
					Table.click();
				};
				Table.insertCell(oRow, "<input type='checkbox' id='idCk"+i+"' value='"+oRs.get(i,"webpart_no")+"'>");
			}
		}
		var sStaffWebpart =s.getDefaultParamValue("part_serial");
		if(sStaffWebpart !="")
		{
			var sa =sStaffWebpart.split("|");
			for(var j=1; j<=iRows; j++)
			{
				var oCk =document.getElementById("idCk"+j);
				for(var k=0; k<sa.length; k++)
				{
					var sas =sa[k].split(",");
					for(var m=0; m<sas.length; m++)
					{
						if(oCk.value ==sas[m])
						{
							oCk.checked =true;
							//oCk.disabled =true;
						}
					}
				}
			}
		}
	});
}
/*��������*/
function onSetDesktop()
{
	var sConfigIds ="";
	for(var i=1; i<=iRows; i++)
	{
		var ck =document.getElementById("idCk"+i);
		if(ck.checked && !ck.disabled)
		{
			if(sConfigIds.length >0)
				sConfigIds +=",";
			sConfigIds +=ck.value;
		}
	}
	window.returnValue =sConfigIds;
	window.close();
}

/*��ȡ�û����õ���������*/
function onGetUserDesktop()
{

}
//-->
</script>