//У�鵼������
var oCols =["A","B","C","D","E","F","G","H","I","J"];
var iBRow =3;
var sOrgName ="";//��λ����
var sSiteToken ="|";//���ŷָ��
var sPosiToken ="#";//��λ�ָ��
var sStaffToken ="$";//��Ա�ָ��
function onCheckOrgData()
{
	var o =webform.WebOffice.ActiveDocument.Application;
	//�жϹ�˾����
	sOrgName =o.Range("B1");
	if(sOrgName =="")
	{
		$E.message("��λ���Ʋ���Ϊ�գ�");
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
		{//���Ų�Ϊ��
			if(sData !="")
				sData +=sSiteToken;//���ŷָ��
			sData +=sSite;
		}
		var sPosition =o.Range("B"+i).Text;
		if(sPosition !="")
		{//��λ��Ϊ��
			if(sData !="")
				sData +=sPosiToken;//��λ�ָ��
			sData +=sPosition;
		}
		var sStaffs ="", sStaffOrSex, sTmpStaff ="";
		for(var k=3; k<=oCols.length; k++)
		{
			sStaffOrSex =o.Range(oCols[k-1]+i).Text;
			if(k%2 ==1)
			{//��Ա
				if(sStaffOrSex =="")
				{//�������˾�����
					break;
				}
				if(sStaffs !="")
					sStaffs +=sStaffToken;//��Ա�ָ��
				sStaffs +=sStaffOrSex;
				sTmpStaff =sStaffOrSex;
			}
			else
			{//�Ա�
				if(sStaffOrSex =="")
				{
					sAlertMsg =sTmpStaff+"�Ա�Ϊ�գ�������["+oCols[k-1]+i+"]";
					break;
				}
				else
				{
					sStaffs +="!"+sStaffOrSex;//�������Ա�ָ���
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
	$E.message("������ȫ�Ϸ���");
	return sData;
}

//�ж��������Ƿ�ȫ��
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

//�����������
function onImportOrgData()
{
	var sData =onCheckOrgData();
	if(sData ==null || sData.length ==0) return;
	var s=new Server("importOrgData");
	s.setParam("data", sData);
	s.setParam("org_name", sOrgName);
	s.send(s, false, function()
		{
			alert("��֯�������ݵ���ɹ���");
			document.all.btOrgDataImport.disabled =true;
			$E.loca(WEB_PATH+"/system/premission/OrgDetail.jsp?bureau_no=1");
		}
	);
}