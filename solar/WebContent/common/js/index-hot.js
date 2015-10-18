var URI="/paimaipage/site/index-hot-page.do";
//page 页码、page_size 每页显示条数、id 当前用户Id
var PageUrl =SITE_PATH+URI;
var TYPE_ID;//分类ID
var USER_ID =request("user_id");//搜索关键字
var FROM_USER =request("from_user");
//默认按出价次数从高到低排列 ，排列字段 出价次数、价格
/**
 * price_num current_price
 * asc desc 
 */
var orderByField ="price_num";
var orderByValue ="desc";
var OFFSET = 5;
var page = 1;
var page_size = 9;
var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
var maxScrollY = 0;
var hasMoreData = false;

document.addEventListener('touchmove', function(e) {
	e.preventDefault();
}, false);

document.addEventListener('DOMContentLoaded', function() {
	$(document).ready(function() {
		initPage();
		loadData();
	});
}, false);

//加载列表
function loadData(){
	pullDownEl = document.getElementById('pullDown');
	pullDownOffset = pullDownEl.offsetHeight;
	pullUpEl = document.getElementById('pullUp');
	pullUpOffset = pullUpEl.offsetHeight;
	hasMoreData = false;
	$("#pullUp").hide();
	pullDownEl.className = 'loading';
	pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';

	page = 1;
	TYPE_ID =$("#selected_type_id").val();
	var params ={page:page,page_size:page_size,type_id:TYPE_ID};
	$.ajax({
		type:"post",
		url:PageUrl,
		data:params,
		beforeSend: function (XMLHttpRequest){
		},
		success: function (data, textStatus){
			var code =data.code;
			appendData(data.oForm.LIST);
			var data_len = data.oForm.LIST.length;
			/**/
			if (data_len < page_size)
			{
				hasMoreData = false;
				$("#pullUp").hide();
			}
			else
			{
				hasMoreData = true;
				$("#pullUp").show();
			}
			
			myScroll = new iScroll('wrapper', {
					useTransition: true,
					topOffset: pullDownOffset,
					onRefresh: function() {
						if (pullDownEl.className.match('loading')) {
							pullDownEl.className = 'idle';
							pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉更新...';
							this.minScrollY = -pullDownOffset;
						}
						if (pullUpEl.className.match('loading')) {
							pullUpEl.className = 'idle';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉更新...';
						}
					},
					onScrollMove: function() {
						if (this.y > OFFSET && !pullDownEl.className.match('flip')) {
							pullDownEl.className = 'flip';
							pullDownEl.querySelector('.pullDownLabel').innerHTML = '释放更新...';
							this.minScrollY = 0;
						} else if (this.y < OFFSET && pullDownEl.className.match('flip')) {
							pullDownEl.className = 'idle';
							pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉更新...';
							this.minScrollY = -pullDownOffset;
						} 
						if (this.y < (maxScrollY - pullUpOffset - OFFSET) && !pullUpEl.className.match('flip')) {
							if (hasMoreData) {
								this.maxScrollY = this.maxScrollY - pullUpOffset;
								pullUpEl.className = 'flip';
								pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放更新...';
							}
						} else if (this.y > (maxScrollY - pullUpOffset - OFFSET) && pullUpEl.className.match('flip')) {
							if (hasMoreData) {
								this.maxScrollY = maxScrollY;
								pullUpEl.className = 'idle';
								pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉更新...';
							}
						}
					},
					onScrollEnd: function() {
						if (pullDownEl.className.match('flip')) {
							pullDownEl.className = 'loading';
							pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';
							refresh();
						}
						if (hasMoreData && pullUpEl.className.match('flip')) {
							pullUpEl.className = 'loading';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';
							nextPage();
						}
					}
				});
				myScroll.refresh();
				if (hasMoreData) {
					myScroll.maxScrollY = myScroll.maxScrollY + pullUpOffset;
				} else {
					myScroll.maxScrollY = myScroll.maxScrollY;
				}
				maxScrollY = myScroll.maxScrollY;
		},
		complete: function (XMLHttpRequest, textStatus){
		
		},
		error: function (){
		}
	});
}

