<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%String[] saFields =null;%>
<$:G title="表操作高级设置">
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
   <tr class="tr_c"><td class="td_c" height=30>表高级设置，设置界面或系统后台操作时需要附加执行的动作。（<Strong><FONT  COLOR="red">不要轻易手工刷新此页面</FONT></Strong>）</td></tr>
   <tr class="tr_c"><td>操作提示：如果响应动作为后台服务，那么动作名称为服务，动态服务前加 $D-。</td></tr>
   <tr class="tr_c">
      <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="2">
            <tr><td width=99%>
               <table id=table1 width=100% cellpadding="2" cellspacing="1" class="table_c" onMouseDown="Table.click()">
					  <tr class="tr_c">
						   <td width=1% nowrap>元件</td><td width=1% nowrap>动作类别</td><td width=1% nowrap>时间顺序</td><td width=1% nowrap>响应动作</td><td nowrap>动作名称</td>
                 </tr>
<$:A service="getPageComponetList" dynamic="false">
   <$:P name="card" from="request"/>
</$:A>
<$:M dtype="1" mode="2"/>
<%
if(ServletUtil.getResult(request,"COMPONENTS") !=null)
{
   StringBuffer html =new StringBuffer();
   DataSet alData =(DataSet)ServletUtil.getResult(request,"COMPONENTS");
   if(alData !=null && alData.size() >0)
   {
      saFields =new String[alData.size()];
      for(int i=0; i<alData.size(); i++)
      {
         Row hmTmp =(Row)alData.get(i);
         saFields[i] =(String)hmTmp.get("VALUE");
      }
   }
}
%>

<$:A service="getTableTopConfig" dynamic="true">
   <$:P name="card" default='<$:W name="card" from="request"/>'/>
