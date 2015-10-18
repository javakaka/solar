/* 设置提醒方式 */
var URI="";
var PageUrl ="";
var USER_ID =request("id");
var index =parent.layer.getFrameIndex(window.name);
var goods_id =request("goods_id");
var from_user =request("from_user");
var goods_id =request("goods_id");
document.addEventListener('DOMContentLoaded', function() {
	$(document).ready(function() {
		initPage();
	});
}, false);


function initPage(){
	
	$("#submitBtn").click(function(){
		submitPost();
	});
	
	$('#closeBtn').click(function(){
		closeFrame();
	});
	$('#telephone_btn').click(function(){
		var isGray =$(this).hasClass("gray-icon");
		if(isGray){
			$(this).removeClass("gray-icon");
			$(this).addClass("blue-icon");
			$("#telephone_setting").val('1');
		}
		else{
			$(this).removeClass("blue-icon");
			$(this).addClass("gray-icon");
			$("#telephone_setting").val('0')
		}
	});
	$('#wechat_btn').click(function(){
		var isGray =$(this).hasClass("gray-icon");
		if(isGray){
			$(this).removeClass("gray-icon");
			$(this).addClass("blue-icon");
			$("#wechat_setting").val('1');
		}
		else{
			$(this).removeClass("blue-icon");
			$(this).addClass("gray-icon");
			$("#wechat_setting").val('0')
		}
	});
	
	if(typeof telephone == "undefined" || telephone == "" )
	{
		if(confirm("为确保您收到短信提醒,请先设置您的手机号码"))
		{
			window.parent.location.href=SITE_PATH+"/paimaipage/site/index-user-profile.do?from_user="+from_user;
		}
	}
}

//submit
function submitPost(){
	var telephone_setting =$("#telephone_setting").val();
	var wechat_setting =$("#wechat_setting").val();
	if(telephone_setting == "0" && wechat_setting == "0" )
	{
		showMsg("未选中提醒项目",3);
		return;
	}
	var params ={goods_id: goods_id,from_user: from_user,telephone_setting: telephone_setting,wechat_setting: wechat_setting};
	var PageUrl =SITE_PATH+"/paimaipage/site/save-goods-remind.do"
	$.ajax({
		type:"post",
		url:PageUrl,
		data:params,
		beforeSend: function (XMLHttpRequest){
			$("#submitBtn").attr("disabled","disabled");
		},
		success: function (ovo, textStatus){
			var code =ovo.code;
			if(code >= 0)
			{
				showMsg("success",2);
				parent.location.reload();
				closeFrame();
			}
			else
			{
				showMsg(ovo.msg,2);
				$("#submitBtn").removeAttr("disabled");
			}
		},
		complete: function (XMLHttpRequest, textStatus){
		
		},
		error: function (){
			$("#submitBtn").removeAttr("disabled");
		}
	});
}

/**
 * check 
 * @param id
 */
function refreshParentPage()
{
	parent.location.reload();
	layer.msg('添加成功', 2, -1);
	closeFrame();
}

function closeFrame()
{
	parent.layer.close(index);
}