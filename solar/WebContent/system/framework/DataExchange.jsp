<%
/*
此页面完成框架数据的转换，包括服务、动态服务、表单定制、表单数据以及后台数据库执行语句
*/
%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<html>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/CookieClass.js"></script>
<body onLoad="getConfig()">
<table height="100%" width="100%" border="1">
<tr>
	<td valign="top" width="1%">
	<table width="320">
		<tr>
			<td valign="top" colspan="2" align="right" nowrap>
				  <fieldset height="100">
						<legend>源数据库</legend>
						<table width="100%" class="table_c" cellpadding="2" cellspacing="1">
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">数据库类型：</td>
								<td>
									<select name="db_type1" style="width:100%" onChange="onChangeDataBase(this, 1)">
										<option value="">请选择......</option>
										<option value="mysql">Mysql</option>
										<option value="sqlserver">SqlServer</option>
										<option value="oracle">Oracle</option>
									</select>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">驱动：</td>
								<td>
									<input type="text" name="driver1" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">链接：</td>
								<td>
									<input type="text" name="url1" size="40">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">用户名：</td>
								<td>
									<input type="text" name="user1" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">密码：</td>
								<td>
									<input type="text" name="password1" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">属性：</td>
								<td>
									<input type="text" name="properties1" style="width:100%">
								</td>
							</tr>
						</table>
				  </fieldset>
			</td>
			</tr>
			<tr>
			<td valign="top" colspan="2" align="right">
				  <fieldset height="100">
						<legend>目的数据库</legend>
						<table width="100%" class="table_c" cellpadding="2" cellspacing="1">
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">数据库类型：</td>
								<td>
									<select name="db_type2" style="width:100%" onChange="onChangeDataBase(this, 2)">
										<option value="">请选择......</option>
										<option value="mysql">Mysql</option>
										<option value="sqlserver">SqlServer</option>
										<option value="oracle">Oracle</option>
									</select>
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">驱动：</td>
								<td>
									<input type="text" name="driver2" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">链接：</td>
								<td>
									<input type="text" name="url2" size="40">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">用户名：</td>
								<td>
									<input type="text" name="user2" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">密码：</td>
								<td>
									<input type="text" name="password2" style="width:100%">
								</td>
							</tr>
							<tr class="tr_c">
								<td width="10%" nowrap class="td_c" align="right">属性：</td>
								<td>
									<input type="text" name="properties2" style="width:100%">
								</td>
							</tr>
						</table>
					</fieldset>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type=checkbox id="idCkConvert"><label for="idCkConvert" style="cursor:hand">转码</label>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type=button value="保存配置" onClick="onSaveDbConfig()">
			</td>
		</tr>
	</table>
	</td>
	<td bgcolor="#FF0000" width="1"></td>
	<td valign="top">
		<table width="100%">
			<tr>
				<td align="center">
				<$:G title="动态服务转换">
					<table width="100%">
						<tr>
							<td align="right">动态服务名：</td><td><input type="text" name="dyna_action_no"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_dyna_aciton')"></td>
						</tr>
					</table>
				</$:G>
				</td>
				<td align="center">
				<$:G title="静态服务转换">
					<table width="100%">
						<tr>
							<td align="right">静态服务名：</td><td><input type="text" name="service_name"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_service')"></td>
						</tr>
					</table>
				</$:G>
				</td>
			</tr>
			<tr>
				<td align="center">
				<$:G title="表单数据">
					<table width="100%">
						<tr>
							<td align="right" nowrap>表单名称：</td><td><input type="text" name="table_ename">例如，sm_staff</td>
						</tr>
						<tr>
							<td align="right">字段名：</td><td><input type="text" value="*" name="fields" size="40"></td>
						</tr>
							<td colspan="2" align="center">字段与字段之间用逗号隔开，例如staff_no,staff_name,sex</td>
						</tr>
						<tr>
							<td align="right">条件：</td><td><input type="text" name="where">例如：sex=1 and state=1</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_table_data')"></td>
						</tr>
					</table>
				</$:G>
				</td>
				<td align="center" valign="top" width="50%">
				<$:G title="表单定义">
					<table width="100%">
						<tr>
							<td align="right">表单名称：</td><td><input type="text" name="card" size="40">例如，sm_staff</td>
						</tr>
						<tr>
							<td colspan="2">如果是对多个表进行数据导出，则用如下格式java DatabaseCardConvert FM_SERVICES,PM_PARAMS 表跟表之间用逗号隔开。</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_table_define')"></td>
						</tr>
					</table>
				</$:G>
				</td>
			</tr>
			<tr>
				<td align="center">
				<$:G title="项目参数" height="100%">
					<table width="100%">
						<tr>
							<td align="right">参数名：</td><td><input type="text" name="para_name">例如，RECORD_EXECUTE_SERVICE_LOG</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_project_param')"></td>
						</tr>
					</table>
				</$:G>
				</td>
				<td align="center">
				<$:G title="静态参数">
					<table width="100%">
						<tr>
							<td align="right">数据字典项：</td><td><input type="text" name="field_name">，例如SEX</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_dictory')"></td>
						</tr>
					</table>
				</$:G>
				</td>
			</tr>
			<tr>
				<td align="center">
				<$:G title="窗口">
					<table width="100%">
						<tr>
							<td align="right">窗口编号：</td><td><input type="text" name="win_id"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_window')"></td>
						</tr>
					</table>
				</$:G>
				</td>
				<td align="center">
				<$:G title="菜单窗口">
					<table width="100%">
						<tr>
							<td align="right">菜单编号：</td><td><input type="text" name="fun_id"><input type="checkbox" name="include">包括子菜单；例如，08</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_funs')"></td>
						</tr>
					</table>
				</$:G>
				</td>
			</tr>
			<tr>
				<td align="center">
				<$:G title="国际化">
					<table width="100%">
						<tr>
							<td align="right">国际化条目：</td><td><input type="text" name="item"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type=button value="抽取" onClick="onEtlData('etl_international')"></td>
						</tr>
					</table>
				</$:G>
				</td>
				<td align="center">
				<$:G title="工作流">
					<table width="100%">
						<tr>
							<td align="right">系统流程编号：</td><td><input type="text" name="swf_no"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								抽取系统流程、流程环节等信息，不包括含有授权的信息。<input type=button value="抽取" onClick="onEtlData('etl_workflow')">
							</td>
						</tr>
					</table>
				</$:G>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
