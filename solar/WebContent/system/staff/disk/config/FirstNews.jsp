<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%@ page language="java" import="java.io.File" %>
<%
String sWebId ="1";
%>
<!--xinwentoutiao-->
<body style="BACKGROUND: url(<%=GlobalUtil._WEB_PATH%>/images/gonggao.jpg) fixed no-repeat">
				<TABLE WIDTH=100%  cellSpacing=0 cellPadding=0  border=0>
				<TR>
					<TD nowrap>
						<img src="<%=GlobalUtil._WEB_PATH%>/images/juts_news.jpg">
					</TD>
					<TD valign=top>
					   <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
							<tr>
								<td colspan=2>
									<$:A service="getColumnNews" dynamic="true" pagesize="10">
										<$:P name="column_id" value="19"/>
									</$:A>
									<$:M dtype="1"/>
									<%
										if(ServletUtil.getResult(request, "NEWS") !=null)
										{											
											DataSet alNews =(DataSet)ServletUtil.getResult(request, "NEWS");
											for(int i=0; i<alNews.size(); i++)
											{
												Row haNews =(Row)alNews.get(i);
									%>
										<li><label onClick="parent.window.document.location.href='<%=GlobalUtil._WEB_PATH%>/portal/newsinfo.jsp?news_id=<%=haNews.get("NEWS_ID")%>'" style="cursor:hand"><%=haNews.get("TITLE")%></label><font style=font-size:10px color=#888888>[<%=haNews.get("PUBLISH_TIME").toString().substring(0,10)%>]</font>
																					
									<%	 
											String sCanReview =haNews.get("CAN_REVIEW").toString();
											if(!sCanReview.equals("0"))
											{//可以评论
												out.println("<label onClick=\"parent.window.document.location.href='"+GlobalUtil._WEB_PATH+"/website/1/review.jsp?news_id="+haNews.get("NEWS_ID").toString()+"&chn_id="+haNews.get("CHN_ID").toString()+"&web_id="+sWebId+"&column_id="+haNews.get("COLUMN_ID").toString()+"&view="+sCanReview+"'\" style='cursor:hand'>评论</label>");
											}
										}
									}%>
									<td>
							</tr>
							<tr><td colspan=2 height=10></td></tr>
							<tr><td colspan=2 bgcolor="#66CCFF" height="1"></td></tr>
							<tr><td colspan=2 align=right><a onClick=javascript:parent.window.document.location='juts_news.jsp' style="cursor:hand">...更多</a></td></tr>
							</table>

					</TD>
				</TR>
				</TABLE>
				<!--xinwentoutiao-->
</BODY>
