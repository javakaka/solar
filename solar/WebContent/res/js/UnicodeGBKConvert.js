var GB2312UnicodeConverter={
	ToUnicode:function(str){
	 return escape(str).toLocaleLowerCase().replace(/%u/gi,'\\u');
	}
	,ToGB2312:function(str){
	return unescape(str.replace(/\\u/gi,'%u'));
	}
};