function initPage(){
$type_item_list =$("[name='type_item']");
 		$category_item_list =$("[name='category_item']");
 		$type_item_list.click(function(obj){
 			$obj =$(this);
 			var selected_num =$obj.attr("data-num")
 			$("#selected_type_id").val(selected_num);
 			refresh();
			$type_item_list.removeClass("selected");
			$obj.addClass("selected");
			//设置category选项为选中状态
			$category_item_list.removeClass("selected");
			var current_id =selected_num;
			$.each($category_item_list, function (i,item){
				var c_id =$(item).attr("data-num");
				if(c_id == current_id){
					$(item).addClass("selected");
				}
			});
 		});
 		$switchBtn =$("#switchBtn");
 		$category_wrapper =$("#category_wrapper");
 		$switchBtn.click(function(){
 			var isHide =$(this).hasClass("hide");
 			if(isHide){
 				$(this).removeClass("hide");
 				$(this).addClass("show");
 				
 			}
 			else{
 				$(this).removeClass("show");
 				$(this).addClass("hide");
 			}
 			$category_wrapper.toggle("hidden");
 		});
 		$category_item_list.click(function(obj){
 			$obj =$(this);
 			var selected_num =$obj.attr("data-num")
 			$("#selected_type_id").val(selected_num);
 			refresh();
			$category_item_list.removeClass("selected");
			$obj.addClass("selected");
			//设置 type 选项为选中状态
			$type_item_list.removeClass("selected");
			var current_id =selected_num;
			$.each($type_item_list, function (i,item){
				var c_id =$(item).attr("data-num");
				if(c_id == current_id){
					$(item).addClass("selected");
				}
			});
 		});
}
//追加数据
function appendData(list){
	var total =list.length;
	var html ="";
	if(typeof total !="undefined" && total !="")
	{
		var is_div_end =true;
		$.each(list, function (i,item){
			if(i%3==0)
			{
				html +="<div class=\"search-goods-list-item\">";
				is_div_end =false;
			}
			html +="<a href=\"index-goods-detail.do?id="+item.ID+"&user_id="+USER_ID+"&from_user="+FROM_USER+"\">";
			html +="<div class=\"goods\"  >";
			html +="<div class=\"icon\"  >";
			if(typeof item.FILE_PATH == "undefined" || item.FILE_PATH == "")
			{
				html +="<img src=\""+BasePath+"common/images/goods_icon.jpg\" />";
			}
			else
			{
				html +="<img src=\""+item.FILE_PATH+"\" />";
			}
			html +="</div>";
			html +="<div class=\"title\"  title="+item.GOODS_NAME+">"+item.GOODS_NAME+"</div>";
			if(item.STATE == 1)
			{
				html +="<div class=\"price\"  >起拍价:<span>¥</span><span>"+item.BEGIN_PRICE+"</span></div>";
				html +="<div class=\"time\"  >距开始:<span>"+getTimeMinusOfHourMinute(item.START_TIME)+"</span></div>";
				html +="<div class=\"num prepare\" >";
				html +="<span class=\"num-span\">"+item.PRICE_NUM+"</span><span class=\"num-unit\">次</span><span>围观</span>";
			}
			else if(item.STATE == 2)
			{
				var cur_price ='';
				if(typeof item.CURRENT_PRICE == "undefined" || item.CURRENT_PRICE == "" )
				{
					cur_price =item.BEGIN_PRICE;
				}
				else
				{
					cur_price =item.CURRENT_PRICE;
				}
				html +="<div class=\"price\"  >当前价:<span>¥</span><span>"+cur_price+"</span></div>";
				html +="<div class=\"time\"  >距结束:<span>"+getTimeMinusOfHourMinute(item.END_TIME)+"</span></div>";
				html +="<div class=\"num current\" >";
				html +="<span class=\"num-span\">"+item.LOOK_NUM+"</span><span class=\"num-unit\">次</span><span>竞价中</span>";
			}
			else if(item.STATE == 0)
			{
				var cur_price ='';
				if(typeof item.CURRENT_PRICE == "undefined" || item.CURRENT_PRICE == "" )
				{
					cur_price =item.BEGIN_PRICE;
				}
				else
				{
					cur_price =item.CURRENT_PRICE;
				}
				html +="<div class=\"price\"  >成交价:<span>¥</span><span>"+cur_price+"</span></div>";
				html +="<div class=\"time\"  >已结束:<span></span></div>";
				html +="<div class=\"num close\" >";
				html +="<span class=\"num-span\">"+item.PRICE_NUM+"</span><span class=\"num-unit\">次</span><span>竞价</span>";
			}
			
			html +="</div>";
			html +="</div>";
			html +="</a>";
			if((i+1)%3==0)
			{
				html +="</div>";
				is_div_end =true;
			}
		});
		if(is_div_end == false)
		{
			html +="</div>";
		}
		$("#search-goods-list").append(html);
	}
	else
	{
		if(page == 1)
		{
			html ="<div style='margin:0 auto;width:60%;text-align: center;'>暂无数据</div>";
			$("#search-goods-list").html(html); 
		}
	}
}

