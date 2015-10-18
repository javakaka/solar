<%@ page contentType="text/html; charset=GBK"%>
<style>
.subject {
	font-size: 14px;
	font-weight: bold;
	color: #FF8000;
}
.text {
	font-size: 12px;
	color: #666666;
}
.btext {
	font-size: 14px;
	font-weight:bold;
	color: #666666;
}
.refer {
	font-size: 12px;
	color: #0000DE;
}
a
{
	color: #0000DE;
	text-decoration: none;
}

a:hover {
	color: Red;
	text-decoration: underline;
}

.aVisited {
	color: #D6F3F9;
	text-decoration: underline;	
}
</style>
<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<$:A service="getFunHelpInfo" dynamic="false">
   <$:P name="faq_no" from="request"/>
</$:A>
<$:M dtype="1"/>
<TABLE width=95% align="center">
   <tr class="tr_c"><td colspan=2 width=100%>
      <$:T var="faq" name="FaqInfo">
            <span class="btext"><$:C item="faq.SUBJECT"/></span>
             <table><tr><td width=95%>
               <span class="text"><$:C item="faq.CONTENT"/></span>
            </td></tr>
         </table>
      </$:T>
   </td></tr>
</TABLE>
<%
if(ServletUtil.getResult(request,"FAQS") !=null)
{
	DataSet alFaqs =(DataSet)ServletUtil.getResult(request,"FAQS");
	%>
	<TABLE width=95% align="center">
		<tr>
			<td height="20">
			</td>
		</tr>
		<tr> 
		<td> 
			<table border="0" cellpadding="0" cellspacing="0">
			<%
			for(int i=0; i<alFaqs.size(); i++)
			{
				Row hmFaq =(Row)alFaqs.get(i);
				String sFaqNo =hmFaq.get("FAQ_NO").toString();
				%>
				<tr class="tr_c">
					<td><%=(i+1)%>°¢<a href='#<%=hmFaq.get("FAQ_NO")%>'><span class="btext"><%=hmFaq.get("SUBJECT")%></span></a></td>
				</tr>
			<%}%>
			</table>
		</td>
		</tr>
	</TABLE>
	<table width=95% align="center">
	<tr>
		<td height="5" bgcolor="#cccccc"></td>
	</tr>
	</table>
	<TABLE width=95% align="center">
		<%
		for(int i=0; i<alFaqs.size(); i++)
		{
			%>
			<tr>
			<td>
			<%
			Row hmFaq =(Row)alFaqs.get(i);
			String sFaqNo =hmFaq.get("FAQ_NO").toString();
		%>
			<table cellpadding="2" cellspacing="1" class="table_c" width=100% align=center border="0">
				<tr class="tr_c">
					<td><a name='<%=hmFaq.get("FAQ_NO")%>'><span class="subject"><%=(i+1)%>°¢<%=hmFaq.get("SUBJECT")%></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/up.gif" width="10" height="10" border="0"></a></td>
				</tr>
				<tr class="tr_c">
					<td style="line-height:28px"><span class="text"><%=hmFaq.get("CONTENT")%></span></td>
				</tr>
			</table>
			<%
			if(hmFaq.get("REFER_FAQS") !=null)
			{
				Row hmReferFaq =(Row)hmFaq.get("REFER_FAQS");
				%>
				<table cellpadding="0" cellspacing="0" class="table_c" width=90% align=center>
					<tr class="tr_c">
						<td><span class="refer"><B>œ‡πÿ∞Ô÷˙£∫</B></span></td>
					</tr>
					<%
					Object[] oKeys =hmReferFaq.keySet().toArray();
					for(int j=0; j<oKeys.length; j++)
					{
					%>
					<tr class="tr_c">
						<td>&nbsp;&nbsp;<span class="refer"><%=(j+1)%>°¢<span class="refer"><%=hmReferFaq.get(oKeys[j])%></span></td>
					</tr>
					<%}%>
				</table>
				</td>
				</tr>
			<%		
			}
		%>
	<tr><td bgcolor="#cccccc" height="1"></td></tr>
	<%
	}
%>
</table>
<%
}
%>
</body>
