<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*" %>
<%@ include file="/include/Head.jsp"%>
<script language="JavaScript" src="js/purvitem.js"></script>
<script language="JavaScript" src="js/role_update.js"></script>
<%!
  void sort(DataSet vtrSrc, DataSet vtrTag, String menu_up_id)
  throws Exception
  {
    try {
      Row htb = new Row();
      String strMenuID = new String();
      String strMenuUpID = new String();
      if(vtrSrc != null) {
        for(int i = 0; i < vtrSrc.size(); i ++) {
          htb = (Row)vtrSrc.get(i);
          strMenuID = htb.get("FUN_ID") == null ? "" : (String)htb.get("FUN_ID");
          strMenuUpID = htb.get("UP_FUN_ID") == null ? "" : (String)htb.get("UP_FUN_ID");
          if(strMenuUpID.equals(menu_up_id)) {
             vtrTag.add(htb);
             sort(vtrSrc, vtrTag, strMenuID);
          }
        }
      }
    } catch(Exception ex) {
      throw ex;
    }
  }
%>
<$:NE param="role_id" value="">
	<$:A service="getSysRoleFuns" dynamic="true">
		<$:P name="role_id" from="request"/>
	</$:A>
	<$:M dtype="1"/>
	<$:A service="getSysRoleSubFuns" dynamic="true">
		<$:P name="role_id" from="request"/>
	</$:A>
	<$:M dtype="1"/>
</$:NE>
<$:A service="getSysValidFuns" dynamic="true"/>
<$:M dtype="1"/>
<%
String fun_id = new String();
String up_fun_id = new String();
String fun_name = new String();
String fun_id2 = new String();
String up_fun_id2 = new String();
String fun_name2 = new String();
DataSet alTmp =new DataSet();
DataSet vtrMenuList = new DataSet();
DataSet vtrMenuIdList = new DataSet();
DataSet vtrMenuUpIdList = new DataSet();
Row htb = new Row();
Row htbValue = new Row();
Row htbValue2 = new Row();
Identity oUser =(Identity)session.getAttribute("user");
int iAuthLevel =Integer.parseInt((String)oUser.get("auth-level"));
if(iAuthLevel ==99)//软件开发商
{
   alTmp =(DataSet)ServletUtil.getResult(request, "Funs");
}
else
   alTmp =(DataSet)oUser.get("staff-fun");
sort(alTmp, vtrMenuList, "0");
%>

<script language="JavaScript">
<!--
<%
  for(int i = 0; i < vtrMenuList.size(); i ++)
  {
    htbValue = (Row)vtrMenuList.get(i);
    fun_id = htbValue.get("FUN_ID") == null ? "0" : (String)htbValue.get("FUN_ID");
    up_fun_id = htbValue.get("UP_FUN_ID") == null ? "0" : (String)htbValue.get("UP_FUN_ID");
    fun_name = htbValue.get("FUN_NAME") == null ? "" : (String)htbValue.get("FUN_NAME");
    if(!vtrMenuUpIdList.contains(fun_id)) {
      vtrMenuUpIdList.add(fun_id);
%>

{
  var item = new Array();
  item[0] = new PurvItem("<%= fun_name %>", "<%= fun_id %>");
  if(!src_ItemMain.isExist("<%= up_fun_id %>")) {
    src_ItemMain.addItem(item);
  }
}

<%
      for(int j = 0; j < vtrMenuList.size(); j ++) {
        htbValue2 = (Row)vtrMenuList.get(j);
        fun_id2 = htbValue2.get("FUN_ID") == null ? "0" : (String)htbValue2.get("FUN_ID");
        up_fun_id2 = htbValue2.get("UP_FUN_ID") == null ? "0" : (String)htbValue2.get("UP_FUN_ID");
        fun_name2 = htbValue2.get("FUN_NAME") == null ? "" : (String)htbValue2.get("FUN_NAME");
        if(up_fun_id2.equals(fun_id)) {
          if(!vtrMenuIdList.contains(fun_id2)) {
            vtrMenuIdList.add(fun_id2);
%>

{
  var objItem = null;
  var item = new Array();
  item[0] = new PurvItem("<%= fun_name2 %>", "<%= fun_id2 %>");
  objItem = src_ItemMain.getItemByValue("<%= up_fun_id2 %>");
  if(objItem == null) {
    objItem = src_ItemMain;
  }
  objItem.addItem(item);
}

<%
          }
        }
      }
    }
    vtrMenuIdList.add(up_fun_id);
  }
%>
//-->
</script>

