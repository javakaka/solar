<%
/*
���÷�ʽ��ConfigSet.jsp?busi_desc=��λ��ְλ������&config_name=��λ&busi_type=a&busi_code=b&method=abc
���method��Ϊ�գ���ֱ�ӵ��ø����ڷ���
*/
%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<head>
<title>��������</title>
<script src="Desk.js"></script>
</head>
<body onLoad="loadPage()">
<table width="100%" class="table_c" cellpadding="2" cellspacing="1">
	<tr class="tr_c">
		<td class="td_c center" colspan="2" id="idBusiDesc" height="30px"></td>
	</tr>
	<tr class="tr_c">
		<td class="td_c right"><span id="idSpanConfigName"></span>��</td><td><input type="text" name="busi_code_set"></td>
	</tr>
	<tr class="tr_c">
		<td colspan="2" class="center"><input type="button" value="����" onClick="setConfig()"></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
var sBusiType =$E.getParameter("busi_type");
var sBusiCode =$E.getParameter("busi_code");
var sConfigName =$E.getParameter("config_name");
var sMethod =$E.getParameter("method");
function loadPage()
{
	var close =false;
	if(sBusiType =="")
	{
		alert("ҵ���������ݲ���Ϊ��");
	}
	else if(sBusiCode =="")
	{
		alert("ҵ�����ݱ�ʾ����Ϊ��");
	}
	else if(sConfigName =="")
	{
		alert("ҵ�����ݱ�������Ϊ��");
	}
	else
	{
		close =true;
	}
	idBusiDesc.innerHTML =$E.getParameter('busi_desc');
	idSpanConfigName.innerHTML =sConfigName;
	if(!close)
	{
		try
		{
			parent.closeLayer();
		}
		catch(e){}
	}
}
function setConfig()
{
	if(sMethod !="")
	{
		if(document.all.busi_code_set.value =="")
		{
			alert(idSpanConfigName.innerHTML +"����Ϊ�գ�");
		}
		else
		{
			parent.<%=request.getParameter("method")%>(sBusiType, sBusiCode, $V("busi_code_set"));
		}
	}
	else
	{
		var s =new Server("setConfigData");
		s.setParam("busi_type", sBusiType);
		s.setParam("busi_code", sBusiCode);
		s.setParam("busi_code_set", $V("busi_code_set"));
		s.send(s, true)
		{
			try
			{
				parent.reflesh($V("busi_code_set"));
			}
			catch(e){}
		}
	}
}
//-->
</script>
