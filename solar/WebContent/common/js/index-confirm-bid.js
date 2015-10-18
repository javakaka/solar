/* 提交出价 */
var URI="";
var PageUrl =SITE_PATH+"/paimaipage/site/save-confirm-bid.do";
var USER_ID =request("id");
var from_user =request("from_user");
var goods_id =request("goods_id");
var price =request("price");
var index =parent.layer.getFrameIndex(window.name);

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

}

//submit
function submitPost(){
	var params ={from_user: from_user,goods_id: goods_id,price: price};
	$.ajax({
		type:"post",
		url:PageUrl,
		data:params,
		beforeSend: function (XMLHttpRequest){
			$("#submitBtn").attr({"disabled":"disabled"});
		},
		success: function (ovo, textStatus){
			var code =ovo.code;
			if(code < 0 )
			{
				showMsg("提交出错",2);
				$("#submitBtn").removeAttr("disabled");
				return;
			}
			else
			{
				showMsg("操作成功",2);
				window.setTimeout(function(){ 
					window.parent.location.reload();
					},2000); 
			}
		},
		complete: function (XMLHttpRequest, textStatus){
		
		},
		error: function (){
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