</$:A>
<$:M dtype="1" mode="2"/>
<%
if(ServletUtil.getResult(request,"TOPCONFIG") !=null)
{
   StringBuffer html =new StringBuffer();
   DataSet alData =(DataSet)ServletUtil.getResult(request,"TOPCONFIG");
   if(alData !=null && alData.size() >0)
   {
      for(int i=0; i<alData.size(); i++)
      {
         Row hmArray =(Row)alData.get(i);
         String sConfId =(String)hmArray.get("CONFIG_ID", "");
         int iCompType =Integer.parseInt((String)hmArray.get("COMP_TYPE"));
         int iActionType =Integer.parseInt((String)hmArray.get("ACTION_TYPE","0"));
         int iTimeSeq =Integer.parseInt((String)hmArray.get("TIME_SEQ","0"));
         int iActType =Integer.parseInt((String)hmArray.get("ACT_TYPE","0"));
         String sActName =(String)hmArray.get("ACT_NAME","");
      %>
                 <tr class="tr_c">
						   <td width=1% nowrap>
                        <SELECT NAME="comp_type">
                           <option value='86' <%if(iCompType==86) out.println("selected");%>>普通方法</option>
                           <option value='89' <%if(iCompType==92) out.println("selected");%>>添加按钮</option>
                           <option value='90' <%if(iCompType==90) out.println("selected");%>>详细按钮</option>
                           <option value='91' <%if(iCompType==91) out.println("selected");%>>修改按钮</option>
                           <option value='92' <%if(iCompType==92) out.println("selected");%>>删除按钮</option>
                           <option value='92' <%if(iCompType==85) out.println("selected");%>>批量删除</option>
                           <option value='88' <%if(iCompType==88) out.println("selected");%>>保存按钮</option>
                           <option value='93' <%if(iCompType==93) out.println("selected");%>>行</option>
                           <option value='99' <%if(iCompType==99) out.println("selected");%>>列表页装载</option>                           
                           <option value='87' <%if(iCompType==87) out.println("selected");%>>编辑页面装载</option>
									<option value='94' <%if(iCompType==94) out.println("selected");%>>详细信息打印</option>
                           <option value='95' <%if(iCompType==95) out.println("selected");%>>列表打印</option>
                           <option value='96' <%if(iCompType==96) out.println("selected");%>>添加</option>
                           <option value='97' <%if(iCompType==97) out.println("selected");%>>修改</option>
                           <option value='98' <%if(iCompType==98) out.println("selected");%>>删除</option>

                           
<%
if(saFields !=null)
{
   for(int j=0; j<saFields.length; j++)
   {
      String value =String.valueOf(j+1);
	  String select ="";
	  if(saFields[j].indexOf("-") !=-1)
	  {
		 value =saFields[j].substring(0, saFields[j].indexOf("-"));
		 if(String.valueOf(iCompType).equals(value))
			 select ="selected";
      }
	  else if(iCompType ==(j+1))
		 select ="selected";

	  html.append("<option value='"+value+"' "+select+">"+saFields[j]+"</option>");
   }
   out.println(html.toString());
   html.setLength(0);
}
%>
                        </SELECT>
                     </td>
						   <td width=1% nowrap>
                        <SELECT NAME="action_type">
                           <option value='1' <%if(iActionType==1) out.println("selected");%>>点击</option>
                           <option value='2' <%if(iActionType==2) out.println("selected");%>>后台</option>
                           <option value='3' <%if(iActionType==3) out.println("selected");%>>双击</option>
                           <option value='4' <%if(iActionType==4) out.println("selected");%>>链接</option>
                        </SELECT>
                     </td>
						   <td width=1% nowrap>
                        <SELECT NAME="time_seq">
                           <option value='1' <%if(iTimeSeq==1) out.println("selected");%>>前</option>
                           <option value='2' <%if(iTimeSeq==2) out.println("selected");%>>后</option>
                           <option value='3' <%if(iTimeSeq==3) out.println("selected");%>>替换</option>
                        </SELECT>
                     </td>
						   <td width=1% nowrap>
                        <SELECT NAME="act_type" onChange="onActNameChange(this)">
                           <option value='1' <%if(iActType==1) out.println("selected");%>>打开URL</option>
                           <option value='2' <%if(iActType==2) out.println("selected");%>>执行服务</option>
                           <option value='3' <%if(iActType==3) out.println("selected");%>>执行Javascript</option>
                        </SELECT>
                     </td>
                     <td width=99% nowrap>
                        <input type=text style="width:100%" name="act_name" value="<%=sActName%>">
                     </td>
						<input type=hidden name="config_id" value="<%=sConfId%>">
					  </tr>
      <%
      }
   }
   html =null;
}
%>

               </table>
            </td><td valign=bottom width=1% nowrap><input type=button value="添加设置" onClick="addRow()"><input type=button value="删除设置" onClick="delRow()"></td></tr>
      </table>
      </td>
   </tr>
</table>
</$:G>
<div align=right>
   如果不能添加Javascript代码，请变化相应动作的下拉框值，如果是执行JavaScript则动作名称必须要带括号，例如doAction()。<br><input type="button" value=<$:I item="html.button.save"/>  onClick="onSetTopConfig('<$:W name="card" from="request"/>')"><input type="button" name="javas"   value="Javascript"  onClick=onWriteJavascript('<$:W name="card" from="request"/>')>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<input type=hidden name="seq">
