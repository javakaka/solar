<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String role_id =request.getParameter("role_id");
if(role_id == null || role_id.replace(" ","").length()==0){
	role_id ="";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><cc:message key="framework.nav.moudle" /></title>
<link href="<%=basePath%>/res/admin/css/common_pop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/list.js"></script>
</head>
<style>
html { overflow-x:hidden; }
body {
width: 95%;
margin: 0px;
padding: 0px;
}
</style>
<body onload="onLoadPage()">
	<table width="600px" height="450px"border="0" cellpadding="2" cellspacing="1" >
	<tr>
	<td valign="top" width="250px" align="cneter">
	<fieldset>
	<legend>系统功能</legend>
	<table width="100%" border="0" cellspacing="0" cellpadding="3">
         <tr>
            <td align="center">
            <select id="select_src" name="select_src" size=25 multiple style="width:180px" ondblclick="OnListSrc_DblClick()">
            </select>
            </td>
         </tr>
      </table>
	</fieldset>
	</td>
	<td valign="middle" width="100px" >
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
            <td align="center"><input type="button" id="BtnAdd" title="添加" name="BtnAdd" value=">" style="width:50px; height:20px" onClick="OnBtnAdd_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" id="BtnAddAll" title="添加全选" name="BtnAddAll" value=">>" style="width:50px; height:20px" onClick="OnBtnAddAll_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" id="BtnRemove" title="移除" name="BtnRemove" value="<" style="width:50px; height:20px" onClick="OnBtnRemove_Click()" class="button"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <td align="center"><input type="button" id="BtnRemoveAll" title="移除全部" name="BtnRemoveAll" value="<<" style="width:50px; height:20px" onClick="OnBtnRemoveAll_Click()" class="button"></td>
         </tr>
      </table>
	</td>
	<td valign="top" width="250px"  align="cneter">
	<FIELDSET><LEGEND>已选功能</LEGEND>
         <table width="100%">
            <tr>
               <td align="left">
               <select id="fun_id" name="fun_id" size=25 multiple style="width:180px"
               </select>
               </td>
            </tr>
         </table>
         </FIELDSET>
	</td>
	</tr>
	 <tr class="tr_c">
      <td align="center" colspan="3">
			<input type="button" onClick="savePermission()" id="btSubmit" name="btSubmit" value="保存" >
      </td>
   </tr>
	</table>
</body>
<script type="text/javascript">
var role_id ="<%=role_id%>";
var funs =new Array();
var tempArr;
<c:forEach items="${funs}" var="row" varStatus="status">
	tempArr =new Array();
	tempArr.push("${row.FUN_ID}");
	tempArr.push("${row.UP_FUN_ID}");
	tempArr.push("${row.FUN_NAME}");
	tempArr.push("${row.LEVEL_INDEX}");
	funs.push(tempArr);
</c:forEach>

var role_funs =new Array();
var tempRoleArr;
<c:forEach items="${role_funs}" var="row" varStatus="status">
	tempRoleArr =new Array();
	tempRoleArr.push("${row.FUN_ID}");
	tempRoleArr.push("${row.UP_FUN_ID}");
	tempRoleArr.push("${row.FUN_NAME}");
	tempRoleArr.push("${row.LEVEL_INDEX}");
	role_funs.push(tempRoleArr);
</c:forEach>



function onLoadPage(){

//alert(funs);
//alert(funs.length);
showAllFuns();
showRoleFuns();
}

function showAllFuns()
{
	var fun_html="";
	for (var i=0; i< funs.length;i++)
	{
		fun_html +="<option value=\""+funs[i][0]+"\">"+funs[i][2]+"</option>";
	}
	$("#select_src").html(fun_html);
}


function showRoleFuns()
{
	var role_fun_html="";
	for (var i=0; i< role_funs.length;i++)
	{
		role_fun_html +="<option value=\""+role_funs[i][0]+"\">"+role_funs[i][2]+"</option>";
	}
	$("#fun_id").html(role_fun_html);
}

//取得被选中的权限
function getSrcSelectvalue()
{
	var listArr=new Array();
	$("#select_src option:selected").each(function(){
           // alert($(this).text()+$(this).val());
            var s_id =$(this).val();
            var s_arr;
            s_arr = getSelectedFunData(s_id);
            //alert(s_arr);
            listArr.push(s_arr);
     });
     var mergeArr =new Array();
     for(var i=0;i <= listArr.length;i++)
     {
     	mergeArr =mergeDataArr(mergeArr,listArr[i]);
     	//alert(mergeArr);
     }
     //alert("mergeArr=====>>");
	 //alert(mergeArr);
	 return mergeArr;
}

//get fun
function getFun(id)
{
	for (var i=0; i< funs.length;i++)
	{
		if(id == funs[i][0])
		{
			return funs[i];
		}
	}
}

//children and parents
function getSelectedFunData(id)
{
	//alert(id);
	var dataArr =new Array();
	//self
	dataArr.push(getFun(id));
	//parents 
	getParents(id,dataArr);
	//children
	getChildren(id,dataArr);
	return dataArr;
}

//把父节点插入到顶部
function getParents(id,data)
{
	var f_id;
	var p_id;
	var fun =getFun(id);
	p_id=fun[1];
	for (var i=0; i< funs.length;i++)
	{
		f_id =funs[i][0];
		if(p_id == f_id)
		{
			data.unshift(funs[i]);
			getParents(f_id,data);
		}
	}
}
//把子节点插入到尾部
function getChildren(id,data)
{
	var f_id;
	var p_id;
	for (var i=0; i< funs.length;i++)
	{
		f_id =funs[i][0];
		p_id =funs[i][1];
		if(p_id == id)
		{
			data.push(funs[i]);
			getChildren(f_id,data);
		}
	}
}

//合并被选中的权限树数据，返回合并后的数据
function mergeDataArr(dataArr1,dataArr2)
{
	var f_id1,f_id2;
	var mergeArr=new Array();
	if(typeof dataArr1 == "undefined" || dataArr1 == null || dataArr1.length==0)
	{
		if(typeof dataArr2 != "undefined" && dataArr2 != null && dataArr2.length >0)
		{
			mergeArr =dataArr2;
		}
		else if(typeof dataArr2 == "undefined" || dataArr2 == null || dataArr2.length == 0)
		{
			mergeArr =mergeArr;
		}
	}
	if(typeof dataArr1 != "undefined" && dataArr1 != null && dataArr1.length>0)
	{
		if(typeof dataArr2 == "undefined" || dataArr2 == null || dataArr2.length ==0)
		{
			mergeArr =dataArr1;
		}
		else if(typeof dataArr2 != "undefined" && dataArr2 != null && dataArr2.length>0)
		{
			mergeArr =dataArr2;
			var isFun1InFun2 =false;
			for(var i=0; i<dataArr1.length; i++)
			{
				f_id1=dataArr1[i][0];
				isFun1InFun2 =false;
				for(var j=0;j<dataArr2.length;j++)
				{
					f_id2=dataArr2[j][0];
					if(f_id1 == f_id2)
					{
						isFun1InFun2 =true;
						break;
					}
				}
				if(!isFun1InFun2)
				{
					mergeArr.push(dataArr1[i]);
				}
			}
		 }
	}
	return mergeArr;
}

//设置角色权限下拉框
function setSelectedFunId(arr)
{
	var fun_arr=getAllFunId();
	//alert(fun_arr);
	//和新选择的权限选项合并
	fun_arr=mergeDataArr(arr,fun_arr);
	//alert(fun_arr);
	//重新设置fun_id的下拉选项内容
	var f_id,p_id,f_name;
	var option_html="";
	for(var i=0;i<fun_arr.length;i++)
	{
		f_id =fun_arr[i][0];
		p_id =fun_arr[i][1];
		f_name =fun_arr[i][2];
		option_html +="<option value=\""+f_id+"\">"+f_name+"</option>";
	}
	//alert(option_html);
	$("#fun_id").html(option_html);
}

//取得已选下拉框的全部选项
function getAllFunId()
{
	var listArr=new Array();
	$("#fun_id option").each(function(){
            var s_id =$(this).val();
            var s_arr;
            s_arr =getFun(s_id);
            listArr.push(s_arr);
     });
     return listArr;
}


//选择
function OnBtnAdd_Click()
{
	var selectArr = getSrcSelectvalue();
	setSelectedFunId(selectArr);
}

//选择全部
function OnBtnAddAll_Click()
{
	var option_html ="";
	var f_id,p_id,f_name;
	for(var i=0;i<funs.length;i++)
	{
		f_id =funs[i][0];
		f_name =funs[i][2];
		option_html +="<option value=\""+f_id+"\">"+f_name+"</option>";
	}
	$("#fun_id").html(option_html);
	
}

//移除选定的功能项
function OnBtnRemove_Click()
{
	var listArr=new Array();
	$("#fun_id option:selected").each(function(){
            var s_id =$(this).val();
            var s_arr =new Array();
            s_arr.push(getFun(s_id));
            getChildren(s_id,s_arr);
            listArr.push(s_arr);
     });
     //合并
     var mergeArr =new Array();
     for(var i=0;i<listArr.length;i++)
     {
     	mergeArr =mergeDataArr(mergeArr,listArr[i]);
     }
     //alert(mergeArr);
     listArr=new Array();
     $("#fun_id option").each(function(){
            $this =$(this);
            var s_id =$(this).val();
            var s_arr;
            for(var i=0;i<mergeArr.length;i++)
            {
            	var f_id =mergeArr[i][0];
            	if(f_id == s_id){
            		$this.remove();
            	}
            }
     });
     
     
}

//移除全部
function OnBtnRemoveAll_Click()
{
	var option_html ="";
	$("#fun_id").html(option_html);
}

function savePermission()
{
	if(typeof role_id =="undefined" || role_id == "")
	{
		alert("未选择角色，不能保存");
		return false;
	}
	//get fun_ids 
	var fun_ids ="";
	$("#fun_id option").each(function(){
		var s_id =$(this).val();
		if(fun_ids !="")
		{
			fun_ids +=",";
		}
		fun_ids +=s_id;
	});
	
	var url ="SaveRoleFun.do";
	var params={role_id:role_id, fun_id:fun_ids}
	$.ajax({
			url: url,
			type: "POST",
			data: params,
			dataType: "json",
			cache: false,
			beforeSend: function (XMLHttpRequest){
				$("#btSubmit").addClass("disabled");
			},
			success: function (data, textStatus){
				if(data.oForm.NUM >0){
				alert("操作成功");
					//window.parent.location.reload();
				}
				else
				alert('failure');
			},
			complete: function (XMLHttpRequest, textStatus){
				$("#btSubmit").removeClass("disabled");
			},
			error: function (){
				alert('保存权限出错');
			}
		});
}
</script>
</html>