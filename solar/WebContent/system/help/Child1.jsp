<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<body>
<$:G title="����ϵͳ">
<$:A service="GetFaq" dynamic="true">
   <$:P name="faq_no" aliasName="pfaq_no" default="0"/>
</$:A>
<$:M dtype="1"/>
<table cellpadding="2" cellspacing="1" class="table_c" width=100%>
   <tr class="tr_c"><td colspan=2 width=100%>
      <$:T var="faq" name="FaqInfo">
            <FONT COLOR="#0000CC" size=4><U><B><$:C item="faq.SUBJECT"/></B></U>[<input type=button value="�༭" onClick='onEditFaq("<$:C item="faq.FAQ_NO"/>")']</FONT>
             <table width=95% align=right border=0><tr><td width=95%>
               <$:C item="faq.CONTENT"/>&nbsp;
            </td></tr>
         </table>
      </$:T>
   </td></tr>
   <tr class="tr_c"><td align=right valign=top>�������ݣ�</td><td>&nbsp;&nbsp;
      <$:T var="faq" name="ReferFaq">
         <$:C item="faq.ROWID"/>:<a href='Child.jsp?pfaq_no=<$:C item="faq.FAQ_NO"/>'><$:C item="faq.SUBJECT"/></a>
      </$:T>
   </td></tr>
   <tr class="tr_c"> 
    <td class="td_c" >�����������⣺</td>
    <td height="1" align=right nowrap>
      <input type="button" name="btnadd" value=<$:I item="html.button.add"/> class="btTopfirst" onclick=modify('<$:W name="pfaq_no" default="0" from="request"/>',0)><input type="button" name="btndel" value=<$:I item="html.button.del"/> onclick=modify('<$:W name="pfaq_no" default="0" from="request"/>',2) disabled><input type="button" name="btnupdate" value=<$:I item="html.button.update"/> onclick=modify('<$:W name="pfaq_no" default="0" from="request"/>',1) disabled></td>
   </tr>
   <tr class="tr_c"><td width=100% colspan=2>
      <table id="tabMain" onClick="row()" cellpadding="2" cellspacing="1" class="table_c">
      <tr class="tr_title"> 
         <td class="td_c" width=1%>&nbsp;</td>
         <td class="td_c" width=1% nowrap>������</td>
         <td class="td_c">����</td>
      </tr>
      <$:T var="faq" name="SubFaqList">
      <tr class="tr_c" <$:R item="faq.FAQ_NO,PFAQ_NO"/>>
         <td nowrap>&nbsp;<$:C item="faq.ROWID"/> </td>
         <td nowrap>&nbsp;<$:C item="faq.FAQ_NO"/> </td>
         <td nowrap><a href='FaqInfo.jsp?faq_no=<$:C item="faq.FAQ_NO"/>'><$:C item="faq.SUBJECT"/></a></td>
      </tr>
      </$:T>
      <tr class="tr_c">
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
      </tr>
      </table>
   </td></tr>
</table>
</$:G>   
</body>
</html>
<script>
function modify(pfaq_no, type)
{
   if(type=='0')
   {
      //window.open ('<%=GlobalUtil._WEB_PATH%>/system/help/faq_mod.jsp', 'edit', 'height=600, width=600, top=50, left=50, toolbar=no, menubar=no, resizable=yes,location=no, status=no');
      document.location='<%=GlobalUtil._WEB_PATH%>/system/help/FaqMod.jsp?pfaq_no='+pfaq_no;
      //runOpen('<%=GlobalUtil._WEB_PATH%>/system/help/faq_mod.jsp', false, 600, 500);
   }
   else if(type =="1")
   {//�޸�
		if(typeof Table.clickRow(document.all.tabMain).FAQ_NO !='undefined')
      {
         var faq_no =Table.clickRow(document.all.tabMain).FAQ_NO;
			document.location='<%=GlobalUtil._WEB_PATH%>/system/help/FaqMod.jsp?faq_no='+faq_no+"&operate=1";
		}
	}
	else if(type =="2")
	{//ɾ��
      if(typeof Table.clickRow(document.all.tabMain).FAQ_NO !='undefined')
      {
         var faq_no =Table.clickRow(document.all.tabMain).FAQ_NO;
         var pfaq_no =Table.clickRow(document.all.tabMain).PFAQ_NO;
			if(confirm("ȷ��Ҫɾ���˰��������Լ��������İ���������Ϣ��"))
			{
				var s=new Server("editSysFaq");
				s.setParam("faq_no", faq_no);
				s.setParam("pfaq_no", pfaq_no);
				s.setParam("operate", type);
				s.send(s, false, function(){
					alert("ɾ���ɹ���");
					$E.loca(WEB_PATH+"/system/help/Child.jsp?pfaq_no="+$E.getParameter("pfaq_no"));
				}
				);
			}
      }
      else
         $E.message("��ѡ��һ��Ҫ�޸ĵļ�¼");
   }
   return ;
}
function row()
{
   Table.click();
   if(typeof Table.clickRow(document.all.tabMain).FAQ_NO !='undefined')
   {
      var faq_no =Table.clickRow(document.all.tabMain).FAQ_NO;
      document.all.btndel.disabled=false;
      document.all.btnupdate.disabled=false;
   }
   else
   {
      document.all.btndel.disabled=true;
      document.all.btnupdate.disabled=true;
   }
}
//�༭faq
function onEditFaq(sFaqNo)
{
	$E.loca("FaqMod.jsp?faq_no="+sFaqNo+"&operate=1");
}
</script>
