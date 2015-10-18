<%@ page contentType="text/html; charset=GBK"%>
<%@ page language="java" import="java.io.File" %>
<%@ include file="/include/Head.jsp"%>
<%
String sWebId ="1";
%>
<Body  style="BACKGROUND: url(<%=GlobalUtil._WEB_PATH%>/images/gonggao_di.jpg) fixed no-repeat">
<%String sNew =GlobalNames.COMPANY_NAME+"新闻";%>
<$:G title="<%=sNew%>">
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
												Row haNews =new Row((Row)alNews.get(i));
									%>
										<li><a href='<%=GlobalUtil._WEB_PATH%>/portal/newsinfo.jsp?news_id=<%=haNews.get("NEWS_ID")%>'><%=haNews.get("TITLE")%></a><font style=font-size:10px color=#888888>[<%=haNews.get("PUBLISH_TIME").toString().substring(0,10)%>]</font>
																					
									<%	 
											String sCanReview =haNews.get("CAN_REVIEW").toString();
											if(!sCanReview.equals("0"))
											{//可以评论
												out.println("<a href='review.jsp?news_id="+haNews.get("NEWS_ID").toString()+"&chn_id="+haNews.get("CHN_ID").toString()+"&web_id="+sWebId+"&column_id="+haNews.get("COLUMN_ID").toString()+"&view="+sCanReview+"' target=_blank>评论</a>");
											}
										}
									}%>
									<td>
							</tr>
							</table>

					</TD>
				</TR>
				</TABLE>
</$:G>
<div align=center>
<input type=button class="btnofirst" value="返回" onClick="history.go(-1)">
</div>
</BODY>