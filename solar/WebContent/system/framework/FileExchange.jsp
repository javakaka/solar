<%
/*
��ҳ������ļ��ĸ��²�����
*/
%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/Datetime.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/CookieClass.js"></script>
<html>
<body onLoad="getConfig()">
<table width=100% height=100%>
<tr>
	<td>
	<table width="600" align="center" valign="middle">
		<tr>
			<td valign="top" colspan="2" align="right" nowrap>
				  <fieldset height="100">
						<legend>�ļ�����</legend>
						<table width="100%" class="table_c" cellpadding="2" cellspacing="1">
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">�������ͣ�</td>
								<td>
									<select name="copy_type" style="width:100%">
										<option value="0" selected>0:�ļ�����</option>
										<option value="1">1:��������</option>
									</select>
									<font color='#CCCCCC'>�ļ����£���Ŀ��·���µ��ļ������£�������Ŀ��·��û�ж�Դ·�����ڵ��ļ���������</font>
									<br>
									<font color='#CCCCCC'>�������£���Ŀ��·���µ��ļ������£�������Ŀ��·��û�ж�Դ·�����ڵ��ļ�����������</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">Դ·����</td>
								<td>
									<input type="text" name="source_path" style="width:100%">
									<font color='#CCCCCC'>ΪԴ·���ľ���·������Դ·�������ҪĿ¼�ָ���������C:\RUN_SYSTEM\platform\web������������C:\RUN_SYSTEM\platform\web\��</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">Ŀ��·����</td>
								<td>
									<input type="text" name="dist_path" style="width:100%">
									<font color='#CCCCCC'>ΪԴ·���ľ���·������Դ·�������ҪĿ¼�ָ���������C:\RUN_SYSTEM\platform\prototype������������C:\RUN_SYSTEM\platform\prototype\��</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">����ʱ�䣺</td>
								<td>
									<input type="text" name="change_time" style="width:100%" onClick='setDayHM(this)'>
									<font color='#CCCCCC'>��ָ��ʱ�����µ��ļ����в����������ڴ�ʱ����ļ�������Ӧ��</font>
								</td>
							</tr>
						</table>
					</fieldset>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type=button value="����" onClick="onUpdateFiles()">
				<input type=button value="��������" onClick="onSaveFileConfig()">
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</td>
</tr>
</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
function onUpdateFiles()
{
	var s =new Server("etlFile");
	if($V("source_path") !="")
		s.setParam("source_path", $V("source_path"));
	if($V("dist_path") !="")
		s.setParam("dist_path", $V("dist_path"));
	if($V("change_time") !="")
		s.setParam("change_time", $V("change_time"));
	s.setParam("copy_type", $V("copy_type"));
	s.send(s, false, function()
	{
		
		$E.message("�ɹ��޸��ļ�["+s.getDefaultParamValue("change_file_count")+"]��");
		if(s.getDefaultParamValue("change_file_count") >0)
			$E.message(s.getDefaultParamValue("change_files"));
	}
	);
}

function onSaveFileConfig()
{
	var o=new CookieClass();
	var date=new Date();
	o.expires =30;//һ������Ч
	var sf =document.all.source_path.value+"|"+document.all.dist_path.value+"|"+document.all.change_time.value;
	o.setCookie("sf", sf);
}
function getConfig()
{
	var cook = new CookieClass();
	if(cook.getCookie("sf") !="")
	{
		var sf =cook.getCookie("sf").split("|");
		if(sf.length ==3)
		{
			$S("source_path", sf[0]);
			$S("dist_path", sf[1]);
			$S("change_time", sf[2]);
		}
	}
}

//-->
</SCRIPT>