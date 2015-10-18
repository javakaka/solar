   function xuan(va)
{
   document.getElementById('#').innerHTML="";
   document.getElementById('#1').innerHTML="";
   document.getElementById('#2').innerHTML="";
   document.getElementById('#3').innerHTML="";
   document.getElementById('#4').innerHTML="";
	    if(va=='s')
	    {
		 document.getElementById('shouye').innerHTML="<span  style='color:#f64663; font-weight:bold;'>网站首页</span>";
		 self.location = "MasalaMain.jsp";
		}
		
		if(va=='z')
		{
			document.getElementById('#3').innerHTML="<a href='news.action?type=1'>产品新闻</a>";
            document.getElementById('#4').innerHTML="<a href='news.action?type=2'>公司新闻</a>";
		}
	if(va=='a'){
document.getElementById('#').innerHTML="<a href='product!getproduct.action?type=1'>行车记录仪</a>";	
document.getElementById('#1').innerHTML="<a href='product!getproduct.action?type=2'>平板电脑</a>";
document.getElementById('#2').innerHTML="<a href='product!getproduct.action?type=3'>机顶盒</a>";
document.getElementById('#3').innerHTML="<a href='product!getproduct.action?type=4'>广告机</a>";
document.getElementById('#4').innerHTML="<a href='product!getproduct.action?type=5'>电视</a>";
document.getElementById('#5').innerHTML="<a href='product!getproduct.action?type=6'>配件</a>";
	}
}

function subupdate(){
	var staff_id=document.getElementById('staff_id').value;
	var staff_name = document.getElementById('staff_name').value;
	var staff_real_name = document.getElementById('staff_real_name').value;
    var staff_password= document.getElementById('staff_password').value;
	var staff_status = "";
	var checks = document.getElementsByName('staff_status');
	for ( var i = 0; i < checks.length; i++) {
		if (checks[i].checked) {
			staff_status = checks[i].value;
		}
	}
	var staff_email = document.getElementById('staff_email').value;
	var staff_phone = document.getElementById('staff_phone').value;
	var staff_address = document.getElementById('staff_address').value;
	if (staff_name == null || "" == staff_name) {
		alert("用户名不能为空");
		return false;
	}
	if (staff_real_name == null || "" == staff_real_name) {
		alert("真实姓名不能为空");
		return false;
	}
	var href = "updateuser!updateuserbo.action?staff_name=" + staff_name + "&staff_real_name="
	+ staff_real_name + "&staff_status=" + staff_status+"&staff_id="+staff_id+"&staff_password="+staff_password
	+ "&staff_email=" + staff_email + "&staff_phone=" + staff_phone
	+ "&staff_address=" + staff_address ;
	location.href =href;
}

function submits() {
	var username = document.getElementById('username').value;
	var realname = document.getElementById('realname').value;
	var userpass = document.getElementById('userpass').value;
	var userpass2 = document.getElementById('userpass2').value;
	var isyh = "";
	var checks = document.getElementsByName('userType');
	for ( var i = 0; i < checks.length; i++) {
		if (checks[i].checked) {
			isyh = checks[i].value;
		}
	}
	var email = document.getElementById('Email').value;
	var telephone = document.getElementById('Telephone').value;
	var officephone = document.getElementById('OfficePhone').value;
	var address = document.getElementById('Address').value;
	var companame = document.getElementById('CompanyName').value;
	var Remark=document.getElementById('Remark').value;
	if (username == null || "" == username) {
		alert("用户名不能为空");
		return false;
	}
	if (realname == null || "" == realname) {
		alert("真实姓名不能为空");
		return false;
	}
	if (userpass == null ||  userpass =="") {
		alert("密码不能为空");
		return false;
	}
	if (userpass2 == null || userpass2 == "") {
		alert("确认密码不能为空");
		return false;
	}
	if (userpass != userpass2) {
		alert("两次输入的密码不一致！");
		return;
	}
	location.href = "users!adds.action?userName=" + username + "&name="
			+ realname + "&userPass=" + userpass + "&userType=" + isyh
			+ "&Email=" + email + "&Telephone=" + telephone + "&OfficePhone="
			+ officephone + "&Address=" + address + "&CompanyName=" + companame+"&Remark="+Remark;
}

function resets()
{
  history.go(-1);
}