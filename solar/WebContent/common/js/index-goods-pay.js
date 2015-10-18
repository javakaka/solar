$(function(){
	$pay_type_value =$("#pay_type_value");
	$pay_type_list =$("[name='pay_type']");
	$pay_type_list.click(function(obj){
		$this =$(this);
		$pay_type_list.removeClass("selected");
		$this.addClass("selected");
		$pay_type_value.val($this.attr("data-num"));
	});
 });
 	

function showClockSettingLayer()
{
	
}

function openLayer(url,w,h,title)
{
	$.layer({
	    type: 2,
	    shade: [0.5, '#f1f1f1'],
	    shadeClose: true,
	    border: [2, 0.3, '#000'],
	    fix: false,
	    title: title,
	    maxmin: false,
	    iframe: {src : url},
	    area: [w , h],
	    close: function(index){
	    }
	});
}