<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/hidden.js"></script>
<script type="text/javascript" src="/res/tab/local/webfxlayout.js"></script>
<script src="<%=GlobalUtil._WEB_PATH%>/res/js/hidden.js"></script>
<link id="luna-tab-style-sheet" type="text/css" rel="stylesheet" href="<%=GlobalUtil._WEB_PATH%>/res/tab/css/luna/tab.css" disabled="disabled" />
<script type="text/javascript" src="<%=GlobalUtil._WEB_PATH%>/res/tab/js/tabpane.js"></script>
<style type="text/css">

.dynamic-tab-pane-control .tab-page {
	height:		150px;
}

.dynamic-tab-pane-control .tab-page .dynamic-tab-pane-control .tab-page {
	height:		200px;
}

/* over ride styles from webfxlayout */

body {
	margin:		10px;
	width:		auto;
	height:		auto;
}

.dynamic-tab-pane-control h2 {
	text-align:	center;
	width:		auto;
}

.dynamic-tab-pane-control h2 a {
	display:	inline;
	width:		auto;
}
</style>
<script>
var table_ename ='<$:W name="table_ename" from="request" default=""/>';
var secrecy_level ='0';
function onGrant(type)
{
	$E.runOpen('<%=GlobalUtil._WEB_PATH%>/system/database/SelectStaff.jsp?TABLE_ENAME='+table_ename+'&PREM_TYPE='+type,true, 520, 480);
	document.location.reload();
}
function setTablePremission()
{
   for(var i=0; i<document.all.shareflag.length; i++)
   {
      if(document.all.shareflag[i].checked)
      {
			 var s=new Server("saveTablePremission", 1);
			 s.setParam("table_ename", table_ename);
			 s.setParam("secrecy_level", document.all.shareflag[i].value);
			 s.send(s, false, function(){
				alert("���ݱ��ܼ������óɹ���");
			  }
			 );			//document.all.sub.src="Save.jsp?table_ename="+table_ename+"&secrecy_level="+document.all.shareflag[i].value+"&savepremission=1";
         return ;         
      }
   }
}
function initPage()
{
   for(var i=0; i<document.all.shareflag.length; i++)
   {
      if(document.all.shareflag[i].value ==secrecy_level)
      {
         document.all.shareflag[i].checked =true;
      }
   }
}
</script>
<$:A service="getTableInfo" dynamic="true">
   <$:P name="table_ename" from="request"/>
</$:A>
<$:M dtype="1"/>
<$:T var="Table" name="TableInfo" fieldNum="5">
   <script>
      secrecy_level ='<$:C item="Table.secrecy_level"/>';
   </script>
</$:T>
<body onLoad="initPage()">
<script type="text/javascript">
   //<![CDATA[
   function setLinkSrc( sStyle ) {
      document.getElementById( "luna-tab-style-sheet" ).disabled = sStyle != "luna";
      //document.getElementById( "webfx-tab-style-sheet" ).disabled = sStyle != "webfx"
      //document.getElementById( "winclassic-tab-style-sheet" ).disabled = sStyle != "winclassic"
      
      document.documentElement.style.background = 
      document.body.style.background = sStyle == "luna" ? "white" : "ThreeDFace";	
   }
   setLinkSrc( "luna" );
   //]]>
</script>

