var onHost =false;
var iRowStaffs =8;//每行显示人员数目
function getOnlineUser()
{
	if(!onHost)
	{
		setInterval("getOnlineUser()", 20 *1000);
		onHost =true;
	}
	Table.clear(idTbOnlineUser);
	var s=new Server("getOnlineUsers");
	s.send(s, false, function()
		{
			//alert(s.getXml());
			var oSite =s.getResult("OnlineStaffSites");
			var oStaff =s.getResult("OnlineStaffs");
			if(oSite !=null)
			{
				var iSites =oSite.getRows();
				for(var i=1; i<=iSites; i++)
				{
					var oRow =idTbOnlineUser.insertRow();
					oRow.className ="tr_c";
					oRow.insertCell().innerHTML ="<center>"+oSite.get(i, "site_name")+"</center>";
					var sSiteNo =oSite.get(i, "site_no");
					if(oStaff !=null)
					{
						var iStaffs =oStaff.getRows();
						var sCellHtml ="<table border=0>"
						var iSiteStaffs =0;
						for(j=1; j<=iStaffs; j++)
						{
							var sStaffSiteNo =oStaff.get(j, "site_no");
							if(sStaffSiteNo ==sSiteNo)
							{
								if(iSiteStaffs ==0)
									sCellHtml +="<tr>";
								else if(iSiteStaffs %iRowStaffs ==0)
									sCellHtml +="</tr><tr>";
								sCellHtml +="<td width=50>"+oStaff.get(j, "real_name")+"</td>";
								iSiteStaffs ++;
							}
						}
						if(iSiteStaffs %iRowStaffs ==0)
							sCellHtml +="</tr>";
						else
						{
							for(var k=0; k<(iRowStaffs -iSiteStaffs %iRowStaffs); k++)
							{
								sCellHtml +="<td width=50>&nbsp;</td>";
							}
							sCellHtml +="</tr>";
						}
						sCellHtml +="</table>";
						//alert(sCellHtml);
						oRow.insertCell().innerHTML =sCellHtml;
					}
				}
			}
		}
	);
}