function onChangeDataBase(oList, type)
{
	if(type =="1")
	{
		if(oList.value =="mysql")
		{
			document.all.driver1.value ="com.mysql.jdbc.Driver";
			document.all.url1.value ="jdbc:mysql://ip/database1?useUnicode=true&amp;characterEncoding=gb2312";
			document.all.user1.value ="root";
			document.all.password1.value ="root";
			document.all.properties1.value ="";
		}
		else if(oList.value =="sqlserver")
		{
			document.all.driver1.value ="net.sourceforge.jtds.jdbc.Driver";
			document.all.url1.value ="jdbc:jtds:sqlserver://localhost:1433/NewJutsSoft";
			document.all.user1.value ="sa";
			document.all.password1.value ="";
			document.all.properties1.value ="";
		}
	}
	else if(type =="2")
	{
		if(oList.value =="mysql")
		{
			document.all.driver2.value ="com.mysql.jdbc.Driver";
			document.all.url2.value ="jdbc:mysql://ip/database2?useUnicode=true&amp;characterEncoding=gb2312";
			document.all.user2.value ="root";
			document.all.password2.value ="root";
			document.all.properties2.value ="";
		}
		else if(oList.value =="sqlserver")
		{
			document.all.driver2.value ="net.sourceforge.jtds.jdbc.Driver";
			document.all.url2.value ="jdbc:jtds:sqlserver://localhost:1433/database";
			document.all.user2.value ="sa";
			document.all.password2.value ="";
			document.all.properties2.value ="";
		}
	}
}
function onEtlData(type)
{
	var s =new Server("etlData");
	s.setParam("driver1", $V("driver1"));
	s.setParam("url1", $V("url1"));
	s.setParam("user1", $V("user1"));
	s.setParam("password1", $V("password1"));
	s.setParam("properties1", $V("properties1"));

	s.setParam("driver2", $V("driver2"));
	s.setParam("url2", $V("url2"));
	s.setParam("user2", $V("user2"));
	s.setParam("password2", $V("password2"));
	s.setParam("properties2", $V("properties2"));
	s.setParam("etl_type", type);

	if(idCkConvert.checked)
		s.setParam("convert", "1");
	if(type =="etl_dyna_aciton")
	{
		if($V("dyna_action_no") =="")
		{
			alert("动态服务名不能为空！");
			$("dyna_action_no").focus();
			return;
		}
		s.setParam("action_no", $V("dyna_action_no"));
	}
	else if(type =="etl_service")
	{
		if($V("service_name") =="")
		{
			alert("服务名不能为空！");
			$("service_name").focus();
			return;
		}
		s.setParam("service_name", $V("service_name"));
	}
	else if(type =="etl_table_data")
	{
		if($V("table_ename") =="")
		{
			alert("要抽取的表单名不能为空！");
			$("table_ename").focus();
			return;
		}
		if(!confirm("确定要抽取表单["+$V("table_ename")+"]符合条件["+$V("where")+"]的数据？"))
			return;
		s.setParam("table_ename", $V("table_ename"));
		s.setParam("fields", $V("fields"));
		s.setParam("where", $V("where"));
	}
	else if(type =="etl_funs")
	{
		if($V("fun_id") =="")
		{
			alert("要抽取的菜单编号不能为空！");
			$("fun_id").focus();
			return;
		}
		if(!confirm("确定要抽取菜单["+$V("fun_id")+"]的数据？"))
			return;
		s.setParam("fun_id", $V("fun_id"));
		if(document.all.include.checked)
			s.setParam("include", 1);
	}
	else if(type =="etl_dictory")
	{
		if($V("field_name") =="")
		{
			alert("要抽取的数据字典项不能为空！");
			$("field_name").focus();
			return;
		}
		if(!confirm("确定要抽取数据字典项["+$V("field_name")+"]的数据？"))
			return;
		s.setParam("field_name", $V("field_name"));
	}
	else if(type =="etl_project_param")
	{
		if($V("para_name") =="")
		{
			alert("要抽取的参数名称不能为空！");
			$("para_name").focus();
			return;
		}
		if(!confirm("确定要抽取参数名称["+$V("para_name")+"]的数据？"))
			return;
		s.setParam("notes", "备注A");
		s.setParam("para_name", $V("para_name"));
	}
	else if(type =="etl_table_define")
	{
		if($V("card") =="")
		{
			alert("要抽取的表单名称不能为空！");
			$("card").focus();
			return;
		}
		if(!confirm("确定要抽取表单名称["+$V("card")+"]的数据？"))
			return;
		s.setParam("card", $V("card"));
	}
	else if(type =="etl_window")
	{
		if($V("win_id") =="")
		{
			alert("要抽取的窗口编号不能为空！");
			$("win_id").focus();
			return;
		}
		if(!confirm("确定要抽取窗口编号["+$V("win_id")+"]的数据？"))
			return;
		s.setParam("win_id", $V("win_id"));
	}
	else if(type =="etl_international")
	{
		if($V("item") =="")
		{
			alert("要抽取的国际化条目不能为空！");
			$("item").focus();
			return;
		}
		if(!confirm("确定要抽取国际化条目["+$V("item")+"]的数据？"))
			return;
		s.setParam("item", $V("item"));
	}
	else if(type =="etl_workflow")
	{
		if($V("swf_no") =="")
		{
			alert("要抽取的工作流编号不能为空！");
			$("swf_no").focus();
			return;
		}
		if(!confirm("确定要抽取工作流编号["+$V("swf_no")+"]的数据？"))
			return;
		s.setParam("swf_no", $V("swf_no"));
	}
	s.send(s, false, function(){
		alert("数据抽取成功！");
	});
}
function onSaveDbConfig()
{
	var o=new CookieClass();
	var date=new Date();
	o.expires =30;//一个月有效
	var sdb =document.all.db_type1.value+"|"+document.all.driver1.value+"|"+document.all.url1.value
			+"|"+document.all.user1.value+"|"+document.all.password1.value+"|"+document.all.properties1.value;
	var ddb =document.all.db_type2.value+"|"+document.all.driver2.value+"|"+document.all.url2.value
			+"|"+document.all.user2.value+"|"+document.all.password2.value+"|"+document.all.properties2.value;
	o.setCookie("sdb", sdb);
	o.setCookie("ddb", ddb);
}
function getConfig()
{
	var cook = new CookieClass();
	if(cook.getCookie("sdb") !="")
	{
		var sdb =cook.getCookie("sdb").split("|");
		if(sdb.length ==6)
		{
			$S("db_type1", sdb[0]);
			$S("driver1", sdb[1]);
			$S("url1", sdb[2]);
			$S("user1", sdb[3]);
			$S("password1", sdb[4]);
			$S("properties1", sdb[5]);
		}
	}
	if(cook.getCookie("ddb") !="")
	{
		var ddb =cook.getCookie("ddb").split("|");
		if(ddb.length ==6)
		{
			$S("db_type2", ddb[0]);
			$S("driver2", ddb[1]);
			$S("url2", ddb[2]);
			$S("user2", ddb[3]);
			$S("password2", ddb[4]);
			$S("properties2", ddb[5]);
		}
	}
}
//-->
</script>