/**
*下一页
**/
function nextPage() {
	page++;
	TYPE_ID =$("#selected_type_id").val();
	var params ={page:page,page_size:page_size,type_id:TYPE_ID};
	$.ajax({
		type:"post",
		url:PageUrl,
		data:params,
		beforeSend: function (XMLHttpRequest){
		},
		success: function (data, textStatus){
			appendData(data.oForm.LIST);
			var data_len = data.oForm.LIST.length;
			if (data_len < page_size) 
			{
				hasMoreData = false;
				$("#pullUp").hide();
			} 
			else
			{
				hasMoreData = true;
				$("#pullUp").show();
			}
			myScroll.refresh();
			if (hasMoreData) {
				myScroll.maxScrollY = myScroll.maxScrollY + pullUpOffset;
			} else {
				myScroll.maxScrollY = myScroll.maxScrollY;
			}
			maxScrollY = myScroll.maxScrollY;
		},
		complete: function (XMLHttpRequest, textStatus){
		
		},
		error: function (){
			alert('error');
		}
	});
}

/**
*刷新
**/
function refresh() {
	page=1;
	TYPE_ID =$("#selected_type_id").val();
	var params ={page:page,page_size:page_size,type_id:TYPE_ID};
	$.ajax({
		type:"post",
		url:PageUrl,
		data:params,
		beforeSend: function (XMLHttpRequest){
		},
		success: function (data, textStatus){
			$("#search-goods-list").html("");
			appendData(data.oForm.LIST);
			var data_len = data.oForm.LIST.length;
			if (data_len < page_size) 
			{
				hasMoreData = false;
				$("#pullUp").hide();
			} 
			else
			{
				hasMoreData = true;
				$("#pullUp").show();
			}
			myScroll.refresh();
			if (hasMoreData) {
				myScroll.maxScrollY = myScroll.maxScrollY + pullUpOffset;
			} else {
				myScroll.maxScrollY = myScroll.maxScrollY;
			}
			maxScrollY = myScroll.maxScrollY;
		},
		complete: function (XMLHttpRequest, textStatus){
		
		},
		error: function (){
			alert('error');
		}
	});
}

//获取数据的条数，如果服务器返回结果提示处理出错，则返回－1
function parseData(data)
{
	var data_num=0;
	if(data == "{[]}"){
		data ="{}";
	}
	var jsonVal =eval("("+data+")");
	var total =jsonVal.total;
	if(typeof total !="undefined" && total != "")
	{
		var list_data =jsonVal.rows;
		list_data =eval("("+list_data+")");
		data_num =list_data.length;
	}
	else
	{
		data_num =-1;
	}
	return data_num;
}