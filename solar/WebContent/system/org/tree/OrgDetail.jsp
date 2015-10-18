<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="/include/Head.jsp"%>
<%!
/**
*/
void getSiteHtml(DataSet dsSite, String sPSiteNo, StringBuffer sbSiteHtml,int iSiteLevel,
	DataSet dsPosition, DataSet dsPositionStaff, DataSet dsStaff)
{
	int iRowStaffs =10; //每行显示人员数量
	iSiteLevel =iSiteLevel+1;
	String sSpace ="";
	for(int j=0; j<iSiteLevel; j++)
		sSpace +="&nbsp;&nbsp;&nbsp;&nbsp;";
	for(int i=0; i<dsSite.size(); i++)
	{
		Row oSite =(Row)dsSite.get(i);
		String sPNo =oSite.getString("up_site_no");
		String sNo =oSite.getString("site_no");
		String sSiteName =oSite.getString("site_name");
		if(sPNo.equals(sPSiteNo))
		{
			sSiteName =sSpace+sSiteName;
			sbSiteHtml.append("<tr class='tr_c'><td colspan='"+iRowStaffs+"' class='td_c'>"+sSiteName+"</td></tr>");
			//得到岗位信息
			if(dsPosition !=null)
			{
				for(int j=0; j<dsPosition.size(); j++)
				{
					Row oPosition =(Row)dsPosition.get(j);
					String sSiteNo =oPosition.getString("site_no");
					String sPosiNo =oPosition.getString("posi_no");
					String sPosiName =oPosition.getString("posi_name");
					if(sSiteNo.equals(sNo))
					{
						sbSiteHtml.append("<tr class='tr_c'><td colspan='"+iRowStaffs+"' class='td_c'>"+sSpace+"&nbsp;&nbsp;&nbsp;&nbsp;"
							+sPosiName+"</td></tr>");
						//得到岗位人员信息
						if(dsPositionStaff !=null)
						{
							int iPosiStaffs =0;
							for(int k=0; k<dsPositionStaff.size(); k++)
							{
								Row oPosiStaff =(Row)dsPositionStaff.get(k);
								String sStaffPosiNo =oPosiStaff.getString("posi_no");
								String sPosiStaffNo =oPosiStaff.getString("staff_no");
								if(sStaffPosiNo.equals(sPosiNo))
								{
									for(int n=0; n<dsStaff.size(); n++)
									{
										Row oStaff =(Row)dsStaff.get(n);
										String sStaffNo =oStaff.getString("staff_no");
										String sRealName =oStaff.getString("real_name");
										if(sStaffNo.equals(sPosiStaffNo))
										{
											if(iPosiStaffs %iRowStaffs ==0)
											{
												sbSiteHtml.append("<tr class='tr_c'>\n");
												if(iPosiStaffs !=0)
													sbSiteHtml.append("</tr>\n<tr class='tr_c'>\n");
												sbSiteHtml.append("<td onClick='onViewStaff("+sStaffNo+")'>"+sSpace+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
											}
											else
												sbSiteHtml.append("<td onClick='onViewStaff("+sStaffNo+")'>&nbsp;");
											sbSiteHtml.append(sRealName+"&nbsp;</td>");
											iPosiStaffs ++;
											break;
										}
									}
								}
							}
							if(iPosiStaffs%iRowStaffs !=0)
							{
								for(int m=0; m<(iRowStaffs -iPosiStaffs%iRowStaffs); m++)
								{
									sbSiteHtml.append("<td>&nbsp;</td>");
								}
							}
							sbSiteHtml.append("</tr>");
						}
					}
				}
			}
			getSiteHtml(dsSite, sNo, sbSiteHtml, iSiteLevel, dsPosition, dsPositionStaff, dsStaff);
		}
	}
}
%>
<html>
<head>
<title>组织机构</title>
</head>
<body>
<$:A service="getBureauStaffOrg" dynamic="false">
	<$:P name="bureau_no"/>
</$:A>
<$:M dtype="1"/>
<%
if(ServletUtil.getResult(request, "bureau") !=null)
{
	DataSet dsBureau =(DataSet)ServletUtil.getResult(request, "bureau");//单位数据
	DataSet dsSite =(DataSet)ServletUtil.getResult(request, "site");//部门数据
	DataSet dsPosition =(DataSet)ServletUtil.getResult(request, "position");//岗位数据
	DataSet dsStaff =(DataSet)ServletUtil.getResult(request, "staff");//人员数据
	DataSet dsPositionStaff =(DataSet)ServletUtil.getResult(request, "position_staff");//岗位人员数据
	Row oBureau =(Row)dsBureau.get(0);
%>
<table>
	<tr class="tr_c">
		<td align=center colspan="8"><%=oBureau.getString("bureau_name")%></td>
	</tr>
<%
if(dsSite !=null)
{
	StringBuffer sbSiteHtml =new StringBuffer(1024);
	int iSiteLevel =0;
	getSiteHtml(dsSite, "0", sbSiteHtml, iSiteLevel, dsPosition, dsPositionStaff, dsStaff);
	out.println(sbSiteHtml.toString());
	sbSiteHtml.setLength(0);
}
%>
</table>
<%}%>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
<!--
function onViewStaff(sStaffNo)
{
	src =WEB_PATH+"/system/card/CardInfo.jsp?card=VSM_STAFF&STAFF_NO="+sStaffNo;
	var oLayer =new Layer('人员信息',src);
	sLayId =oLayer.id;
	//oLayer.submitbind("sendNextFpu()");
	//oLayer.closebind("abc(sDivId)");
	oLayer.show();
}
//-->
</SCRIPT>