<%
if(ServletUtil.getResult(request, "RoleFuns") !=null)
{
   DataSet alMenuList =new DataSet();
   alTmp =(DataSet)ServletUtil.getResult(request, "RoleFuns");
   sort(alTmp, alMenuList, "0");
   vtrMenuIdList.clear();
   vtrMenuUpIdList.clear();
%>
<script language="JavaScript">
<!--

<%
  if(alMenuList != null) {
    for(int i = 0; i < alMenuList.size(); i ++)
    {
      htbValue = (Row)alMenuList.get(i);
      fun_id = htbValue.get("FUN_ID") == null ? "0" : (String)htbValue.get("FUN_ID");
      up_fun_id = htbValue.get("UP_FUN_ID") == null ? "0" : (String)htbValue.get("UP_FUN_ID");
      fun_name = htbValue.get("FUN_NAME") == null ? "" : (String)htbValue.get("FUN_NAME");
      if(!vtrMenuUpIdList.contains(fun_id)) {
        vtrMenuUpIdList.add(fun_id);
%>

{
  var item = new Array();
  item[0] = new PurvItem("<%= fun_name %>", "<%= fun_id %>");
  if(!tag_ItemMain.isExist("<%= up_fun_id %>")) {
    tag_ItemMain.addItem(item);
  }
}

<%
        for(int j = 0; j < alMenuList.size(); j ++) {
          htbValue2 = (Row)alMenuList.get(j);
          fun_id2 = htbValue2.get("FUN_ID") == null ? "0" : (String)htbValue2.get("FUN_ID");
          up_fun_id2 = htbValue2.get("UP_FUN_ID") == null ? "0" : (String)htbValue2.get("UP_FUN_ID");
          fun_name2 = htbValue2.get("FUN_NAME") == null ? "" : (String)htbValue2.get("FUN_NAME");
          if(up_fun_id2.equals(fun_id)) {
            if(!vtrMenuIdList.contains(fun_id2)) {
              vtrMenuIdList.add(fun_id2);
%>

{
  var objItem = null;
  var item = new Array();
  item[0] = new PurvItem("<%= fun_name2 %>", "<%= fun_id2 %>");
  objItem = tag_ItemMain.getItemByValue("<%= up_fun_id2 %>");
  if(objItem == null) {
    objItem = tag_ItemMain;
  }
  objItem.addItem(item);
}

<%
            }
          }
        }
      }
      vtrMenuIdList.add(up_fun_id);
    }
  }
%>

//-->
</script>
<%
}
%>
<body onload="OnBody_Load()">
<form name="prem">
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
   <tr class="tr_c">
      <td width="38%" align="center" valign=top>
      <FIELDSET><LEGEND>可选功能</LEGEND>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
         <tr>
            <td align="center">
            <select name="select_src" size=30 multiple style="width:180px" ondblclick="OnListSrc_DblClick()">
            </select>
            </td>
         </tr>
      </table>
      </FIELDSET>
      </td>
      <td align="center" valign="middle">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
            <td align="center"><input type="button" name="BtnAdd" value=">" style="width:30px; height:20px" onClick="OnBtnAdd_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" name="BtnAddAll" value=">>" style="width:30px; height:20px" onClick="OnBtnAddAll_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" name="BtnRemove" value="<" style="width:30px; height:20px" onClick="OnBtnRemove_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" name="BtnRemoveAll" value="<<" style="width:30px; height:20px" onClick="OnBtnRemoveAll_Click()" class="button"></td>
         </tr>
      </table>
      </td>
      <td align="center" valign="top">
         <FIELDSET><LEGEND>已选功能</LEGEND>
         <table width="100%">
            <tr>
               <td align="left">
               <select name="fun_id" size=30 multiple style="width:180px"
               </select>
               </td>
            </tr>
         </table>
         </FIELDSET>
      </td>
      <td valign="top">
         <FIELDSET><LEGEND><$:I item="sub_fun.list"/></LEGEND>
            <table width="100%" border="0" cellspacing="0" cellpadding="3">
               <tr> 
                  <td valign="top"> 
                  <$:A service="getSysSubFuns" dynamic="true"/>
                  <$:M dtype="1"/>
                  <$:L name="sub_fun_id" rs="SubFuns" valueField="SUB_FUN_ID" textField="SUB_FUN_NAME" props="multiple style='width:100%;' size=10 multiple" selectRs="RoleSubFuns" selectFieldName="FUN_ID" firstText="请选择..."/>
                  </td>
               </tr>
					<tr>
						<td>
		<$:T var="fun" name="SubFuns">
		  <B><$:C item="fun.SUB_FUN_NAME"/></B>:<$:C item="fun.SUB_FUN_DESC"/><br/>
		</$:T>
						</td>
					</tr>
				</table>
         </FIELDSET>
      </td>
   </tr>
   <tr class="tr_c">
      <td align="center" colspan="4">
			<input type=hidden name="role_id" value='<$:W name="role_id" from="request"/>'>
			<input type=hidden name="table" value='SM_ROLE_FUN'>
			<input type=hidden name="fun_ids">
			<input type=hidden name="sub_fun_ids">
			<input type="button" onClick="submitPremision(this.form)" name="btSubmit" value=<$:I item="html.button.save"/>  >
      </td>
   </tr>
</table>
</form>
</body>
</html>
<script>
function submitPremision(form)
{
	if(form.role_id.value !='')
	{
		var sFunIds ="";
		var sSubFunIds ="";
      for(var i = 0; i < form.fun_id.length; i ++) 
		{
			if(sFunIds =="")
				sFunIds =form.fun_id.options[i].value;
			else
				sFunIds +=","+form.fun_id.options[i].value;
      }
      for(var i = 0; i < form.sub_fun_id.length; i ++) 
		{
			if(form.sub_fun_id[i].selected)
			{
				if(sSubFunIds =="")
					sSubFunIds =form.sub_fun_id.options[i].value;
				else
					sSubFunIds +=","+form.sub_fun_id.options[i].value;
			}
      }
		form.fun_ids.value =sFunIds;
		form.sub_fun_ids.value =sSubFunIds;
		var s=new Server("editSysMoudelData");
		s.setFormData();
		s.send(s, false, function(){
			alert("保存成功！");
			}
		);
	}
	else
		return false;
}
</script>
