var URI="/paimaipage/site/index-search-result-page.do";
//page 页码、page_size 每页显示条数、id 当前用户Id
var PageUrl =SITE_PATH+URI;
var TYPE_ID;//分类ID
var STATE_ID;//
var MIN_PRICE;//
var MAX_PRICE;//
var USER_ID =request("user_id");//搜索关键字
var FROM_USER =request("from_user");
var $submitBtn =$("#submitBtn");
document.addEventListener('touchmove', function(e) {
	e.preventDefault();
}, false);

document.addEventListener('DOMContentLoaded', function() {
	$(document).ready(function() {
		initPage();
	});
}, false);

function initPage(){
	$("[name='category_item']").click(function(obj){
			$obj =$(this);
			var selected_num =$obj.attr("data-num")
			$("#selected_category_id").val(selected_num);
			$("[name='category_item']").removeClass("selected");
			$obj.addClass("selected");
		});
		
	$("[name='state_item']").click(function(obj){
			$obj =$(this);
			var selected_num =$obj.attr("data-num")
			$("#selected_state_id").val(selected_num);
			$("[name='state_item']").removeClass("selected");
			$obj.addClass("selected");
		});
	$submitBtn.click(function(){
		TYPE_ID =$("#selected_category_id").val();
		STATE_ID =$("#selected_state_id").val();
		MIN_PRICE =$("#start_price_inp").val();
		MAX_PRICE =$("#end_price_inp").val();
		if(typeof MIN_PRICE == "undefined" || MIN_PRICE == "")
		{
			MIN_PRICE ="-1";
		}
		if(typeof MAX_PRICE == "undefined" || MAX_PRICE == "")
		{
			MAX_PRICE ="-1";
		}
		var url =SITE_PATH+"/paimaipage/site/index-search-result.do";
		url +="?type_id="+TYPE_ID;
		url +="&state="+STATE_ID;
		url +="&min_price="+MIN_PRICE;
		url +="&max_price="+MAX_PRICE;
		url +="&from_user="+FROM_USER;
		window.location.href =url;
	});
}