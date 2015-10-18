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
				alert("数据保密级别设置成功！");
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

<$:G title="表数据权限设置">
<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%>
  <tr bgcolor=#FFFFFF>
    <td align="right" valign=top nowrap>数据保密级别：</td>
    <td>
      <form method="POST">
		<table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
			<tr bgcolor=#FFFFFF><td><input type="radio" value="0" name="shareflag" id=radio1 class="radio"><label for=radio1 style="cursor:hand"><font color="#FF0000"><b>共享</b></font></label>：被赋予权限的人可以随意更改、删除、查看任何数据<br>
			<input type="radio" value="1" checked name="shareflag" id=radio2 class="radio"><label for=radio2 style="cursor:hand"><font color="#FF0000"><b>岗位高低</b></font></label>：权限高可以操作权限底的人的数据。权限的高低通过岗位树型结构来判断，例如总经理可以操作总经理岗位下面总经理助理的数据。<br>
			<input type="radio" value="2" checked name="shareflag" id=radio3 class="radio"><label for=radio3 style="cursor:hand"><font color="#FF0000"><b>部门高低</b></font></label>：权限高可以操作权限底的人的数据。权限的高低通过部门树型结构来判断，例如技术部门的人可以操作技术部门下面研发部门的数据。<br>
			<input type="radio" value="3"  name="shareflag" id=radio4 class="radio"><label for=radio4 style="cursor:hand"><font color="#FF0000"><b>私有</b></font></label>：任何被赋予权限的人仅仅可以查看、更改、删除由自己创建的数据<br>
			<input type="radio" value="4"  name="shareflag" id=radio5 class="radio"><label for=radio5 style="cursor:hand"><font color="#FF0000"><b>自定义</b></font></label>：自由定义数据权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href=""><font color=red>定义</font></a>]
			</td></tr>
			<tr bgcolor=#FFFFFF><td align=center><input type=button   value="保密确认" onClick="setTablePremission()"></td></tr>
			</table>
      </form>
      </td>
   </tr>
  </tr>
  <tr bgcolor=#FFFFFF>
    <td align="right" valign=top nowrap>数据操作：</td>
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
               case 0://查询
                  html=queryHtml.get(sGrantType)==null?"":queryHtml.get(sGrantType).toString();
                  queryHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 1://添加
                  html=addHtml.get(sGrantType)==null?"":addHtml.get(sGrantType).toString();
                  addHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 2://修改
                  html=updateHtml.get(sGrantType)==null?"":updateHtml.get(sGrantType).toString();
                  updateHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 3://删除
                  html=deleteHtml.get(sGrantType)==null?"":deleteHtml.get(sGrantType).toString();
                  deleteHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 12://批量删除
                  html=batchDeleteHtml.get(sGrantType)==null?"":batchDeleteHtml.get(sGrantType).toString();
                  batchDeleteHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 4://详细信息
                  html=detailHtml.get(sGrantType)==null?"":detailHtml.get(sGrantType).toString();
                  detailHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 5://列表
                  html=listHtml.get(sGrantType)==null?"":listHtml.get(sGrantType).toString();
                  listHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 6://导出Excel
                  html=expHtml.get(sGrantType)==null?"":expHtml.get(sGrantType).toString();
                  expHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 7://导入Excel
                  html=impHtml.get(sGrantType)==null?"":impHtml.get(sGrantType).toString();
                  impHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 8://列表打印
                  html=listPrintHtml.get(sGrantType)==null?"":listPrintHtml.get(sGrantType).toString();
                  listPrintHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 9://详情打印
                  html=detailPrintHtml.get(sGrantType)==null?"":detailPrintHtml.get(sGrantType).toString();
                  detailPrintHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 10://拷贝copy
                  html=copyHtml.get(sGrantType)==null?"":copyHtml.get(sGrantType).toString();
                  copyHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
               case 11://页面另存
                  html=saveHtml.get(sGrantType)==null?"":saveHtml.get(sGrantType).toString();
                  saveHtml.put(sGrantType, html+"<li>"+(hmGrant.get("TITLE")==null?
                     "":hmGrant.get("TITLE").toString()));
                  break;
            }
         }
   %>
      <table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%>
      <tr bgcolor=#FFFFFF>
			<td><strong>请选择具有下列数据操作权限的人员集合</strong></td>
		</tr>
		<tr bgcolor=#FFFFFF>
			<td>[<input type=button value="快速授权" onClick="onGrantCommonPremission()">(把常用的功能授权给系统所有人，其中包括列表、增加、修改、删除、查询)]</td>
		</tr>
		<tr bgcolor=#FFFFFF>
         <td align=center colspan=2>
            <div class="tab-pane" id="tabPane1">
               <script type="text/javascript">
                  tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ));
               </script>
               <div class="tab-page" id="tabPage1">
                  <h2 class="tab">查询</h2>
		            <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage1" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(0)"></td>
                     </tr>
                     <%
                     if(queryHtml !=null && queryHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF" width=100%><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=queryHtml.get("1")==null?"":queryHtml.get("1")%></td>
                        <td valign=top>部门：<%=queryHtml.get("2")==null?"":queryHtml.get("2")%></td>
                        <td valign=top>角色：<%=queryHtml.get("3")==null?"":queryHtml.get("3")%></td>
                        <td valign=top>群体：<%=queryHtml.get("4")==null?"":queryHtml.get("4")%></td>
                        <td valign=top>人员：<%=queryHtml.get("5")==null?"":queryHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=queryHtml.get("6")==null?"":queryHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=50 height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage2">
                  <h2 class="tab">添加</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage2" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(1)"></td>
                     </tr>
                     <%
                     if(addHtml !=null && addHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=addHtml.get("1")==null?"":addHtml.get("1")%></td>
                        <td valign=top>部门：<%=addHtml.get("2")==null?"":addHtml.get("2")%></td>
                        <td valign=top>角色：<%=addHtml.get("3")==null?"":addHtml.get("3")%></td>
                        <td valign=top>群体：<%=addHtml.get("4")==null?"":addHtml.get("4")%></td>
                        <td valign=top>人员：<%=addHtml.get("5")==null?"":addHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=addHtml.get("6")==null?"":addHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage3">
                  <h2 class="tab">修改</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage3" ) );</script>

                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(2)"></td>
                     </tr>
                     

                     <%
                     if(updateHtml !=null && updateHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=updateHtml.get("1")==null?"":updateHtml.get("1")%></td>
                        <td valign=top>部门：<%=updateHtml.get("2")==null?"":updateHtml.get("2")%></td>
                        <td valign=top>角色：<%=updateHtml.get("3")==null?"":updateHtml.get("3")%></td>
                        <td valign=top>群体：<%=updateHtml.get("4")==null?"":updateHtml.get("4")%></td>
                        <td valign=top>人员：<%=updateHtml.get("5")==null?"":updateHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=updateHtml.get("6")==null?"":updateHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100 height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage4">
                  <h2 class="tab">删除</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage4" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(3)"></td>
                     </tr>
                     

                        <%
                        if(deleteHtml !=null && deleteHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=deleteHtml.get("1")==null?"":deleteHtml.get("1")%></td>
                           <td valign=top>部门：<%=deleteHtml.get("2")==null?"":deleteHtml.get("2")%></td>
                           <td valign=top>角色：<%=deleteHtml.get("3")==null?"":deleteHtml.get("3")%></td>
                           <td valign=top>群体：<%=deleteHtml.get("4")==null?"":deleteHtml.get("4")%></td>
                           <td valign=top>人员：<%=deleteHtml.get("5")==null?"":deleteHtml.get("5")%></td>
                           <td valign=top>权限等级：<%=deleteHtml.get("6")==null?"":deleteHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                        %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage13">
                  <h2 class="tab">批量删除</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage13" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(12)"></td>
                     </tr>
                     

                        <%
                        if(batchDeleteHtml !=null && batchDeleteHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=batchDeleteHtml.get("1")==null?"":batchDeleteHtml.get("1")%></td>
                           <td valign=top>部门：<%=batchDeleteHtml.get("2")==null?"":batchDeleteHtml.get("2")%></td>
                           <td valign=top>角色：<%=batchDeleteHtml.get("3")==null?"":batchDeleteHtml.get("3")%></td>
                           <td valign=top>群体：<%=batchDeleteHtml.get("4")==null?"":batchDeleteHtml.get("4")%></td>
                           <td valign=top>人员：<%=batchDeleteHtml.get("5")==null?"":batchDeleteHtml.get("5")%></td>
                           <td valign=top>权限等级：<%=batchDeleteHtml.get("6")==null?"":batchDeleteHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                        %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage5">
                  <h2 class="tab">详细信息</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage5" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                         <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(4)"></td>
                     </tr>
                     

                     <%
                     if(detailHtml !=null && detailHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=detailHtml.get("1")==null?"":detailHtml.get("1")%></td>
                        <td valign=top>部门：<%=detailHtml.get("2")==null?"":detailHtml.get("2")%></td>
                        <td valign=top>角色：<%=detailHtml.get("3")==null?"":detailHtml.get("3")%></td>
                        <td valign=top>群体：<%=detailHtml.get("4")==null?"":detailHtml.get("4")%></td>
                        <td valign=top>人员：<%=detailHtml.get("5")==null?"":detailHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=detailHtml.get("6")==null?"":detailHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage6">
                  <h2 class="tab">列表</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage6" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                            <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(5)"></td>
                        </tr>
                           <%
                           if(listHtml !=null && listHtml.size() >0)
                           {
                           %><tr bgcolor=#FFFFFF><td>
                              <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                              <td valign=top>职位：<%=listHtml.get("1")==null?"":listHtml.get("1")%></td>
                              <td valign=top>部门：<%=listHtml.get("2")==null?"":listHtml.get("2")%></td>
                              <td valign=top>角色：<%=listHtml.get("3")==null?"":listHtml.get("3")%></td>
                              <td valign=top>群体：<%=listHtml.get("4")==null?"":listHtml.get("4")%></td>
                              <td valign=top>人员：<%=listHtml.get("5")==null?"":listHtml.get("5")%></td>
                              <td valign=top>权限等级：<%=listHtml.get("6")==null?"":listHtml.get("6")%></td>
                              </tr></table>
                              </td></tr>
                           <%
                           }
                           else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                           %>
                     </table>
               </div>
               <div class="tab-page" id="tabPage7">
                  <h2 class="tab">导出Excel</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage7" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(6)"></td>
                     </tr>
                     

                     <%
                     if(expHtml !=null && expHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=expHtml.get("1")==null?"":expHtml.get("1")%></td>
                        <td valign=top>部门：<%=expHtml.get("2")==null?"":expHtml.get("2")%></td>
                        <td valign=top>角色：<%=expHtml.get("3")==null?"":expHtml.get("3")%></td>
                        <td valign=top>群体：<%=expHtml.get("4")==null?"":expHtml.get("4")%></td>
                        <td valign=top>人员：<%=expHtml.get("5")==null?"":expHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=expHtml.get("6")==null?"":expHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage8">
                  <h2 class="tab">导入Excel</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage8" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(7)"></td>
                     </tr>
                     

                     <%
                     if(impHtml !=null && impHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=impHtml.get("1")==null?"":impHtml.get("1")%></td>
                        <td valign=top>部门：<%=impHtml.get("2")==null?"":impHtml.get("2")%></td>
                        <td valign=top>角色：<%=impHtml.get("3")==null?"":impHtml.get("3")%></td>
                        <td valign=top>群体：<%=impHtml.get("4")==null?"":impHtml.get("4")%></td>
                        <td valign=top>人员：<%=impHtml.get("5")==null?"":impHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=impHtml.get("6")==null?"":impHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage9">
                  <h2 class="tab">列表打印</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage9" ) );</script>
                  <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                     <tr bgcolor=#FFFFFF>
                        <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(8)"></td>
                     </tr>
                     
                     <%
                     if(listPrintHtml !=null && listPrintHtml.size() >0)
                     {
                     %><tr bgcolor=#FFFFFF><td>
                        <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                        <td valign=top>职位：<%=listPrintHtml.get("1")==null?"":listPrintHtml.get("1")%></td>
                        <td valign=top>部门：<%=listPrintHtml.get("2")==null?"":listPrintHtml.get("2")%></td>
                        <td valign=top>角色：<%=listPrintHtml.get("3")==null?"":listPrintHtml.get("3")%></td>
                        <td valign=top>群体：<%=listPrintHtml.get("4")==null?"":listPrintHtml.get("4")%></td>
                        <td valign=top>人员：<%=listPrintHtml.get("5")==null?"":listPrintHtml.get("5")%></td>
                        <td valign=top>权限等级：<%=listPrintHtml.get("6")==null?"":listPrintHtml.get("6")%></td>
                        </tr></table>
                        </td></tr>
                     <%
                     }
                     else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                     %>
                  </table>
               </div>
               <div class="tab-page" id="tabPage10">
                  <h2 class="tab">详细信息打印</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage10" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(9)">
                        </tr>
                        

                        <%
                        if(detailPrintHtml !=null && detailPrintHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=detailPrintHtml.get("1")==null?"":detailPrintHtml.get("1")%></td>
                           <td valign=top>部门：<%=detailPrintHtml.get("2")==null?"":detailPrintHtml.get("2")%></td>
                           <td valign=top>角色：<%=detailPrintHtml.get("3")==null?"":detailPrintHtml.get("3")%></td>
                           <td valign=top>群体：<%=detailPrintHtml.get("4")==null?"":detailPrintHtml.get("4")%></td>
                           <td valign=top>人员：<%=detailPrintHtml.get("5")==null?"":detailPrintHtml.get("5")%></td>
                           <td valign=top>权限等级：<%=detailPrintHtml.get("6")==null?"":detailPrintHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                        %>
                     </table>               
               </div>
               <div class="tab-page" id="tabPage11">
                  <h2 class="tab">页面拷贝</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage11" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(10)">
                        </tr>
                        

                        <%
                        if(copyHtml !=null && copyHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=copyHtml.get("1")==null?"":copyHtml.get("1")%></td>
                           <td valign=top>部门：<%=copyHtml.get("2")==null?"":copyHtml.get("2")%></td>
                           <td valign=top>角色：<%=copyHtml.get("3")==null?"":copyHtml.get("3")%></td>
                           <td valign=top>群体：<%=copyHtml.get("4")==null?"":copyHtml.get("4")%></td>
                           <td valign=top>人员：<%=copyHtml.get("5")==null?"":copyHtml.get("5")%></td>
                           <td valign=top>权限等级：<%=copyHtml.get("6")==null?"":copyHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                        %>
                     </table>               
               </div>
               <div class="tab-page" id="tabPage12">
                  <h2 class="tab">页面另存</h2>
                  <script type="text/javascript">tp1.addTabPage( document.getElementById( "tabPage12" ) );</script>
                     <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF">
                        <tr bgcolor=#FFFFFF>
                           <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(11)">
                        </tr>
                        

                        <%
                        if(saveHtml !=null && saveHtml.size() >0)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=saveHtml.get("1")==null?"":saveHtml.get("1")%></td>
                           <td valign=top>部门：<%=saveHtml.get("2")==null?"":saveHtml.get("2")%></td>
                           <td valign=top>角色：<%=saveHtml.get("3")==null?"":saveHtml.get("3")%></td>
                           <td valign=top>群体：<%=saveHtml.get("4")==null?"":saveHtml.get("4")%></td>
                           <td valign=top>人员：<%=saveHtml.get("5")==null?"":saveHtml.get("5")%></td>
                           <td valign=top>权限等级：<%=saveHtml.get("6")==null?"":saveHtml.get("6")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
                        %>
                     </table>               
               </div>
					<!--元件权限-->
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
                           <td align=right><input type=button class="bttopnofirst" value="...人员设置..." onClick="onGrant(<%=hmTmp.get("COMPONENT_ID")%>)">
                        </tr>


                        <%
                        if(hmTmp.get("POSI") !=null || hmTmp.get("SITE") !=null
								|| hmTmp.get("ROLE") !=null || hmTmp.get("GROUP") !=null
								|| hmTmp.get("STAFF") !=null || hmTmp.get("AUTH") !=null)
                        {
                        %><tr bgcolor=#FFFFFF><td>
                           <table width=100% cellpadding="2" border="0" cellspacing="1" bgcolor="#0099FF"><tr bgcolor=#FFFFFF>
                           <td valign=top>职位：<%=hmTmp.get("POSI")==null?"":hmTmp.get("POSI")%></td>
                           <td valign=top>部门：<%=hmTmp.get("SITE")==null?"":hmTmp.get("SITE")%></td>
                           <td valign=top>角色：<%=hmTmp.get("ROLE")==null?"":hmTmp.get("ROLE")%></td>
                           <td valign=top>群体：<%=hmTmp.get("GROUP")==null?"":hmTmp.get("GROUP")%></td>
                           <td valign=top>人员：<%=hmTmp.get("STAFF")==null?"":hmTmp.get("STAFF")%></td>
                           <td valign=top>权限等级：<%=hmTmp.get("AUTH")==null?"":hmTmp.get("AUTH")%></td>
                           </tr></table>
                           </td></tr>
                        <%
                        }
                        else out.println("<tr bgcolor=#FFFFFF height=100><td align=center>没有配置</td></tr>");
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
		alert("操作成功！");
		document.location.reload();
	}
}
</script>

</$:G>
</body>
