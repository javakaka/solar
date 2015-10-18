<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script language="javascript">
function url(page)
{
   document.all.sub.src =page;
}
function onDelFun()
{
   if(document.fun.fun_id.value =="")
   {
      $E.message("没有选择有效的记录!");
   }else{
      if(confirm("注意,此操作将删掉其所有子菜单,谨慎操作!"))
      {
         document.fun.operate.value="2";
			var s=new Server("editFrameMoudelData");
			s.setParam("table", "sm_fun");
			s.setFormData(fun);
			s.send(s, false, function(){
				alert("删除成功！");
				$E.reload();
			}
			);		
      }
   }
}
function row()
{
   try
   {
      Table.click();
      var fun_id =Table.clickRow("tabMain").FUN_ID;
      if(fun_id !="" && typeof fun_id !='undefined')
      {
         document.fun.fun_id.value =fun_id;
         document.fun.fun_name.value =Table.clickRow("tabMain").FUN_NAME;
         if(typeof Table.clickRow("tabMain").FUN_ENAME !='undefined')
            document.fun.fun_ename.value =Table.clickRow("tabMain").FUN_ENAME;
         else 
            document.fun.fun_ename.value ="";
         if(typeof Table.clickRow("tabMain").WIN_ID !='undefined')
            document.fun.win_id.value =Table.clickRow("tabMain").WIN_ID;
         if(typeof Table.clickRow("tabMain").PARAM !='undefined')
            document.fun.param.value =Table.clickRow("tabMain").PARAM;
         else
            document.fun.param.value ="";
         document.fun.level_index.value =Table.clickRow("tabMain").LEVEL_INDEX;
         if(typeof Table.clickRow("tabMain").FUN_DESC !='undefined')
         {
            document.fun.fun_desc.value =Table.clickRow("tabMain").FUN_DESC;
         }
         if(typeof Table.clickRow("tabMain").UP_FUN_ID !='undefined')
         {
            document.fun.up_fun_id.value =Table.clickRow("tabMain").UP_FUN_ID;
         }
         if(typeof Table.clickRow("tabMain").QUICK_TAB !='undefined')
            document.fun.quick_tab.value =Table.clickRow("tabMain").QUICK_TAB;
         if(typeof Table.clickRow("tabMain").STATE !='undefined')
            document.fun.state.value =Table.clickRow("tabMain").STATE;
         if(typeof Table.clickRow("tabMain").WIN_MODE !='undefined')
         document.fun.win_mode.value =Table.clickRow("tabMain").WIN_MODE;
            document.all.ico_src.src='<%=GlobalUtil._WEB_PATH%>/upload/ico/'+Table.clickRow("tabMain").ICO_NAME;
         if(typeof Table.clickRow("tabMain").ICO_NAME !='undefined')
			{
            document.fun.ico_name.value =Table.clickRow("tabMain").ICO_NAME;
				document.all.ico_src.src =WEB_PATH +document.fun.ico_name.value;
         }
			else
            document.fun.ico_name.value ='';
         document.fun.operate.value="1";
         document.all.del.disabled=false;
      }
      else
      {
         document.fun.fun_id.value ="";
         document.all.del.disabled=true;
      }
   }
   catch(e){}
   //$E.message(document.fun.operate.value);
}
function selWin(form)
{
   var features ="dialogHeight = 490px; dialogWidth = 600px; help: no; status: no;";//Modal Dialog Window feature
   var sQueryString ="?file=<%=GlobalUtil._WEB_PATH%>/system/premission/WindowF.jsp";
   if(form.win_id.value !="")
      sQueryString +="&win_id="+form.win_id.value;
   var arrOutArgs = window.showModalDialog("../../common/DialogFram.jsp"+sQueryString, null, features);
   if (arrOutArgs != null)
   {
      document.fun.win_id.value=arrOutArgs[0];
   }
}
function onSubmitMe(form)
{
   if(checkForm(form))
   {
      if(form.win_id.value !=null && form.win_id.value !='' && form.win_id.value !='0')
      {
         if(form.win_mode.value =='')
         {
            $E.message("请选择一种打开窗口的方式");
            form.win_mode.focus();
            return false;
         }
      }
      else
         form.win_mode.value='';
		var s=new Server("editFrameMoudelData");
		s.setParam("table", "sm_fun");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("保存成功！");
			$E.reload();
		}
		);		
   }
}
</script>
 <$:G title="fun.list" from="4"> 
