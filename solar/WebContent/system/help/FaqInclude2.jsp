<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script>
   var pfaq_no ='<$:W name="pfaq_no" from="request"/>';
   function onSelect()
   {
      var faq_no ='';
      if(typeof Table.clickRow(document.all.tabMain).FAQ_NO !='undefined')
         faq_no =Table.clickRow(document.all.tabMain).FAQ_NO;
      window.returnValue =faq_no;
		alert(faq_no);
      window.close();
   }

   function loadNew()
	{
      if(pfaq_no !='' && pfaq_no!='undefined')
      {
         for (var j = 0; j < tabMain.rows.length;j++){
            if (tabMain.rows(j).cells(1).innerText == pfaq_no){
               var iRowIndexs = new Array();
               iRowIndexs[1]= j;
               //Table.click(tabMain, iRowIndexs);
               break;
            }

         }
      }
   }
</script>
</script>
<body onLoad="loadNew()">
<$:G title="帮助主题列表">
<DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 430"> 
 <table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" onClick="Table.click()">	
    <$:A service="getSysFaqTree" dynamic="false"/>
    <$:M dtype="1"/>
    <tr class="tr_c">
       <td class="td_c" nowrap><$:I item="sm_faq.subject"/></td>
       <td class="td_c" nowrap><$:I item="sm_faq.faq_no"/></td>
    </tr>
    <$:T var="faq" name="FaqTree">
      <tr class="tr_c" <$:R item="faq.FAQ_NO"/>>
       <td nowrap><$:C item="faq.JOIN_NAME"/>&nbsp;</td>
       <td nowrap width=1%><$:C item="faq.FAQ_NO"/></td>
      </tr>
    </$:T>
 </table>
</DIV>
</$:G>
<div align=right>
   <input type="button" value=<$:I item="html.button.save"/>  onClick="onSelect()"><input type="button" value=<$:I item="html.button.close"/>  onClick="window.close()">
</div>
</body>
