<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/cctaglib" prefix="cc"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>创建消费订单</title>
<link href="<%=basePath%>/res/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/res/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/input.js"></script>
<script type="text/javascript" src="<%=basePath%>/res/js/datePicker/WdatePicker.js"></script>

</head>
<body>
	<div class="path">
		商家营业&raquo;优惠券消费
	</div>
	<form id="inputForm" action="save.do" method="post">
		<table  id="orderTableId" align="center" style="margin: 0 auto;">
		<tr>
			<th>
				消费券验证码
			</th>
			<th>
				数量
			</th>
		</tr>
		<tr>
			<td><input type="text" id="code1" name="code1" class="text" maxlength="200" value="" /></td>
			<td><input type="text" id="num1" name="num1" class="text" maxlength="200" value="" /></td>
		</tr>
		</table>
		<table  id="orderTableId" align="center" style="margin: 0 auto;">
		<tr>
			<td>
			<input type="button" id="submitBtn" class="button" value="提交" onclick="submitForm()"/>
			<input type="button" id="addItemBtn" class="button" value="添加" onclick="addTable()"/>
		</td>
		</tr>
		</table>
		</div>
	</form>
</body>
<script type="text/javascript">
var ITEM_NUM =1;

 function addTable()
{
	ITEM_NUM ++;
	var innerTD = "";
	innerTD +="<tr>";
	innerTD +="<td><input type=\"text\" id=\"code"+ITEM_NUM +"\" name=\"code"+ITEM_NUM +"\" class=\"text\" maxlength=\"200\" value=\"\" /></td>";
	innerTD +="<td><input type=\"text\" id=\"num"+ITEM_NUM +"\" name=\"num"+ITEM_NUM+"\" class=\"text\" maxlength=\"200\" value=\"\" /></td>";
	innerTD +="</tr>";
	$(innerTD).appendTo("#orderTableId");
 }
</script>
<script type="text/javascript">
var submit_param ="";
function submitForm()
{
	for(var i=1;i<=ITEM_NUM; i++)
	{
		var code_id ="code"+i;
		var num_id ="num"+i;
		var code_key="#"+code_id;
		var num_key="#"+num_id;
		var code =$(code_key).val();
		var num =$(num_key).val();
		if((typeof code !="undefined" && code !="")&&(typeof num !="undefined" && num !=""))
		{
			if(submit_param.length ==0)
			submit_param +=code+","+num;
			else
			{
				submit_param +=";"+code+","+num;
			}
		}
	}
	if(submit_param.length >0)
	{
		var commit =confirm("确认提交？请仔细核对数据："+submit_param);
		if(commit)
		{
			var params={data:submit_param};
			$.ajax({
					url: "<%=basePath%>cxhlpage/shop/coupon/saveOrder.do",
					type: "POST",
					data: params,
					dataType: "json",
					cache: false,
					beforeSend: function (XMLHttpRequest){
						$("#submitBtn").attr({"disabled":"disabled"});
					},
					success: function(ovo, textStatus) {
						var code =ovo.code;
						if(code >=0)
						{
							var v_id =ovo.oForm.ID;
							$.message("success","支付成功");
						}
						else
						{
							$.message("error",ovo.msg);
						}
					},
					complete: function (XMLHttpRequest, textStatus){
						$("#submitBtn").removeAttr("disabled");
					},
					error: function (){
						$("#submitBtn").removeAttr("disabled");
					}
				});
		}
	}
	submit_param ="";
}
</script>
</html>