<$:G title="������Ȩ������">
<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%>
  <tr bgcolor=#FFFFFF>
    <td align="right" valign=top nowrap>���ݱ��ܼ���</td>
    <td>
      <form method="POST">
		<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
			<tr bgcolor=#FFFFFF><td><input type="radio" value="0" name="shareflag" id=radio1 class="radio"><label for=radio1 style="cursor:hand"><font color="#FF0000"><b>����</b></font></label>��������Ȩ�޵��˿���������ġ�ɾ�����鿴�κ�����<br>
			<input type="radio" value="1" checked name="shareflag" id=radio2 class="radio"><label for=radio2 style="cursor:hand"><font color="#FF0000"><b>��λ�ߵ�</b></font></label>��Ȩ�޸߿��Բ���Ȩ�޵׵��˵����ݡ�Ȩ�޵ĸߵ�ͨ����λ���ͽṹ���жϣ������ܾ�����Բ����ܾ����λ�����ܾ�����������ݡ�<br>
			<input type="radio" value="2" checked name="shareflag" id=radio3 class="radio"><label for=radio3 style="cursor:hand"><font color="#FF0000"><b>���Ÿߵ�</b></font></label>��Ȩ�޸߿��Բ���Ȩ�޵׵��˵����ݡ�Ȩ�޵ĸߵ�ͨ���������ͽṹ���жϣ����缼�����ŵ��˿��Բ����������������з����ŵ����ݡ�<br>
			<input type="radio" value="3"  name="shareflag" id=radio4 class="radio"><label for=radio4 style="cursor:hand"><font color="#FF0000"><b>˽��</b></font></label>���κα�����Ȩ�޵��˽������Բ鿴�����ġ�ɾ�����Լ�����������<br>
			<input type="radio" value="4"  name="shareflag" id=radio5 class="radio"><label for=radio5 style="cursor:hand"><font color="#FF0000"><b>�Զ���</b></font></label>�����ɶ�������Ȩ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href=""><font color=red>����</font></a>]
			</td></tr>
			<tr bgcolor=#FFFFFF><td align=center><input type=button   value="����ȷ��" onClick="setTablePremission()"></td></tr>
			</table>
      </form>
      </td>
   </tr>
  </tr>
  <tr bgcolor=#FFFFFF>
    <td align="right" valign=top nowrap>���ݲ�����</td>
    <td>
   <$:A service="getTableGrant" dynamic="false">
      <$:P name="table_ename" from="request"/>
   </$:A>
   <$:M dtype="1"/>
   <%
      DataSet alTableGrant =null;
      if(ServletUtil.getResult(request,"TABLE_GRANT") !=null)
         alTableGrant =(DataSet)ServletUtil.getResult(request,"TABLE_GRANT");
      Row queryHtml =new Row();
      Row addHtml =new Row();
      Row updateHtml =new Row();
      Row deleteHtml =new Row();
      Row batchDeleteHtml =new Row();
      Row listHtml =new Row();
      Row detailHtml =new Row();
      Row expHtml =new Row();
      Row impHtml =new Row();
      Row listPrintHtml =new Row();
      Row detailPrintHtml =new Row();
		Row copyHtml =new Row();
		Row saveHtml =new Row();
      String html ="";
      if(alTableGrant !=null && alTableGrant.size() >0)
         for(int i=0; i<alTableGrant.size(); i++)
         {
            Row hmGrant =(Row)alTableGrant.get(i);   
            int iPremType =Integer.parseInt(hmGrant.get("PREM_TYPE").toString());
            String sGrantType =hmGrant.get("GRANT_TYPE").toString();
            switch(iPremType)
            {
               case 0://��ѯ
                  html=queryHtml.get(sGrantType)==null?"":queryHtml.get(sGrantType).toString();
                  queryHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 1://���
                  html=addHtml.get(sGrantType)==null?"":addHtml.get(sGrantType).toString();
                  addHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 2://�޸�
                  html=updateHtml.get(sGrantType)==null?"":updateHtml.get(sGrantType).toString();
                  updateHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 3://ɾ��
                  html=deleteHtml.get(sGrantType)==null?"":deleteHtml.get(sGrantType).toString();
                  deleteHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 12://����ɾ��
                  html=batchDeleteHtml.get(sGrantType)==null?"":batchDeleteHtml.get(sGrantType).toString();
                  batchDeleteHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 4://��ϸ��Ϣ
                  html=detailHtml.get(sGrantType)==null?"":detailHtml.get(sGrantType).toString();
                  detailHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 5://�б�
                  html=listHtml.get(sGrantType)==null?"":listHtml.get(sGrantType).toString();
                  listHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 6://����Excel
                  html=expHtml.get(sGrantType)==null?"":expHtml.get(sGrantType).toString();
                  expHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 7://����Excel
                  html=impHtml.get(sGrantType)==null?"":impHtml.get(sGrantType).toString();
                  impHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 8://�б��ӡ
                  html=listPrintHtml.get(sGrantType)==null?"":listPrintHtml.get(sGrantType).toString();
                  listPrintHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 9://�����ӡ
                  html=detailPrintHtml.get(sGrantType)==null?"":detailPrintHtml.get(sGrantType).toString();
                  detailPrintHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 10://����copy
                  html=copyHtml.get(sGrantType)==null?"":copyHtml.get(sGrantType).toString();
                  copyHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 11://ҳ�����
                  html=saveHtml.get(sGrantType)==null?"":saveHtml.get(sGrantType).toString();
                  saveHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
            }
         }
   %>
      <table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%>
      <tr bgcolor=#FFFFFF>
			<td><strong>��ѡ������������ݲ���Ȩ�޵���Ա����</strong></td>
		</tr>
		<tr bgcolor=#FFFFFF>
			<td>[<input type=button value="������Ȩ" onClick="onGrantCommonPremission()">(�ѳ��õĹ�����Ȩ��ϵͳ�����ˣ����а����б����ӡ��޸ġ�ɾ������ѯ)]</td>
		</tr>
		<tr bgcolor=#FFFFFF>
         <td align=center colspan=2>
            <div class="tab-pane" id="tabPane1">
               <script type="text/javascript">
                  tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ));
               </script>
               <div class="tab-page" id="tabPage1">
                  <h2 class="tab">��ѯ</h2>
		            <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(0)"></td>
                     </tr>
                     <%
                     if(queryHtml !=null && queryHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=queryHtml.get("1")==null?"":queryHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=queryHtml.get("2")==null?"":queryHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=queryHtml.get("3")==null?"":queryHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=queryHtml.get("4")==null?"":queryHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=queryHtml.get("5")==null?"":queryHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=queryHtml.get("6")==null?"":queryHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=50 height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage2">
                  <h2 class="tab">���</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(1)"></td>
                     </tr>
                     <%
                     if(addHtml !=null && addHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=addHtml.get("1")==null?"":addHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=addHtml.get("2")==null?"":addHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=addHtml.get("3")==null?"":addHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=addHtml.get("4")==null?"":addHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=addHtml.get("5")==null?"":addHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=addHtml.get("6")==null?"":addHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage3">
                  <h2 class="tab">�޸�</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );</script>

                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(2)"></td>
                     </tr>
                     

                     <%
                     if(updateHtml !=null && updateHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=updateHtml.get("1")==null?"":updateHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=updateHtml.get("2")==null?"":updateHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=updateHtml.get("3")==null?"":updateHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=updateHtml.get("4")==null?"":updateHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=updateHtml.get("5")==null?"":updateHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=updateHtml.get("6")==null?"":updateHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100 height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage4">
                  <h2 class="tab">ɾ��</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(3)"></td>
                     </tr>
                     

                        <%
                        if(deleteHtml !=null && deleteHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=deleteHtml.get("1")==null?"":deleteHtml.get("1")%></td>
                           <td valign=top>���ţ�<%=deleteHtml.get("2")==null?"":deleteHtml.get("2")%></td>
                           <td valign=top>��ɫ��<%=deleteHtml.get("3")==null?"":deleteHtml.get("3")%></td>
                           <td valign=top>Ⱥ�壺<%=deleteHtml.get("4")==null?"":deleteHtml.get("4")%></td>
                           <td valign=top>��Ա��<%=deleteHtml.get("5")==null?"":deleteHtml.get("5")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=deleteHtml.get("6")==null?"":deleteHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage13">
                  <h2 class="tab">����ɾ��</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage13" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(12)"></td>
                     </tr>
                     

                        <%
                        if(batchDeleteHtml !=null && batchDeleteHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=batchDeleteHtml.get("1")==null?"":batchDeleteHtml.get("1")%></td>
                           <td valign=top>���ţ�<%=batchDeleteHtml.get("2")==null?"":batchDeleteHtml.get("2")%></td>
                           <td valign=top>��ɫ��<%=batchDeleteHtml.get("3")==null?"":batchDeleteHtml.get("3")%></td>
                           <td valign=top>Ⱥ�壺<%=batchDeleteHtml.get("4")==null?"":batchDeleteHtml.get("4")%></td>
                           <td valign=top>��Ա��<%=batchDeleteHtml.get("5")==null?"":batchDeleteHtml.get("5")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=batchDeleteHtml.get("6")==null?"":batchDeleteHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage5">
                  <h2 class="tab">��ϸ��Ϣ</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage5" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(4)"></td>
                     </tr>
                     

                     <%
                     if(detailHtml !=null && detailHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=detailHtml.get("1")==null?"":detailHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=detailHtml.get("2")==null?"":detailHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=detailHtml.get("3")==null?"":detailHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=detailHtml.get("4")==null?"":detailHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=detailHtml.get("5")==null?"":detailHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=detailHtml.get("6")==null?"":detailHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage6">
                  <h2 class="tab">�б�</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage6" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                            <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(5)"></td>
                        </tr>
                           <%
                           if(listHtml !=null && listHtml.size() >0)
                           {
                           %><tr bgcolor=#FFFFFF><td>
                              <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                              <td valign=top>ְλ��<%=listHtml.get("1")==null?"":listHtml.get("1")%></td>
                              <td valign=top>���ţ�<%=listHtml.get("2")==null?"":listHtml.get("2")%></td>
                              <td valign=top>��ɫ��<%=listHtml.get("3")==null?"":listHtml.get("3")%></td>
                              <td valign=top>Ⱥ�壺<%=listHtml.get("4")==null?"":listHtml.get("4")%></td>
                              <td valign=top>��Ա��<%=listHtml.get("5")==null?"":listHtml.get("5")%></td>
                              <td valign=top>Ȩ�޵ȼ���<%=listHtml.get("6")==null?"":listHtml.get("6")%></td>
                              </tr></table>
                              </td></tr>
                           <%
                           }
                           else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                           %>
                     </table>
               </div>
               <div class="tab-page" id="tabPage7">
                  <h2 class="tab">����Excel</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage7" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(6)"></td>
                     </tr>
                     

                     <%
                     if(expHtml !=null && expHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=expHtml.get("1")==null?"":expHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=expHtml.get("2")==null?"":expHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=expHtml.get("3")==null?"":expHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=expHtml.get("4")==null?"":expHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=expHtml.get("5")==null?"":expHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=expHtml.get("6")==null?"":expHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage8">
                  <h2 class="tab">����Excel</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage8" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(7)"></td>
                     </tr>
                     

                     <%
                     if(impHtml !=null && impHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=impHtml.get("1")==null?"":impHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=impHtml.get("2")==null?"":impHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=impHtml.get("3")==null?"":impHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=impHtml.get("4")==null?"":impHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=impHtml.get("5")==null?"":impHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=impHtml.get("6")==null?"":impHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage9">
                  <h2 class="tab">�б��ӡ</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage9" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(8)"></td>
                     </tr>
                     
                     <%
                     if(listPrintHtml !=null && listPrintHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>ְλ��<%=listPrintHtml.get("1")==null?"":listPrintHtml.get("1")%></td>
                        <td valign=top>���ţ�<%=listPrintHtml.get("2")==null?"":listPrintHtml.get("2")%></td>
                        <td valign=top>��ɫ��<%=listPrintHtml.get("3")==null?"":listPrintHtml.get("3")%></td>
                        <td valign=top>Ⱥ�壺<%=listPrintHtml.get("4")==null?"":listPrintHtml.get("4")%></td>
                        <td valign=top>��Ա��<%=listPrintHtml.get("5")==null?"":listPrintHtml.get("5")%></td>
                        <td valign=top>Ȩ�޵ȼ���<%=listPrintHtml.get("6")==null?"":listPrintHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage10">
                  <h2 class="tab">��ϸ��Ϣ��ӡ</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage10" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(9)">
                        </tr>
                        

                        <%
                        if(detailPrintHtml !=null && detailPrintHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=detailPrintHtml.get("1")==null?"":detailPrintHtml.get("1")%></td>
                           <td valign=top>���ţ�<%=detailPrintHtml.get("2")==null?"":detailPrintHtml.get("2")%></td>
                           <td valign=top>��ɫ��<%=detailPrintHtml.get("3")==null?"":detailPrintHtml.get("3")%></td>
                           <td valign=top>Ⱥ�壺<%=detailPrintHtml.get("4")==null?"":detailPrintHtml.get("4")%></td>
                           <td valign=top>��Ա��<%=detailPrintHtml.get("5")==null?"":detailPrintHtml.get("5")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=detailPrintHtml.get("6")==null?"":detailPrintHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                     </table>               
               </div>
               <div class="tab-page" id="tabPage11">
                  <h2 class="tab">ҳ�濽��</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage11" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(10)">
                        </tr>
                        

                        <%
                        if(copyHtml !=null && copyHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=copyHtml.get("1")==null?"":copyHtml.get("1")%></td>
                           <td valign=top>���ţ�<%=copyHtml.get("2")==null?"":copyHtml.get("2")%></td>
                           <td valign=top>��ɫ��<%=copyHtml.get("3")==null?"":copyHtml.get("3")%></td>
                           <td valign=top>Ⱥ�壺<%=copyHtml.get("4")==null?"":copyHtml.get("4")%></td>
                           <td valign=top>��Ա��<%=copyHtml.get("5")==null?"":copyHtml.get("5")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=copyHtml.get("6")==null?"":copyHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                     </table>               
               </div>
               <div class="tab-page" id="tabPage12">
                  <h2 class="tab">ҳ�����</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage12" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(11)">
                        </tr>
                        

                        <%
                        if(saveHtml !=null && saveHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=saveHtml.get("1")==null?"":saveHtml.get("1")%></td>
                           <td valign=top>���ţ�<%=saveHtml.get("2")==null?"":saveHtml.get("2")%></td>
                           <td valign=top>��ɫ��<%=saveHtml.get("3")==null?"":saveHtml.get("3")%></td>
                           <td valign=top>Ⱥ�壺<%=saveHtml.get("4")==null?"":saveHtml.get("4")%></td>
                           <td valign=top>��Ա��<%=saveHtml.get("5")==null?"":saveHtml.get("5")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=saveHtml.get("6")==null?"":saveHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                     </table>               
               </div>
					<!--Ԫ��Ȩ��-->
					<$:A service="getComponentAuth" dynamic="false">
						<$:P name="table_ename" from="request"/>
					</$:A>
					<$:M dtype="1"/>
					<%
					if(ServletUtil.getResult(request,"COMPONENT") !=null)
					{
						DataSet alComp =(DataSet)ServletUtil.getResult(request,"COMPONENT");
						for(int i=0; i<alComp.size(); i++)
						{
							Row hmTmp =(Row)alComp.get(i);
							%>
							<div class="tab-page" id="tabPage10">
								<h2 class="tab"><%=hmTmp.get("COMPONENT_VALUE")%></h2>
								<script type="text/javascript">tp1.addTabPage( document.getElementById( 'tabPage<%=hmTmp.get("COMPONENT_ID")%>' ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...��Ա����..." onClick="onGrant(<%=hmTmp.get("COMPONENT_ID")%>)">
                        </tr>


                        <%
                        if(hmTmp.get("POSI") !=null || hmTmp.get("SITE") !=null
								|| hmTmp.get("ROLE") !=null || hmTmp.get("GROUP") !=null
								|| hmTmp.get("STAFF") !=null || hmTmp.get("AUTH") !=null)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>ְλ��<%=hmTmp.get("POSI")==null?"":hmTmp.get("POSI")%></td>
                           <td valign=top>���ţ�<%=hmTmp.get("SITE")==null?"":hmTmp.get("SITE")%></td>
                           <td valign=top>��ɫ��<%=hmTmp.get("ROLE")==null?"":hmTmp.get("ROLE")%></td>
                           <td valign=top>Ⱥ�壺<%=hmTmp.get("GROUP")==null?"":hmTmp.get("GROUP")%></td>
                           <td valign=top>��Ա��<%=hmTmp.get("STAFF")==null?"":hmTmp.get("STAFF")%></td>
                           <td valign=top>Ȩ�޵ȼ���<%=hmTmp.get("AUTH")==null?"":hmTmp.get("AUTH")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>û������</td></tr>");
                        %>
                     </table>               

							</div>							
							<%
						}
					}
					%>
            </div>
         </td>
      </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">
//<![CDATA[
setupAllTabs();
//]]>

function onGrantCommonPremission()
{
	var s =new Server("grantCommonPremission");
	s.setParamValue("default", "card", $E.getParameter("table_ename"));
	if(s.send(s, true))
	{
		alert("�����ɹ���");
		document.location.reload();
	}
}
</script>

</$:G>
</body>
