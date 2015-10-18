//校验导入数据
var oCols =["A","B","C","D","E","F","G","H","I","J"];
var iBRow =3;
var sOrgName ="";//单位名称
var sSiteToken ="|";//部门分割符
var sPosiToken ="#";//岗位分割符
var sStaffToken ="$";//人员分割符
function onCheckOrgData()
{
	var o =webform.WebOffice.ActiveDocument.Application;
	//判断公司名称
	sOrgName =o.Range("B1");
	if(sOrgName =="")
	{
		$E.message("单位名称不能为空！");
		return;
	}
	var sData ="";
	var sAlertMsg ="";
	for(var i=iBRow; i<10000; i++)
	{
		if(isEmptyRow(o, i))
			break;
		var sSite =o.Range("A"+i).Text;
		if(sSite !="")
		{//部门不为空
			if(sData !="")
				sData +=sSiteToken;//部门分割符
			sData +=sSite;
		}
		var sPosition =o.Range("B"+i).Text;
		if(sPosition !="")
		{//岗位不为空
			if(sData !="")
				sData +=sPosiToken;//岗位分割符
			sData +=sPosition;
		}
		var sStaffs ="", sStaffOrSex, sTmpStaff ="";
		for(var k=3; k<=oCols.length; k++)
		{
			sStaffOrSex =o.Range(oCols[k-1]+i).Text;
			if(k%2 ==1)
			{//人员
				if(sStaffOrSex =="")
				{//碰到空人就跳出
					break;
				}
				if(sStaffs !="")
					sStaffs +=sStaffToken;//人员分割符
				sStaffs +=sStaffOrSex;
				sTmpStaff =sStaffOrSex;
			}
			else
			{//性别
				if(sStaffOrSex =="")
				{
					sAlertMsg =sTmpStaff+"性别为空！数据项["+oCols[k-1]+i+"]";
					break;
				}
				else
				{
					sStaffs +="!"+sStaffOrSex;//姓名与性别分隔符
				}
			}
		}
		if(sStaffs !="")
			sData +="$"+sStaffs;
		if(sAlertMsg !="")
		{
			$E.message(sAlertMsg);
			return null;
		}
	}
	$E.message("数据完全合法！");
	return sData;
}

//判断数据行是否全空
function isEmptyRow(oo, iRow)
{
	var isEmpty =true;
	for(var j=1; j<=oCols.length; j++)
	{
		var sTxt =oo.Range(oCols[j-1]+iRow).Text;
		if(sTxt !="")
		{
			isEmpty =false;
		}
	}
	return isEmpty;
}

//导入机构数据
function onImportOrgData()
{
	var sData =onCheckOrgData();
	if(sData ==null || sData.length ==0) return;
	var s=new Server("importOrgData");
	s.setParam("data", sData);
	s.setParam("org_name", sOrgName);
	s.send(s, false, function()
		{
			alert("组织机构数据导入成功！");
			document.all.btOrgDataImport.disabled =true;
			$E.loca(WEB_PATH+"/system/premission/OrgDetail.jsp?bureau_no=1");
		}
	);
}