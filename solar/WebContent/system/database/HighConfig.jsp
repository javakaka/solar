<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%String[] saFields =null;%>
<$:G title="������߼�����">
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
   <tr class="tr_c"><td class="td_c" height=30>��߼����ã����ý����ϵͳ��̨����ʱ��Ҫ����ִ�еĶ�������<Strong><FONT  COLOR="red">��Ҫ�����ֹ�ˢ�´�ҳ��</FONT></Strong>��</td></tr>
   <tr class="tr_c"><td>������ʾ�������Ӧ����Ϊ��̨������ô��������Ϊ���񣬶�̬����ǰ�� $D-��</td></tr>
   <tr class="tr_c">
      <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="2">
            <tr><td width=99%>
               <table id=table1 width=100% cellpadding="2" cellspacing="1" class="table_c" onMouseDown="Table.click()">
					  <tr class="tr_c">
						   <td width=1% nowrap>Ԫ��</td><td width=1% nowrap>�������</td><td width=1% nowrap>ʱ��˳��</td><td width=1% nowrap>��Ӧ����</td><td nowrap>��������</td>
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
                           <option value='86' <%if(iCompType==86) out.println("selected");%>>��ͨ����</option>
                           <option value='89' <%if(iCompType==92) out.println("selected");%>>��Ӱ�ť</option>
                           <option value='90' <%if(iCompType==90) out.println("selected");%>>��ϸ��ť</option>
                           <option value='91' <%if(iCompType==91) out.println("selected");%>>�޸İ�ť</option>
                           <option value='92' <%if(iCompType==92) out.println("selected");%>>ɾ����ť</option>
                           <option value='92' <%if(iCompType==85) out.println("selected");%>>����ɾ��</option>
                           <option value='88' <%if(iCompType==88) out.println("selected");%>>���水ť</option>
                           <option value='93' <%if(iCompType==93) out.println("selected");%>>��</option>
                           <option value='99' <%if(iCompType==99) out.println("selected");%>>�б�ҳװ��</option>                           
                           <option value='87' <%if(iCompType==87) out.println("selected");%>>�༭ҳ��װ��</option>
									<option value='94' <%if(iCompType==94) out.println("selected");%>>��ϸ��Ϣ��ӡ</option>
                           <option value='95' <%if(iCompType==95) out.println("selected");%>>�б��ӡ</option>
                           <option value='96' <%if(iCompType==96) out.println("selected");%>>���</option>
                           <option value='97' <%if(iCompType==97) out.println("selected");%>>�޸�</option>
                           <option value='98' <%if(iCompType==98) out.println("selected");%>>ɾ��</option>

                           
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
                           <option value='1' <%if(iActionType==1) out.println("selected");%>>���</option>
                           <option value='2' <%if(iActionType==2) out.println("selected");%>>��̨</option>
                           <option value='3' <%if(iActionType==3) out.println("selected");%>>˫��</option>
                           <option value='4' <%if(iActionType==4) out.println("selected");%>>����</option>
                        </SELECT>
                     </td>
						   <td width=1% nowrap>
                        <SELECT NAME="time_seq">
                           <option value='1' <%if(iTimeSeq==1) out.println("selected");%>>ǰ</option>
                           <option value='2' <%if(iTimeSeq==2) out.println("selected");%>>��</option>
                           <option value='3' <%if(iTimeSeq==3) out.println("selected");%>>�滻</option>
                        </SELECT>
                     </td>
						   <td width=1% nowrap>
                        <SELECT NAME="act_type" onChange="onActNameChange(this)">
                           <option value='1' <%if(iActType==1) out.println("selected");%>>��URL</option>
                           <option value='2' <%if(iActType==2) out.println("selected");%>>ִ�з���</option>
                           <option value='3' <%if(iActType==3) out.println("selected");%>>ִ��Javascript</option>
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
            </td><td valign=bottom width=1% nowrap><input type=button value="�������" onClick="addRow()"><input type=button value="ɾ������" onClick="delRow()"></td></tr>
      </table>
      </td>
   </tr>
</table>
</$:G>
<div align=right>
   ����������Javascript���룬��仯��Ӧ������������ֵ�������ִ��JavaScript�������Ʊ���Ҫ�����ţ�����doAction()��<br><input type="button" value=<$:I item="html.button.save"/>  onClick="onSetTopConfig('<$:W name="card" from="request"/>')"><input type="button" name="javas"   value="Javascript"  onClick=onWriteJavascript('<$:W name="card" from="request"/>')>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<input type=hidden name="seq">
<script>
function addRow(){
	var addCell = new Array();
<%
StringBuffer html =new StringBuffer();
html.append("<SELECT NAME='comp_type'><option  value='86'>��ͨ����</option><option  value='89'>��Ӱ�ť</option><option  value='90'>��ϸ��ť</option><option value='91'>�޸İ�ť</option><option value='92'>ɾ����ť</option><option value='85'>����ɾ��</option><option value='88'>���水ť</option><option value='93'>��</option><option value='99'>ҳװ��</option><option value='87'>�༭ҳװ��</option><option value='94'>��ϸ��Ϣ��ӡ</option><option value='95'>�б���Ϣ��ӡ</option><option value='96'>���</option><option value='97'>�޸�</option><option value='98'>ɾ��</option>");
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
	addCell[1] = "<SELECT NAME='action_type'><option value='1'>���</option><option value='2'>��̨</option><option value='3'>˫��</option><option value='4'>����</option>";
	addCell[2] = "<SELECT NAME='time_seq'><option value='1'>ǰ</option><option value='2'>��</option><option value='3'>�滻</option></SELECT>";
	addCell[3] = "<SELECT NAME='act_type' onChange=onActNameChange(this)><option value='1'>��URL</option><option value='2'>ִ�з���</option><option value='3'>ִ��Javascript</option></SELECT>";
	addCell[4] = "<input type='text' style='width:100%' name='act_name'>";
	addCell[5] = "<input type='hidden' name='config_id'>";
	Table.runRowInsert(table1, addCell);
}
function delRow(){
	var oMultiple = getTableMultipleSelected(table1);
	if (oMultiple.length == 0){
		message("     ��ѡ��Ҫɾ���Ĳ�����!     ");
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
			alert("����ɹ���");
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