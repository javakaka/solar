<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<script>
function onChangeFfaq()
{
   var faq_no =window.showModalDialog('<%=GlobalUtil._WEB_PATH%>/system/help/FaqInclude2.jsp?pfaq_no='+document.all.pfaq_no.value);
   if(typeof faq_no !="undefined")   
      document.all.pfaq_no.value =faq_no;
}

function onRelation()
{
   var faq_nos =window.showModalDialog('<%=GlobalUtil._WEB_PATH%>/system/help/FaqInclude.jsp?refer_faqs='+document.all.refer_faqs.value);
   document.all.refer_faqs.value =faq_nos;
}
function onSubmit(form)
{
   if(checkForm(form))
   {
		form.content.value =eWebEditor1.getHTML();
		var s=new Server("editSysFaq");
		s.setFormData(form);
		s.send(s, false, function(){
			alert("保存成功！");
			$E.loca(WEB_PATH+"/system/help/Child.jsp?pfaq_no="+$E.getParameter("pfaq_no"));
		}
		);
      //form.submit();
   }
}
function confirmDel(){
   if(confirm("确认要删除此帮助主题以及其下属的帮助主题信息吗？"))
      document.faq.submit();
   else
      history.go(-1);
}
</script>
<$:NE param="faq_no" value="">
   <$:A service="GetFaq" dynamic="true">
      <$:P name="faq_no"/>
   </$:A>
   <$:M dtype="1"/>
</$:NE>
<body onLoad="onLoadPage()">
<form name="faq" focus="subject">
<$:T var="faq" name="FaqInfo" pagesize="1">
   <table width=100% cellpadding="2" cellspacing="1" class="table_c">
      <tr class="tr_c"><td colspan=2 align=center><B>
         <$:I item="sm_faq.edit"/></B></td></tr>
      <tr class="tr_c"><td>
         <$:I item="System.premission.faq_subject"/>：<input type=text name="subject" desc='<$:I item="sm_faq.subject"/>' datatype="string" value='<$:C item="faq.SUBJECT"/>'>
         <input type=button value="父属主题"  onClick="onChangeFfaq()">
         </td>
         <td><input type="button"  value='<$:I item="sm_faq.refer_faqs"/>' onClick="onRelation()"></td>
      </td></tr>
      <tr class="tr_c"><td height=420 colspan=2>
         	  <INPUT type="hidden" name="content" value="">
	<IFRAME ID="eWebEditor1" src="<%=GlobalUtil._WEB_PATH%>/portal/webedit/EWebEditor.jsp?id=content&style=standard&mode=faq" frameborder="0" scrolling="no" width="100%" height="400"></IFRAME>

      </td></tr>  
      <tr class="tr_c">
         <td align=center height=30 valign=top colspan=2>
            <input type="hidden" name="pfaq_no"  value='<$:W name="pfaq_no" from="request" default=""/>'>
            <input type="reset" value=<$:I item="html.button.reset"/>  ><input type="button" value=<$:I item="html.button.save"/>  onClick="onSubmit(this.form)"></td>
      </tr> 
   </table>
   <!--<input type=hidden name='content' value='<$:C item="faq.CONTENT"/>'>-->
   <input type=hidden name='faq_no' value='<$:C item="faq.FAQ_NO"/>'>
   <input type=hidden name='table' value='TSM_FAQ'>
   <input type=hidden name='refer_faqs' value=''>
   <input type=hidden name='operate' value='<$:W name="operate" from="request" default="0"/>'>
   <input type=hidden name="url" value='Child.jsp?pfaq_no=<$:W name="pfaq_no" from="request" default="0"/>'>
   <$:E param="operate" value="2">
      <script>confirmDel();</script>
   </$:E>
<textarea id="idTtTmp" style="display:none"><$:C item="faq.CONTENT"/></textarea>
<script>
function onLoadPage()
{
   eWebEditor1.setHTML(document.all.idTtTmp.value.replace("\n", ""));
}

</script>
</$:T>
<script>
   var refer_faqs ='';
   <$:T var="refer" name="ReferFaq">
      refer_faqs +='<$:C item="refer.FAQ_NO"/>'+",";
   </$:T>
   if(refer_faqs.length >0)
      refer_faqs =refer_faqs.substring(0, refer_faqs.length -1);
   document.all.refer_faqs.value =refer_faqs;
</script>
</form>
</body>