<table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%" onClick="row()"> 
   <tr> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.fun_id"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.fun_name"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.win_id"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.level_index"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.state"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.fun_desc"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.quick_tab"/></td> 
    <td class="td_c" width=1% nowrap><$:I item="sm_fun.win_mode"/></td> 
    <!-- <td class="td_c" width=1% nowrap><$:I item="tsm_fun.child_count"/></td>
		<td class="td_c" width=1% nowrap><$:I item="tsm_fun.child_max_len"/></td>
		<td class="td_c" nowrap><$:I item="tsm_fun.ico_name"/></td>
		<td class="td_c" width=1% nowrap><$:I item="tsm_fun.param"/></td> --> 
  </tr> 
 </table>
 <div id="idDivPage"/>
</$:G> 
<$:G title="fun.edit" from="4"> 
  <form name="fun"> 
    <table name="tabMain" cellpadding="2" cellspacing="1" class="table_c" width="100%"> 
    <tr class="tr_c"> 
        <td  width=1% nowrap colspan=1> <$:I item="System.premission.fun_name"/> </td> 
        <td width=1% nowrap colspan=2><input name="fun_name" ></td> 
        <td  width=1% nowrap> <$:I item="sm_fun.quick_tab"/> 
        <input name="quick_tab" size=2> 
        <$:I item="sm_fun.state"/> <$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="STATE"/>
			 </$:A> <$:M dtype="1"/> <$:L name="state" rs="STATE" valueField="used_view" value="1" 	textField="disp_view" textReplace="[0,禁用][1,起用]"/> <$:A service="getSysValidFuns" dynamic="true"/> <$:M dtype="1"/> <$:L name="up_fun_id" rs="Funs" valueField="fun_id"	textField="fun_name"len="2" firstText="请选择..." firstValue="0"/> </td> 
      </tr> 
    <tr class="tr_c"> 
        <td  width=1% nowrap> 菜单英文名 </td> 
        <td width=1% nowrap colspan=3> <input name="fun_ename" > </td> 
      </tr> 
    <tr class="tr_c"> 
        <td  width=1% nowrap height=32 valign="center" colspan=1> <$:I item="sm_fun.ico_name"/> </td> 
        <td colspan=1 valign="center" align="right" height=32>
			<img name="ico_src" style="cursor:hand" width="45" height="45" onClick="onSetFunImg(this)">
			</td> 
		<td colspan="2">&nbsp;</td>
     </tr> 
        <tr class="tr_c"> 
        <td  width=1% nowrap> <$:I item="sm_fun.param"/> </td> 
        <td colspan=3  width=1% nowrap><input name="param" size=40> 
            <$:I item="sm_fun.level_index"/> 
            <input name="level_index" size=2 desc='<$:I item="sm_fun.level_index"/>' datatype="number"></td> 
      </tr> 
    <tr class="tr_c"> 
        <td  width=1% nowrap> <$:I item="sm_fun.win_id"/> </td> 
        <td colspan=3 width=1% nowrap><input name="win_id" size=10> 
        <input type="button" onclick="selWin(this.form);" name="selwin" class="button" value="..."> 
        <$:I item="sm_fun.win_mode"/> <$:A service="getSysDictoryItems" dynamic="false">
				<$:P name="item" value="WIN_MODE"/>
			 </$:A> <$:M dtype="1"/> <$:L name="win_mode" rs="WIN_MODE" valueField="used_view" textField="disp_view" firstText="请选择..." /> </td> 
      </tr> 
    <tr class="tr_c"> 
        <td  width=1% nowrap> <$:I item="sm_fun.fun_desc"/> </td> 
        <td colspan=3 width=1% nowrap><input name="fun_desc" size=60></td> 
      </tr> 
  </table> 
  <tr class="tr_c"> 
    <td height=30 valign=top align=center colspan=4><input type="button" value=<$:I item="html.button.reset"/> 
       onClick="this.form.reset();this.form.del.disabled=true;"><input type="button" name="btSubmit" value=<$:I item="html.button.save"/> onClick="onSubmitMe(this.form)"><input type=button value=<$:I item="html.button.add"/>  onClick="document.fun.reset();document.fun.fun_name.focus();"><input type=button onClick ="onDelFun();" value=<$:I item="html.button.del"/>  name="del" disabled>
	</td> 
  </tr> 
  <script>
            var upfunid =$E.getParameter("fun_id", "0");
            if(upfunid !='')
               $S("up_fun_id", upfunid);
         </script> 
  <input name="fun_id" type=hidden value='<$:W name="fun_id" from="request" default="0"/>'> 
  <input type=hidden name="table" value="SM_FUN"> 
  <input type=hidden name="operate" value="0"> 
  <input type="hidden" name="ico_name">
    </form> 
