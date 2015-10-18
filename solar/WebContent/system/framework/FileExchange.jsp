<%
/*
此页面完成文件的更新操作。
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
						<legend>文件更新</legend>
						<table width="100%" class="table_c" cellpadding="2" cellspacing="1">
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">更新类型：</td>
								<td>
									<select name="copy_type" style="width:100%">
										<option value="0" selected>0:文件更新</option>
										<option value="1">1:增量更新</option>
									</select>
									<font color='#CCCCCC'>文件更新：对目标路径下的文件作更新，而对于目标路径没有而源路径存在的文件不作处理；</font>
									<br>
									<font color='#CCCCCC'>增量更新：对目标路径下的文件作更新，而对于目标路径没有而源路径存在的文件作新增处理；</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">源路径：</td>
								<td>
									<input type="text" name="source_path" style="width:100%">
									<font color='#CCCCCC'>为源路径的绝对路径名。源路径最后不需要目录分隔符，例如C:\RUN_SYSTEM\platform\web，而不是例如C:\RUN_SYSTEM\platform\web\。</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">目标路径：</td>
								<td>
									<input type="text" name="dist_path" style="width:100%">
									<font color='#CCCCCC'>为源路径的绝对路径名。源路径最后不需要目录分隔符，例如C:\RUN_SYSTEM\platform\prototype，而不是例如C:\RUN_SYSTEM\platform\prototype\。</font>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">更新时间：</td>
								<td>
									<input type="text" name="change_time" style="width:100%" onClick='setDayHM(this)'>
									<font color='#CCCCCC'>对指定时间后更新的文件进行操作，而早于此时间的文件不作响应。</font>
								</td>
							</tr>
						</table>
					</fieldset>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type=button value="更新" onClick="onUpdateFiles()">
				<input type=button value="保存配置" onClick="onSaveFileConfig()">
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
		
		$E.message("成功修改文件["+s.getDefaultParamValue("change_file_count")+"]个");
		if(s.getDefaultParamValue("change_file_count") >0)
			$E.message(s.getDefaultParamValue("change_files"));
	}
	);
}

function onSaveFileConfig()
{
	var o=new CookieClass();
	var date=new Date();
	o.expires =30;//一个月有效
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