<script>
function addRow(){
	var addCell = new Array();
<%
StringBuffer html =new StringBuffer();
html.append("<SELECT NAME='comp_type'><option  value='86'>普通方法</option><option  value='89'>添加按钮</option><option  value='90'>详细按钮</option><option value='91'>修改按钮</option><option value='92'>删除按钮</option><option value='85'>批量删除</option><option value='88'>保存按钮</option><option value='93'>行</option><option value='99'>页装载</option><option value='87'>编辑页装载</option><option value='94'>详细信息打印</option><option value='95'>列表信息打印</option><option value='96'>添加</option><option value='97'>修改</option><option value='98'>删除</option>");
if(saFields !=null)
{
   for(int j=0; j<saFields.length; j++)
   {
	  String value =String.valueOf(j+1);
	  if(saFields[j].indexOf("-") !=-1)
		 value =saFields[j].substring(0, saFields[j].indexOf("-"));
	  html.append("<option value='"+value+"'>"+saFields[j]+"</option>");
   }
}
html.append("</SELECT>");
%>
	addCell[0] = "<%=html.toString()%>";
	addCell[1] = "<SELECT NAME='action_type'><option value='1'>点击</option><option value='2'>后台</option><option value='3'>双击</option><option value='4'>链接</option>";
	addCell[2] = "<SELECT NAME='time_seq'><option value='1'>前</option><option value='2'>后</option><option value='3'>替换</option></SELECT>";
	addCell[3] = "<SELECT NAME='act_type' onChange=onActNameChange(this)><option value='1'>打开URL</option><option value='2'>执行服务</option><option value='3'>执行Javascript</option></SELECT>";
	addCell[4] = "<input type='text' style='width:100%' name='act_name'>";
	addCell[5] = "<input type='hidden' name='config_id'>";
	Table.runRowInsert(table1, addCell);
}
function delRow(){
	var oMultiple = getTableMultipleSelected(table1);
	if (oMultiple.length == 0){
		message("     请选择要删除的参数行!     ");
	}
	for (var i = 0; i < oMultiple.length; i++) {
		table1.deleteRow(oMultiple[i].rowIndex);
	}
}
function onSetTopConfig(card)
{
   var url ="savetopconfig=1&card="+card;
   var comp_type =document.getElementsByName("comp_type");
   var action_type =document.getElementsByName("action_type");
   var act_type =document.getElementsByName("act_type");
   var time_seq =document.getElementsByName("time_seq");
   var act_name =document.getElementsByName("act_name");
   var config_id =document.getElementsByName("config_id");
   var compType='', actionType='',timeSeq='',actType='',actName='',configId='';
   var len =comp_type.length;
   if(len >0)
   {
      for(var i=0; i<comp_type.length -1; i++)
      {
         compType+=comp_type[i].value+",";
         actionType+=action_type[i].value+",";
         timeSeq+=time_seq[i].value+",";
         actType+=act_type[i].value+",";
         actName+=act_name[i].value+",";
         configId+=config_id[i].value+",";
      }
      if(len >0)
      {
         compType+=comp_type[len-1].value;
         actionType+=action_type[len-1].value;
         timeSeq+=time_seq[len-1].value;
         actType+=act_type[len-1].value;
         actName+=act_name[len-1].value+",";
         configId+=config_id[len-1].value;
      }
   }
	var s=new Server("saveTableTopConfig");
	s.setParam("comp_type", compType);
	s.setParam("action_type", actionType);
	s.setParam("time_seq", timeSeq);
	s.setParam("act_type", actType);
	s.setParam("act_name", actName);
	s.setParam("config_id", configId);
	s.setParam("card", card);
	s.send(s, false, function()
		{
			alert("保存成功！");
		}
	);
   /*
	if(compType !="" && actionType !="" && timeSeq !="" && actType !="")
      url +="&comp_type="+compType+"&action_type="+actionType
         +"&time_seq="+timeSeq+"&act_type="+actType+"&act_name="+actName+"&config_id="+configId;
   document.all.sub.src="Save.jsp?"+url;
	*/
}

function onWriteJavascript(card)
{
	if(document.all.seq.value !="")
	{
		var comp_type="",action_type="";
		try
		{
			var handle =document.all.act_name;
			if(handle.length >1)
				comp_type=document.all.comp_type[document.all.seq.value].value;
			else
				comp_type=document.all.comp_type.value;
			
			handle =document.all.action_type;
			if(handle.length >1)
				action_type=document.all.action_type[document.all.seq.value].value;
			else
				action_type=document.all.action_type.value;
		}catch(e)
		{
			alert(e);
		}
		//alert("<%=GlobalUtil._WEB_PATH%>/system/database/editjs.jsp?card="+card+"&comp_type="+comp_type+"&action_type="+action_type);
		$E.runOpen("<%=GlobalUtil._WEB_PATH%>/system/database/EditJs.jsp?card="+card+"&comp_type="+comp_type+"&action_type="+action_type, false, 520,500);
	}
}
function onActNameChange(handle)
{
	var actHandle =document.all.act_type;

	if(actHandle.value =='3')
	{
		document.all.seq.value =0;
	}
	else
	{
		for(i=0; i<actHandle.length; i++)
		{
			if(handle ==actHandle[i] && actHandle[i].value =='3')
			{
				document.all.seq.value =i;
				return;
			}
		}
	}
}
</script>