</$:G> 
<script>
var oServer =null;
var iPagesize=10;

function getFuns()
{
	oServer=new Server("getSysFuns", 1);
	oServer.setParam("currentpage", "1");
	oServer.setParam("pagesize", iPagesize);
	var sUpFunId =$E.getParameter("fun_id");
	if(sUpFunId =="")
		sUpFunId ="0";
	oServer.setParam("up_fun_id", sUpFunId);
	onAction(oServer);
}

function toPage(sName, iPage, iPagesize, iSum)
{
	oServer.toPage(iPage, onAction);
}
function onAction(s)
{
	s.send(s, false, function()
		{
			Table.clear(tabMain);
			var oResult =s.getResult("Funs");
			if(oResult !=null)
			{
				var iRows =oResult.getRows();
				for(i=1; i<=iRows; i++)
				{
					var oRow =tabMain.insertRow();
					oRow.className ="tr_c";
					oRow.align="center";
					//fun.FUN_ID,WIN_ID,FUN_NAME,FUN_ENAME,PARAM,LEVEL_INDEX,LEVEL_INDEX,QUICK_TAB,CHILD_COUNT,CHILD_MAX_LEN,CCHILD_MAX_LEN,ICO_NAME,FUN_DESC,WIN_MODE,STATE,UP_FUN_ID
					oRow.FUN_ID =oResult.get(i, "FUN_ID");
					oRow.WIN_ID =oResult.get(i, "WIN_ID");
					oRow.FUN_NAME =oResult.get(i, "FUN_NAME");
					oRow.FUN_ENAME =oResult.get(i, "FUN_ENAME");
					oRow.PARAM =oResult.get(i, "PARAM");
					oRow.LEVEL_INDEX =oResult.get(i, "LEVEL_INDEX");
					oRow.QUICK_TAB =oResult.get(i, "QUICK_TAB");
					oRow.CHILD_COUNT =oResult.get(i, "CHILD_COUNT");
					oRow.CHILD_MAX_LEN =oResult.get(i, "CHILD_MAX_LEN");
					oRow.ICO_NAME =oResult.get(i, "ICO_NAME");
					oRow.FUN_DESC =oResult.get(i, "FUN_DESC");
					oRow.WIN_MODE =oResult.get(i, "WIN_MODE");
					oRow.STATE =oResult.get(i, "STATE");
					oRow.UP_FUN_ID =oResult.get(i, "UP_FUN_ID");

					Table.insertCell(oRow, "<a href='<%=request.getRequestURI()%>?fun_id="+oResult.get(i, "FUN_ID")+"&up_fun_id="+oResult.get(i, "UP_FUN_ID")+"'>"+oResult.get(i, "FUN_ID")+"</a>");
					Table.insertCell(oRow, "<a href='<%=request.getRequestURI()%>?fun_id="+oResult.get(i, "FUN_ID")+"&up_fun_id="+oResult.get(i, "UP_FUN_ID")+"'>"+oResult.get(i, "FUN_NAME")+"</a>");
					Table.insertCell(oRow, oResult.get(i, "WIN_ID"));
					Table.insertCell(oRow, oResult.get(i, "LEVEL_INDEX"));
					var sState =oResult.get(i, "STATE");
					if(sState ==0)
						sState ="禁用";
					else
						sState ="启用";
					Table.insertCell(oRow, sState);
					Table.insertCell(oRow, oResult.get(i, "FUN_DESC"));
					Table.insertCell(oRow, oResult.get(i, "QUICK_TAB"));
					var sWinMode =oResult.get(i, "WIN_MODE");
					if(sWinMode ==0)
						sWinMode ="当前窗口";
					else if(sState ==1)
						sWinMode ="窗口指定帧";
					else
						sWinMode ="新开窗口";
					Table.insertCell(oRow, oResult.get(i, sWinMode));
				}
			}
			//s.setPage(idDivPage, "Funs");
		}
	);
}
getFuns();

var _FUN_IMG =null;
var _LAY_ID =null; 
function onSetFunImg(handle)
{
	_FUN_IMG =handle;
	var src = WEB_PATH + "/system/premission/StockIco.jsp";
	var oLayer = new Layer('选择小图片',src,0, 300, 550);
	_LAY_ID =oLayer.id;
	oLayer.show();
}

function setImg(img)
{
	if(_FUN_IMG !=null && img !="")
	{
		_FUN_IMG.src =WEB_PATH +img;
		document.all.ico_name.value =img;
		closeLayer();
	}
}
</script>