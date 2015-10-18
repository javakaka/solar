<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script>
var refer_no ='<$:W name="refer_faqs" from="request"/>';
function onSelect()
{
	var faq_nos ='';
	oMultiple = Table.clickMultipleRow(tabMain);
	if(oMultiple !=null && oMultiple.length >0)
	{
		for(var i=0; i<oMultiple.length -1; i++)
		{
			faq_nos +=oMultiple[i].FAQ_NO+",";
		}   
		faq_nos +=oMultiple[oMultiple.length -1].FAQ_NO;
	}
	window.returnValue =faq_nos;
	alert(faq_nos);
	window.close();
}

   function loadNew()
	{
      if(refer_no !='' && refer_no!='undefined')
      {
         var referno =refer_no.split(",");
         for(i=0; i<referno.length; i++)
         {
            for (var j = 0; j < tabMain.rows.length;j++){
               if (tabMain.rows(j).cells(1).innerText == referno[i]){
                  var iRowIndexs = new Array();
                  iRowIndexs[1]= j;
                  Table.selectedRow(tabMain, iRowIndexs);
                  break;
               }

            }
         }
      }
   }
</script>
</script>
<body onLoad="loadNew()">
<$:G title="帮助主题列表">
<DIV onscroll="Table.fixRow()" style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 430"> 
 <table id="tabMain" name="tabMain" cellpadding="2" cellspacing="1" class="table_c" onClick="Table.multipleClick()">	
    <$:A service="GetFaqTree" dynamic="true"/>
    <$:M dtype="1"/>
    <tr style="COLOR: white; POSITION: relative">
       <td class="td_c" nowrap><$:I item="sm_faq.subject"/></td>
       <td class="td_c" width=1% nowrap><$:I item="sm_faq.faq_no"/></td>
    </tr>
    <$:T var="faq" name="FaqTree">
      <tr class="tr_c" <$:R item="faq.FAQ_NO"/>>
       <td nowrap><$:C item="faq.SUBJECT"/></td>
       <td nowrap width=1%><$:C item="faq.FAQ_NO"/></td>
      </tr>
    </$:T>
 </table>
</DIV>
</$:G>
<div align=right>
   <input type="button" value=<$:I item="html.button.save"/>  onClick="onSelect()"><input type="button" value=<$:I item="html.button.close"/>  onClick="window.close()"></div>
</body>
