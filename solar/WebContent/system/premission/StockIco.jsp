<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<title>СͼƬά��</title>
<body onLoad="loadSystemIcons()">
<DIV onscroll="Table.fixRow()" class="Shadow" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 300px"> 
	<table width=100% id="idTbIcon" cellpadding="2" border="0" cellspacing="1" class="table_c">
		<tr class="tr_c fixed">
			<td class="td_c" colspan="10" align="center">---</td>
		</tr>
		<tr class="tr_c">
			<td></td>
		</tr>
	</table>
</DIV>
</body>
</html>
<script language="javascript">
<!--
function loadSystemIcons()
{
	var s =new Server("getSystemStockIco");
	s.setParam("ico_path", '<%=StringUtil.replace(request.getRealPath(""),"\\", "\\\\")%>');
	s.send(s,false, function()
		{
			Table.clear(idTbIcon);
			var oResult = s.getResult("icons");
			
			if(oResult != null)
			{
				var iRows =oResult.getRows();
				for(i=1; i<=iRows; i++)
				{
					var oRow =idTbIcon.insertRow();
					oRow.className="tr_c";
					var j=0;
					for(; j<10; j++)
					{
						var cell =oRow.insertCell();
						cell.img =oResult.get(i,"icon");
						cell.innerHTML = "<input type='image' src='"+WEB_PATH +oResult.get(i,"icon")+"'>";
						cell.onclick = function()
						{
							parent.setImg(this.img);
						}
						i ++;
						if(i >iRows)
							break;
					}
					i --;
				}
			}
		}
	);
}
//-->
</script>
